<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>资源列表</title>
    <%@ include file="/WEB-INF/jsp/common/easyui.jsp" %>
</head>
<body class="easyui-layout" data-options="fit:true" style="width: 100%;height: 100%;">
<div data-options="region:'center',border:false" style="overflow: hidden;">
    <table id="menutg"></table>
</div>
<div id="toolbar">
    <a href="javascript:;" class="easyui-menubutton" data-options="menu:'#mm',iconCls:'icon icon-001',plain:true,width:120">添加</a>
    <div id="mm">
        <div onclick="toAddMenu('child');">子菜单</div>
        <div onclick="toAddMenu('parent');">根菜单</div>
    </div>
    <span style="color:#999">|</span>
    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon icon-002',plain:true" onclick="toModifyMenu();">修改</a>
    <span style="color:#999">|</span>
    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon icon-006',plain:true" onclick="toDeleteMenu();">删除</a>
    <span style="color:#999">|</span>
    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon icon-015',plain:true" onclick="toAccredit();">授权</a>
    <a href="javascript:void(0);" id="ec" style="float:right;padding:5px;" onclick="expandCollapseAll();">折叠</a>
</div>
<div id="menuDialog"></div>
<div id="iconDialog"></div>
<div id="accreditDiglog"></div>
<script type="text/javascript">
    var menutg;
    var iconDialog;
    var menuDialog;
    var accreditDiglog;
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
                openMenuDialog('添加子菜单', 'icon icon-001', '${ctx}/menu/openMenuDialog/add/child/' + row.id);
            }
        } else if (addType == 'parent') {
            openMenuDialog('添加根菜单', 'icon icon-001', '${ctx}/menu/openMenuDialog/add/parent/-1');
        }
    }

    // modify menu
    function toModifyMenu() {
        var row = menutg.treegrid('getSelected');
        if (row == null) {
            alertMsg('请选择一个节点', 'warning');
        } else {
            if (row.parentId == 0) {
                openMenuDialog('修改菜单', 'icon icon-002', '${ctx}/menu/openMenuDialog/modify/parent/' + row.id, '229px');
            } else {
                openMenuDialog('修改菜单', 'icon icon-002', '${ctx}/menu/openMenuDialog/modify/child/' + row.id, '272px');
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
                                MaskUtil.mask();
                            },
                            complete: function () {
                                MaskUtil.unmask();
                            },
                            success: function (data) {
                                if (data.success) {
                                    menutg.treegrid('reload');
                                    menutg.treegrid('unselectAll');
                                    showSuccessMsgSlide();
                                } else {
                                    alertMsg(data.msg, 'error');
                                }
                            }
                        });
                    }
                });
            }
        }
    }

    // 菜单新增修改弹层
    function openMenuDialog(titleType, imgType, url) {
        menuDialog = $('#menuDialog').dialog({
            title: titleType,
            iconCls: imgType,
            width: '50%',
            height: '229px',
            cache: false,
            href: url,
            closable: true,
            modal: true
        });
    }

    // 授权弹层
    function toAccredit(){
        accreditDiglog = $('#accreditDiglog').dialog({
            title: '资源授权',
            iconCls: 'icon icon-015',
            width: '60%',
            height: '65%',
            cache: false,
            href: '${ctx}/role/toRoleResource',
            closeable: true,
            modal: true
        });
    }

    // 折叠/展开
    function expandCollapseAll() {
        var $ec = $('#ec');
        if ($ec.text() == '折叠') {
            menutg.treegrid('collapseAll');
            $ec.text('展开');
        } else {
            menutg.treegrid('expandAll');
            $ec.text('折叠');
        }
    }
</script>
</body>
</html>