<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>资源列表</title>
    <%@ include file="/WEB-INF/jsp/common/easyui.jsp" %>
</head>
<body class="easyui-layout" fit="true" style="width: 100%;height: 100%;">
<div data-options="region:'center',border:false" style="overflow: hidden;">
    <table id="menutg"></table>
</div>
<div id="toolbar">
    <a href="javascript:;" class="easyui-menubutton" data-options="menu:'#mm',iconCls:'icon-001',plain:true,width:120">添加</a>

    <div id="mm">
        <div onclick="toAddMenu('child');">子菜单</div>
        <div onclick="toAddMenu('parent');">根菜单</div>
    </div>
    <span style="color:#999">|</span>
    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-002',plain:true" onclick="toModifyMenu();">修改</a>
    <span style="color:#999">|</span>
    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-084',plain:true" onclick="toDeleteMenu();">删除</a>
    <span style="color:#999">|</span>
    <a href="javascript:void(0);" id="ec" style="float:right;padding:5px;" onclick="expandCollapseAll();">折叠</a>
</div>
<div id="menuDialog"></div>
<div id="iconDialog"></div>
<script type="text/javascript">
    var menutg;
    var iconDialog;
    var menuDialog;
    $(function () {
        menutg = $("#menutg").treegrid({
            url: '${path}/menu/getMenus',
            method : 'get',
            fit: true,
            animate: true,
            collapsible: true,
            toolbar: "#toolbar",
            singleSelect: true,
            rownumbers: true,
            border: false,
            idField: 'id',
            treeField: 'nameZh',
            columns: [[{
                field: 'id',
                checkbox: true
            }, {
                field: 'nameZh',
                title: '中文名称',
                width: '20%'
            }, {
                field: 'nameEn',
                title: '英文名称',
                width: '10%'
            }, {
                field: 'menuUrl',
                title: '菜单路径',
                width: '20%'
            }, {
                field: 'menuSort',
                title: '排序号',
                width: '10%'
            }, {
                field: 'memo',
                title: '备注',
                width: '15%'
            }]]
        });
    });

    // add menu
    function toAddMenu(addType) {
        if (addType == 'child') {
            var row = menutg.treegrid('getSelected');
            if (row == null) {
                alertMsg('请选择一个节点', 'warning');
            } else {
                openMenuDialog('添加子菜单', 'icon-001', '${ctx}/menu/openMenuDialog/add/child/' + row.id, '272px');
            }
        } else if (addType == 'parent') {
            openMenuDialog('添加根菜单', 'icon-001', '${ctx}/menu/openMenuDialog/add/parent/-1', '229px');
        }
    }

    // modify menu
    function toModifyMenu() {
        var row = menutg.treegrid('getSelected');
        if (row == null) {
            alertMsg('请选择一个节点', 'warning');
        } else {
            if (row.parentId == 0) {
                openMenuDialog('修改菜单', 'icon-002', '${ctx}/menu/openMenuDialog/modify/parent/' + row.id, '229px');
            } else {
                openMenuDialog('修改菜单', 'icon-002', '${ctx}/menu/openMenuDialog/modify/child/' + row.id, '272px');
            }
        }
    }

    // delete menu
    function toDeleteMenu() {
        var row = menutg.treegrid('getSelected');
        if (row == null) {
            alertMsg('请选择一个节点', 'warning');
        } else {
            if (menutg.treegrid('getChildren', row.id) != '') {
                alertMsg('请先删除这个节点下的子节点', 'warning');
            } else {
                $.messager.confirm('确认', '您确认删除<span style=\'color:red\'>&nbsp;' + row.nameZh + '&nbsp;</span>这个节点？', function (r) {
                    if (r) {
                        $.ajax({
                            type: 'post',
                            url: '${ctx}/menu/deleteMenu',
                            data: {id: row.id},
                            dataType: 'json',
                            beforeSend: function () {
                                $.messager.progress();
                            },
                            complete: function () {
                                $.messager.progress('close');
                            },
                            success: function (data) {
                                if (data.success) {
                                    menutg.treegrid('reload');
                                    menutg.treegrid('unselectAll');
                                    showSuccessMsgSlide();
                                } else {
                                    alertSysErrorMsg();
                                }
                            }
                        });
                    }
                });
            }
        }
    }

    function openMenuDialog(titleType, imgType, url, height) {
        menuDialog = $("#menuDialog").dialog({
            title: titleType,
            iconCls: imgType,
            width: '50%',
            height: height,
            cache: false,
            href: url,
            closable: true,
            modal: true
        });
    }

    function expandCollapseAll() {
        var $ec = $("#ec");
        if ($ec.text() == '折叠') {
            menutg.treegrid('collapseAll');
            $ec.text('展开');
        } else {
            menutg.treegrid('expandAll');
            $ec.text('折叠');
        }
    }

    //选择菜单图标
    function chooseIcon() {
        iconDialog = $('#iconDialog').dialog({
            width: '65%',
            height: '90%',
            title: '&nbsp;选择图标<sapn style="color:#0092DC">（双击图片选择）</span>',
            iconCls: 'icon-051',
            closable: true,
            cache: false,
            href: "${ctx}/menu/openIconDialog",
            modal: true
        });
    }
</script>
</body>
</html>