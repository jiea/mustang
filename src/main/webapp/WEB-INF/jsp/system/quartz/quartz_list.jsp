<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Quartz列表</title>
      <%@ include file="/WEB-INF/jsp/common/easyui.jsp"%>
	<script type="text/javascript">
		var quartzJobDatagrid;
		var quartzJobDialog;
		
		var jobName;
		var jobGroup;
		var triggerName;
		var triggerGroup;
		
		$(function(){
			quartzJobDatagrid = $('#quartzJobDatagrid').datagrid({
				url : '${app}/quartz/pages',
				title : '',
				fit : true,
				pagination : true,

				toolbar : "#toolbar",
				border : false,
				nowrap : false,
				striped : true,
				rownumbers : true,
				singleSelect : true,
				columns : [[{
					field : 'id',
					checkbox : true
				},{
					field : 'TRIGGER_NAME',
					title : 'TRIGGER 名称',
					width : '9%'
				},{
					field : 'TRIGGER_GROUP',
					title : 'TRIGGER 组',
					width : '9%'
				},{
					field : 'TRIGGER_DESCRIPTION',
					title : 'TRIGGER 描述',
					width : '10%'
				},{
					field : 'JOB_NAME',
					title : 'JOB 名称',
					width : '9%'
				},{
					field : 'JOB_GROUP',
					title : 'JOB 组',
					width : '9%'
				},{
					field : 'JOB_DESCRIPTION',
					title : 'JOB 描述',
					width : '10%'
				},{
					field : 'JOB_CLASS_NAME',
					title : 'JOB CLASS',
					width : '20%'
				},{
					field : 'CRON_EXPRESSION',
					title : 'CRON 表达式',
					width : '9%',
					align : 'center'
				},{
					field : 'TRIGGER_TYPE',
					title : 'TRIGGER 类型',
					width : '9%',
					align : 'center'
				},{
					field : 'TRIGGER_STATE',
					title : 'TRIGGER 状态',
					width : '9%',
					align : 'center'
				},{
					field : 'NEXT_FIRE_TIME',
					title : '下次执行时间',
					width : '11%',
					align : 'center'
				},{
					field : 'PREV_FIRE_TIME',
					title : '上次执行时间',
					width : '11%',
					align : 'center',
					formatter : function(value,rowData,rowIndex){
						if(value == '1970-01-01 08:00:00'){
							return '0';
						}else{
							return value;
						}
					}
				},{
					field : 'END_TIME',
					title : '结束时间',
					width : '11%',
					align : 'center'
				},{
					field : 'PRIORITY',
					title : '优先级',
					width : '5%',
					align : 'center'
				}]],
				onDblClickRow : function(index, row){
					jobName = row.JOB_NAME;
					jobGroup = row.JOB_GROUP;
					triggerName = row.TRIGGER_NAME;
					triggerGroup = row.TRIGGER_GROUP;
					toShowQuartzLog();
				}
			});
			
			$('#triggerJobGroup').combobox({
		        url : '${app}/app/quartz/json/trigger_job_group.json',
		        valueField : 'id',
		        textField : 'text',
		        editable : false,
				panelHeight : 'auto'
	        });
			
		});
		
		// 新增 simpletrigger Job
		function toAddSimpleQuartzJob(){
			openQuartzJobDialog("icon-lock-add", "&nbsp;新增<span style='color: red'>SIMPLE</span> TRIGGER JOB", "${app}/quartz/openQuartzJobDialog/simple", "simpleQuartzJobDialog");
		}
		
		// 新增 crontrigger Job
		function toAddCronQuartzJob(){
			openQuartzJobDialog("icon-lock-add", "&nbsp;新增<span style='color: red'>CRON</span> TRIGGER JOB", "${app}/quartz/openQuartzJobDialog/cron", "cronQuartzJobDialog");
		}
		
		// 修改 crontrigger Job
		function toModifyCronQuartzJob(){
			var selectRow = getSelectedRow();
			if(selectRow == null){
				showMsgSlide("请选择将要修改的CRON作业");
			}else if(selectRow.TRIGGER_TYPE == "SIMPLE"){
				alertMsg("SIMPLE作业暂时不能修改", "info");
			}else{
				var triggerJob = JSON.stringify(selectRow);
				openQuartzJobDialog("icon-lock-edit", "&nbsp;修改<span style='color: red'>CRON</span> TRIGGER JOB", "${app}/quartz/openQuartzJobDialog/cron/?triggerJob=" + encodeURI(encodeURI(triggerJob)), "cronQuartzJobDialog");
			}
		}
		
		// 打开 quartzJobDialog
		function openQuartzJobDialog(imgType, titleType, urlType, dialogType){
			quartzJobDialog = $("#"+dialogType+"").dialog({
				modal : true,
				iconCls : imgType,
				title : titleType,
				width : '60%',
				height : 450,
				method : 'post',
				maximizable : true,
				cache : false,
				href : urlType,
				closable : true,
				border : false
			});
		}
		
		// 操作触发器
		function handleTrigger(handleType, triggerName, triggerGroup){
			$.ajax({
				type : 'post',
				dataType : 'html',
				async : false,
				url : "${app}/quartz/handleTrigger" ,
				data : {
					'triggerName' : triggerName, 
					'triggerGroup' : triggerGroup,
					'handleType' : handleType
				},
				success : function(data){
					var obj = eval("(" + data + ")");
					parent.refreshTab("${app}/quartz/toQuartzJobList?messageCode=" + obj.messageCode, "定时调度");
				},
				error : function(){
					alertSysErrorMsg();
				}
			});
		}
		
		// 获得数据表格 
		function getSelectedRow(){
			return quartzJobDatagrid.datagrid('getSelected');
		}
		
		// 暂停触发器
		function toPauseTrigger(){
			var selectRow = getSelectedRow();
			if(selectRow == null){
				showMsgSlide("请选择将要暂停的作业");
			}else if(selectRow.TRIGGER_STATE == "暂停中"){
				alertMsg("暂停中的作业不能操作暂停", "info");
			}else{
				handleTrigger("pause", selectRow.TRIGGER_NAME, selectRow.TRIGGER_GROUP);
			}
		}
		
		// 恢复触发器
		function toResumeTrigger(){
			var selectRow = getSelectedRow();
			if(selectRow == null){
				showMsgSlide("请选择将要恢复的作业");
			}else if(selectRow.TRIGGER_STATE != "暂停中"){
				alertMsg("非暂停中的作业不能操作恢复", "info");
			}else{
				handleTrigger("resume", selectRow.TRIGGER_NAME, selectRow.TRIGGER_GROUP);
			}
		}
		
		// 删除触发器
		function toUnscheduleJob(){
			var selectRow = getSelectedRow();
			if(selectRow == null){
				showMsgSlide("请选择将要删除的作业");
			}else{
				$.messager.confirm('请确认', '您确认要删除该作业', function(r){
					if (r){
						handleTrigger("unschedule", selectRow.TRIGGER_NAME, selectRow.TRIGGER_GROUP);
					}
				});
			}
		}
		
		// TRIGGER名称不能重复
		function checkTriggerName(triggerName, id){
			var result = "";
			$.ajax({
				type : 'post',
				dataType : 'html',
				async : false,
				url : "${app}/quartz/checkTriggerName/" + triggerName,
				data : {
					'id' : id, 
				},
				success : function(data){
					result = data;
				},
				error : function(){
					alertSysErrorMsg();
				}
			});
			
			if('S' == result){
				return true;
			}else{
				$.messager.alert('提示信息', 'TRIGGER 名称不能重复', "info");
				return false;
			}
		}
		
		// JOB名称不能重复
		function checkJobName(jobName, id){
			var result = "";
			$.ajax({
				type : 'post',
				dataType : 'html',
				async : false,
				url : "${app}/quartz/checkJobName/" + jobName,
				data : {
					'id' : id, 
				},
				success : function(data){
					result = data;
				},
				error : function(){
					alertSysErrorMsg();
				}
			});
			
			if('S' == result){
				return true;
			}else{
				$.messager.alert('提示信息', 'Job 名称不能重复', "info");
				return false;
			}
		}
		
		// Quartz 日志
		function toShowQuartzLog(){
			quartzLogDialog = $("#quartzLogDialog").dialog({
				modal : true,
				iconCls : 'icon-ocument-letter',
				title : '&nbsp;Quartz 日志',
				width : '60%',
				height : 450,
				maximizable : true,
				method : "post",
				queryParams : {
					jobName : jobName,
					jobGroup : jobGroup,
					triggerName : triggerName,
					triggerGroup : triggerGroup
				},
				cache : false,
				href : '${app}/quartz/openQuartzLogDialog',
				closable : true,
				border : false
			});
		}
		
		//搜索
		function searchFun() {
			quartzJobDatagrid.datagrid('load', serializeObject($("#searchForm")));
		}
		
		// 提交
		function submitForm(urlType, handleType){
			var quartzJobForm = $("#quartzJobForm");
			quartzJobForm.form('submit',{
				url : '${app}' + urlType,
				onSubmit : function(){
					if(quartzJobForm.form("validate")){
						var id = $("#id").val() == undefined?"":$("#id").val();
						if(handleType == "simple"){
							if(checkTriggerName($("#stName").val(), id) && checkJobName($("#jobNameSt").val(), id)){
								if(compareTime()){
									openMask();
									return true;
								}else{
									return false
								}
							}else{
								return false;
							}
						}else{
							if(checkTriggerName($("#cronName").val(), id) && checkJobName($("#jobNameCron").val(), id)){
								openMask();
								return true;
							}else{
								return false;
							}
						}
					}else{
						return false;
					}
				},
				success : function(data){
					closeMask();
					var obj = eval("(" + data + ")");
					quartzJobDialog.dialog('close');
					parent.refreshTab("${app}/quartz/toQuartzJobList?messageCode=" + obj.messageCode, "定时调度");
				}
			});
		}
	</script>
  </head>
  <body class="easyui-layout" fit="true" style="width: 100%;height: 100%;">
  	<div region="north" border="false" style="height:35px; overflow:hidden;">
  		<form id="searchForm">
	  		<table border="0" class="searchForm datagrid-toolbar" width="100%">
	  			<tr>
					<td class="tdR" width="15%">TRIGGER/JOB 分组:</td>
					<td width="15%">
						<input id="triggerJobGroup" class="easyui-combobox" name="triggerJobGroup" style="width: 150px;height: 24px;"/>
					</td>
					<td class="tdR" width="10%">TRIGGER 名称:</td>
					<td width="15%">
						<input id="triggerNames" name="triggerNames" class="easyui-textbox" data-options="valueField:'id',textField:'text',validType:['length[0,200]']" style="width: 150px;height: 24px;"/>
					</td>
					<td class="tdR" width="10%">JOB 名称:</td>
					<td width="15%">
						<input id="jobNames" name="jobNames" class="easyui-textbox" data-options="validType:['length[0,200]']" style="width: 150px;height: 24px;"/>
					</td>
					<td width="*%">
						<a class="easyui-linkbutton" iconCls="icon-search" onclick="searchFun()">查询</a>
						&nbsp;&nbsp;
						<a class="easyui-linkbutton" iconCls="icon-clear" onclick="clearForm(quartzJobDatagrid);">清空</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
  	<div region="center" border="false" style="overflow: hidden;">
  		<table id="quartzJobDatagrid"></table>  
  	</div>
 	<div id="toolbar" style="display: none;">
  		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-lock-add',plain:true" onclick="toAddSimpleQuartzJob();">新增<span style="color: red">SIMPLE</span> TRIGGER JOB</a>
		<img src="${app}/images/separator.jpg" style="vertical-align: middle; *margin-top: -4px">
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-lock-add',plain:true" onclick="toAddCronQuartzJob();">新增<span style="color: red">CRON</span> TRIGGER JOB</a>
		<img src="${app}/images/separator.jpg" style="vertical-align: middle; *margin-top: -4px">
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-lock-edit',plain:true" onclick="toModifyCronQuartzJob();">修改<span style="color: red">CRON</span> TRIGGER JOB</a>
		<img src="${app}/images/separator.jpg" style="vertical-align: middle; *margin-top: -4px">
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-lock-pause',plain:true" onclick="toPauseTrigger();">暂停</a>
		<img src="${app}/images/separator.jpg" style="vertical-align: middle; *margin-top: -4px">
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-lock-play',plain:true" onclick="toResumeTrigger();">恢复</a>
		<img src="${app}/images/separator.jpg" style="vertical-align: middle; *margin-top: -4px">
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-lock-delete',plain:true" onclick="toUnscheduleJob();">删除</a>
		<img src="${app}/images/separator.jpg" style="vertical-align: middle; *margin-top: -4px">
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ocument-letter',plain:true" onclick="toShowQuartzLog();">Quartz 日志</a>
	</div>
	<div id="simpleQuartzJobDialog"></div>
	<div id="cronQuartzJobDialog"></div>
	<div id="quartzLogDialog"></div>
  </body>
</html>
