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
<div data-options="region:'center', border:false" style="height: 87%">
    <table id="roledg"></table>
</div>
<div id="toolbar1">
    <a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon icon-010',plain:true" onclick="accredit();">授权</a>
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
            onLoadError : function(){alertSysErrMsg();},
            onLoadSuccess : function(){
                var roleIds = ${roleIds};
                for(var i in roleIds){
                    $('#roledg').datagrid('selectRecord', roleIds[i]);
                }
            }
        });
    });

    // 查找
    function roleSearch() {
        roledg.datagrid('load', serializeForm($('#roleSearch')));
        roledg.datagrid('clearSelections');
        roledg.datagrid('clearChecked');
    }

    // 授权
    function accredit(){
        var empId = '${empId}';
        var rows = roledg.datagrid('getSelections');
        if(rows.length <= 0){
            showMsgSlide('请选择角色');
        }else{
            var roleIds = '';
            $.each(rows, function(i, row){
                roleIds += row.id + ',';
            });
            roleIds = roleIds.substring(0, roleIds.length-1);
            $.ajax({
                type: 'post',
                url: '${ctx}/empRole/empRoleRelation',
                data: {empId: empId, roleIds: roleIds},
                dataType: 'json',
                beforeSend: function () {
                    MaskUtil.mask();
                },
                complete: function () {
                    MaskUtil.unmask();
                },
                success: function (data) {
                    if (data.success) {
                        showMsgSlide("授权成功");
                        closeDialog(accreditDiglog);
                    } else {
                        alertMsg(data.msg, 'error');
                    }
                }
            });
        }
    }
</script>
</body>