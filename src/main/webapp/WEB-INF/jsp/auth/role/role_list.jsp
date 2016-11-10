<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>角色列表</title>
    <%@ include file="/WEB-INF/jsp/common/easyui.jsp"%>
</head>
<body class="easyui-layout">
<div data-options="region:'north', border:false" class="search-div">
    <form id="roleSearch">
        <table class="searchForm datagrid-toolbar" width="100%">
            <tr>
                <td class="tdR" width="8%">角色名称：</td>
                <td class="tdL" width="20%">
                    <input type="text" class="easyui-textbox" id="roleName" name="roleName">
                </td>
                <td rowspan="2" width="15%">
                    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-016',width:70,height:30" onclick="roleSearch();">查&nbsp;询</a>
                    &nbsp;&nbsp;&nbsp;
                    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-017',width:70,height:30" onclick="clearForm(empdg)">清&nbsp;空</a>
                </td>
            </tr>
        </table>
    </form>
</div>
<div data-options="region:'center', border:false">
    <table id="roledg" style="width:100%;height:100%;"></table>
</div>
<div id="roleAddModifyDialog"></div>
<script type="text/javascript">
    var roledg;
    var roleAddModifyDialog;
    $(function(){
        roledg = $('#roledg').datagrid({
            url : '${ctx}/role/list',
            method : 'get',
            pagination : true,
            fit : true,
            singleSelect : true,
            rownumbers : true,
            striped : true,
            border : false,
            idField : 'id',
            columns : [[{
                field : 'id',
                checkbox : true
            },{
                field : 'roleName',
                title : '角色名称',
                width : '30%',
                editor:{
                    type:'textbox',
                    options:{
                        required:true
                    }
                }
            },{
                field : 'memo',
                title : '备注',
                width : '30%',
                editor:{
                    type:'textbox',
                    options:{
                        required:true
                    }
                }
            }]],
            onDblClickCell : onDblClickCell,
            onEndEdit: onEndEdit,
            onLoadError : function(){alertSysErrMsg();}
        });
    });

    // search
    function roleSearch(){
        roledg.datagrid('load', serializeForm($('#roleSearch')));
        roledg.datagrid('clearSelections');
        roledg.datagrid('clearChecked');
    }

    var editIndex = undefined;
    function endEditing(){
        if(editIndex == undefined){
            return true;
        }
        if(roledg.datagrid('validateRow', editIndex)){
            roledg.datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        }else{
            return false;
        }
    }

    function onDblClickCell(index, field){
        if (editIndex != index){
            if (endEditing()){
                roledg.datagrid('selectRow', index).datagrid('beginEdit', index);
                var ed = roledg.datagrid('getEditor', {index:index,field:field});
                if (ed){
                    ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                }
                editIndex = index;
            } else {
                setTimeout(function(){
                    roledg.datagrid('selectRow', editIndex);
                },0);
            }
        }
    }

    function onEndEdit(index, row){
        var ed = $(this).datagrid('getEditor', {
            index: index,
            field: 'productid'
        });
        row.productname = $(ed.target).combobox('getText');
    }





    // 添加
    function toAddEmp(){
        openEmpDialog('&nbsp;添加员工', 'icon icon-001', '${ctx}/emp/toAddEmp');
    }

    // 修改
    function toModifyEmp(){
        var rows = empdg.datagrid('getSelections');
        if(rows.length > 0){
            if(rows.length > 1){
                showMsgSlide('请选择一条记录操作');
                return;
            }
            openEmpDialog('&nbsp;修改员工', 'icon icon-002', '${ctx}/emp/toModifyEmp/'+rows[0].id);
        }else{
            showMsgSlide('请选择要修改的记录');
        }
    }

    // 打开修改弹层
    function openEmpDialog(titleType, imgType, url){
        empAddModifyDialog = $('#empAddModifyDialog').dialog({
            title : titleType,
            iconCls : imgType,
            width : '50%',
            height : '325px',
            maximizable : false,
            draggable : false,
            cache : false,
            href : url,
            closable : true,
            border : true,
            modal : true
        });
    }


</script>
</body>
</html>