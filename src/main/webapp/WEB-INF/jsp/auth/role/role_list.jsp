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
<div id="toolbar">
    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-001',plain:true" onclick="append();">添加</a>
    <span style="color:#999">|</span>
    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-002',plain:true" onclick="edit();">编辑</a>
    <span style="color:#999">|</span>
    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-018',plain:true" onclick="save();">保存</a>
    <span style="color:#999">|</span>
    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-006',plain:true" onclick="remove();">删除</a>
</div>
<div id="roleAddModifyDialog"></div>

<script type="text/javascript">
    var roledg;
    var roleAddModifyDialog;
    // 当前编辑的行
    var editIndex = undefined;
    $(function(){
        roledg = $('#roledg').datagrid({
            url : '${ctx}/role/list',
            method : 'get',
            pagination : true,
            fit : true,
            toolbar : '#toolbar',
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
            onDblClickRow : onDblClickRow,
            onAfterEdit: onAfterEdit,
            onLoadError : function(){alertSysErrMsg();}
        });
    });

    // search
    function roleSearch(){
        getChanges();
//        roledg.datagrid('load', serializeForm($('#roleSearch')));
//        roledg.datagrid('clearSelections');
//        roledg.datagrid('clearChecked');
    }



    // 编辑
    function edit() {
        var row = roledg.datagrid('getSelections');
        if (row.length > 0) {
            if (row.length > 1) {
                showMsgSlide('请选择一条记录进行编辑');
                return;
            } else {
                var rowIndex = roledg.datagrid('getRowIndex', row[0]);
                if (editIndex == rowIndex) {
                    return;
                }
                if (editIndex != undefined) {
                    roledg.datagrid('rejectChanges', editIndex).datagrid('endEdit', editIndex);
                }
                editIndex = rowIndex;
                roledg.datagrid('beginEdit', editIndex);
            }
        } else {
            showMsgSlide('请选择要编辑的记录');
        }
    }

    // 保存
    function save(){
        roledg.datagrid("endEdit", editIndex);
    }

    // 双击行
    function onDblClickRow(index) {
        if (editIndex != undefined) {
            roledg.datagrid('rejectChanges', editIndex).datagrid('endEdit', editIndex);
        }
        editIndex = index;
        roledg.datagrid('beginEdit', index);
    }

    // 编辑完成之后执行（执行endEdit方法之后，执行onAferEdit方法）
    function onAfterEdit(){
        var changes = roledg.datagrid('getChanges');
        if(changes.length != 0){
            $.post('${ctx}/role/', '', );
        }
    }

    function accept(){
        if(endEditing()){
            roledg.datagrid();
        }
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