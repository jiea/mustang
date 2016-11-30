<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body class="easyui-layout">
<div data-options="region:'north', border:false" class="search-div">
    <form id="roleSearch">
        <table class="searchForm datagrid-toolbar" width="100%">
            <tr>
                <td class="tdR" width="10%">角色名称：</td>
                <td class="tdL" width="20%">
                    <input type="text" class="easyui-textbox" id="roleName" name="roleName" placeholder="角色名称">
                </td>
                <td rowspan="2" width="15%">
                    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-016',width:70,height:30" onclick="roleSearch();">查&nbsp;询</a>
                    &nbsp;&nbsp;&nbsp;
                    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-017',width:70,height:30" onclick="clearForm(roledg)">清&nbsp;空</a>
                </td>
            </tr>
        </table>
    </form>
</div>
<div data-options="region:'center', border:false" style="height: 90%">
    <table id="roledg"></table>
</div>
<div id="toolbar1">
    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-001',plain:true" onclick="append();">授权</a>
    <%--<span style="color:#999">|</span>--%>
    <%--<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-002',plain:true" onclick="edit();">编辑</a>--%>
    <%--<span style="color:#999">|</span>--%>
    <%--<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-018',plain:true" onclick="save();">保存</a>--%>
    <%--<span style="color:#999">|</span>--%>
    <%--<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-019',plain:true" onclick="reject();">取消</a>--%>
    <%--<span style="color:#999">|</span>--%>
    <%--<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-006',plain:true" onclick="remove();">删除</a>--%>
</div>
<script type="text/javascript">
    var roledg;
    $(function(){
        roledg = $('#roledg').datagrid({
            url : '${ctx}/role/list',
            method : 'get',
            pagination : true,
            fit : true,
            toolbar : '#toolbar1',
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
                width : '45%',
                editor:{
                    type:'textbox',
                    options:{
                        required:true
                    }
                }
            },{
                field : 'memo',
                title : '备注',
                width : '53%',
                editor:{
                    type:'textbox',
                    options:{
                        required:true
                    }
                }
            }]],
            onLoadError : function(){alertSysErrMsg();}
        });
    });

    // search
    function roleSearch(){
        roledg.datagrid('load', serializeForm($('#roleSearch')));
        roledg.datagrid('clearSelections');
        roledg.datagrid('clearChecked');
    }
</script>
</body>