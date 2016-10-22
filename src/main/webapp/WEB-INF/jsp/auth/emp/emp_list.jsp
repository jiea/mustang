<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表</title>
<%@ include file="/WEB-INF/jsp/common/easyui.jsp"%>
</head>
<body class="easyui-layout">
	<div data-options="region:'north', border:false" class="search-div">
		<form id="empSearch">
			<table class="searchForm datagrid-toolbar">
				<tr>
					<td class="tdR" width="8%">员工姓名：</td>
					<td class="tdL" width="20%">
						<input type="text" class="easyui-textbox" id="empName" name="empName">
					</td>
					<td class="tdR" width="8%">员工编号：</td>
					<td class="tdL" width="20%">
						<input type="text" class="easyui-textbox" id="empNo" name="empNo">
					</td>
					<td class="tdR" width="8%">手机号：</td>
					<td class="tdL" width="20%">
						<input type="text" class="easyui-textbox" id="mobile" name="mobile">
					</td>
					<td rowspan="2" width="15%">
						<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-016',width:70,height:30" onclick="empSearch();">查&nbsp;询</a>
						&nbsp;&nbsp;&nbsp;
						<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-085',width:70,height:30" onclick="clearForm(empdg)">清&nbsp;空</a>
					</td>
				</tr>
				<tr>
					<td class="tdR">邮箱：</td>
					<td class="tdL" colspan="5">
						<input type="text" class="easyui-textbox" id="email" name="email">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center', border:false">
		<table id="empdg" style="width:100%;height:100%;"></table>
	</div>
	<div id="toolbar">
		<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-001',plain:true" onclick="toAddEmp();">添加</a>
		<span style="color:#999">|</span>
		<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-002',plain:true" onclick="toModifyEmp();">修改</a>
		<span style="color:#999">|</span>
		<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-036',plain:true" onclick="authorization();">用户授权</a>
		<span style="color:#999">|</span>
		<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-035',plain:true" onclick="resetPassword();">密码重置</a>
		<span style="color:#999">|</span>
		<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-033',plain:true" onclick="disableFun();">停用</a>
		<span style="color:#999">|</span>
		<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-034',plain:true" onclick="enabledFun();">启用</a>
		<span style="color:#999">|</span>
		<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-073',plain:true" onclick="openWorkGroupDialog();">设置工作组</a>
	</div>
	<div id="empDialog"></div>
	<script type="text/javascript">
		var empdg;
		var empSearch = $("#empSearch");
		var empDialog = $("#empDialog");
		$(function(){
			empdg = $("#empdg").datagrid({
				url : '${ctx}/emp/list',
				method : 'get',
				pagination : true,
				fit : true,
				toolbar : "#toolbar",
				singleSelect : true,
				rownumbers : true,
				striped : true,
				border : false,
				idField : 'id',
				columns : [[{
					field : 'id',
					checkbox : true
				},{
					field : 'empName',
					title : '姓名',
					width : '10%',
					align : 'center'
				},{
					field : 'gender',
					title : '性别',
					width : '5%',
					align : 'center',
					formatter: function(value){
						if (value == "1"){
							return "男";
						} else if (value == "2"){
							return "女";
						} else{
							return "";
						}
					}
				},{
					field : 'empNo',
					title : '员工编号',
					width : '10%',
					align : 'center'
				},{
					field : 'email',
					title : '邮箱',
					width : '15%'
				},{
					field : 'mobile',
					title : '手机号',
					width : '10%',
					align : 'center'
				},{
					field : 'tel',
					title : '固定电话',
					width : '10%',
					align : 'center'
				},{
					field : 'isAvailable',
					title : '是否有效',
					width : '5%',
					align : 'center',
					formatter: function(value){
						if (value == "1"){
							return "<span style='color:#698cba'>有效</span>";
						} else if (value == "0"){
							return "<span style='color:#d84f4b'>无效</span>";
						} else{
							return "";
						}
					}
				}]],
				onLoadError : function(){
					alertSysErrMsg();
				}
			});
			
		});
		
		// search
		function empSearch(){
			empdg.datagrid('load', serializeForm(empSearch));
			empdg.datagrid('clearSelections');
			empdg.datagrid('clearChecked');
		}
		
		// 添加
		function toAddEmp(){
			openEmpDialog('&nbsp;添加员工', 'icon-001', '${ctx}/emp/openEmpDialog');
		}

		// 修改
		function toModifyEmp(){
			var rows = empdg.datagrid('getSelections');
			if(rows.length > 0){
				if(rows.length > 1){
					showMsgSlide('请选择一条记录操作');
					return;
				}
				openEmpDialog('&nbsp;修改员工', 'icon-002', '${ctx}/emp/openEmpDialog');
			}else{
				showMsgSlide('请选择要修改的记录');
			}
		}

		// 打开添加修改弹层
		function openEmpDialog(titleType, imgType, url){
			empDialog = $("#empDialog").dialog({
				title : titleType,
				iconCls : imgType,
				width : '50%',
				height : '325px',
				maximizable : true,
				cache : false,
				href : url,
				closable : true,
				border : true
			});
		}
		
	</script>
</body>
</html>