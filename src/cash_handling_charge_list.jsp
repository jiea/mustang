<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
	var datagrid;
	var cashType = [{"value":"1", "text":"金额"},{"value":"2", "text":"比例"}];
	$(function() {
		 datagrid=$('#datagrid').datagrid({
			url : '${app}/account/cashHandlingCharge/selectAll',
			title : '',
			border : false,
			fit : true,
			fitColumns: true,
			idField : 'id',
			singleSelect : true,
			columns : [[{
				field:'id',
				checkbox : true
			}, {
				field : 'cashType',
				title : '提现手续费类型',
				width : 40,
                editor:{
                    type:'combobox',
                    options:{
                    	data:cashType,
                        valueField:'value',
                        textField:'text',
                        required:true,
                        panelHeight:'auto'
                    }
                },
				formatter:function(value,rowData,rowIndex){
					
					if(value == '1'){
						return "金额";
					}else{
						return "比例";
					}
				}
			},{
				field : 'lowerLimit',
				title : '区间下限（元）',
				width : 60,
				editor:{type:'numberbox',options:{precision:2}, required:true}
			},{
				field : 'upperLimit',
				title : '区间上限（元）',
				width : 60,
				editor:{type:'numberbox',options:{precision:2}, required:true}
			},{
				field : 'handingCharge',
				title : '提现手续费（元）',
				width : 60,
				editor:{type:'numberbox',options:{precision:2}, required:true}
			},{
				field : 'handingChargeRate',
				title : '提现手续费比例',
				width : 40,
				editor:{type:'numberbox',options:{precision:6}, required:true}
			},{
				field : 'operate',
				title : '操作',
				width : 120,
				formatter:function(value,rowData,rowIndex){
					var e ="<a href='javascript:void(0);' onclick=editRow('"+rowIndex+"')>编辑</a>";
					var s ="<a href='javascript:void(0);' onclick=saveRow('"+rowIndex+"')>保存</a>";
					var c ="<a href='javascript:void(0);' onclick=cancelRow('"+rowIndex+"')>取消</a>";
					var sep = "&nbsp;|&nbsp;";
					if(rowData.editing){
						return s+sep+c;
					}else{
						return e;
					}
				}
			}]],
			onDblClickRow: function (index,row) {
				var select = $('#datagrid').datagrid('selectRow', index);
				select.datagrid('beginEdit', index);
			},
			onBeforeEdit:function(index,row){
				row.editing = true;
				updateActions(index);
			},
			onAfterEdit: function(index,row,changes){
				row.editing = false;
				updateActions(index);
				
				console.info(row);
				
				$.ajax({
		    		type: "POST",
		    	    data: row,
		    	    url: "${app}/account/cashHandlingCharge/updateCashHandlingCharge",
				    dataType:"json",
		    	    success: function(msg){
		    			if(msg.messageCode!="error"){
		    			   $.messager.show({
				 				title:'信息提示',
				 				msg:'保存成功',
				 				timeout:5000,
				 				showType:'slide'
				 			});
		    		    }else{
		    			   $.messager.show({
				 				title:'信息提示',
				 				msg:'保存失败',
				 				timeout:5000,
				 				showType:'slide'
				 			});
		    			   $('#datagrid').datagrid('cancelEdit', index);
		    		    }
		    	    }
			    });
				
			},
			onCancelEdit:function(index,row){
				row.editing = false;
				updateActions(index);
			}
		});
	});
	
	function updateActions(index){
		$('#datagrid').datagrid('updateRow',{
			index: index,
			row:{}
		});
	}
	
	function editRow(index){
		$('#datagrid').datagrid('beginEdit', index);
	}
	
	function saveRow(index){
		$('#datagrid').datagrid('endEdit', index);
	}
	
	function cancelRow(index){
		$('#datagrid').datagrid('cancelEdit', index);
	}
	
</script>
</head>
<body class="easyui-layout" data-options="fit:true" style="width: 100%; height: 100%;">
	<div data-options="region:'center'"  style="overflow: hidden;border:false;border-color:#D3D3D3 ;">
  		<table id="datagrid"></table>  
  	</div>
</body>
</html>