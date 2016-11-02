<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
    $(function(){
        $('#empModifyDiv').fadeIn('fast');
    });
	function submitForm(){
		var empModifyForm = $('#empModifyForm');
        empModifyForm.form('submit', {
			url : '${ctx}/emp/modifyEmp',
			onSubmit : function(){
				if(empModifyForm.form('validate')){
					MaskUtil.mask();
					return true;
				}else{
					return false;
				}
			},
			success : function(data){
				var obj = eval('(' + data + ')');
				MaskUtil.unmask();
				if(obj.success){
					closeDialog(empAddModifyDialog);
                    empdg.datagrid('load');
                    showSuccessMsgSlide();
                }else{
                    alertMsg(obj.msg, 'error');
                }
			}
		});
	}
</script>
<div id="empModifyDiv" style="height: 100%; width: 100%; overflow: hidden; display: none;">
	<form id="empModifyForm" class="easyui-form" method="post">
        <input type="hidden" name="id" value="${id}"/>
		<table class="tableForm" border="0" width="100%">
			<tr>
				<td width="15%" class="tdR"><span style="color: red">*</span>姓名：</td>
				<td width="35%">
					<input type="text" id="name" name="empName" value="${emp.empName}" class="easyui-textbox" data-options="required:true,validType:'length[0,10]'" style="height: 30px;"/>
				</td>
				<td width="15%" class="tdR"><span style="color: red">*</span>性别：</td>
				<td width="35%">
					<input type="radio" id="sex_1" name="gender" value="1" <c:if test="${emp.gender == null || emp.gender == '1'}">checked="checked"</c:if>/><label for="sex_1">男</label>
					&nbsp;
					<input type="radio" id="sex_2" name="gender" value="0" <c:if test="${emp.gender == '2'}">checked="checked"</c:if>/><label for="sex_2">女</label>
				</td>
			</tr>
			<tr>
				<td class="tdR"><span style="color: red">*</span>邮箱：</td>
				<td>
					<input type="text" id="email" name="email" value="${emp.email}" class="easyui-textbox" data-options="required:true,validType:['email','length[0,30]']" style="height: 30px;"/>
				</td>
				<td class="tdR"><span style="color: red">*</span>员工编号：</td>
				<td>
					<input type="text" id="employeeNo" name="empNo" value="${emp.empNo}" class='easyui-numberbox' data-options="required:true,validType:'length[0,20]'" style="height: 30px;"/>
				</td>
			</tr>
			<tr>
				<td class="tdR">移动电话：</td>
				<td>
					<input type="text" id="mobile" name="mobile" value="${emp.mobile}" class="easyui-numberbox" data-options="validType:['mobileIsValid']" style="height: 30px;"/>
				</td>
				<td class="tdR">固定电话：</td>
				<td>
					<input type="text" id="telephone" name="tel" value="${emp.tel}" class="easyui-textbox" data-options="validType:['telephoneIsValid']" style="height: 30px;"/>
				</td>
			</tr>
<!-- 				<tr> -->
<!-- 					<td class="tdR"><span style="color: red">*</span>所属部门团队：</td> -->
<!-- 					<td colspan="3"> -->
<%-- 						<input type="hidden" id="deptId" name="deptId" value="${employee.deptId }"/> --%>
<%-- 						<span id="deptName" style="padding-left: 10px;">${deptName }</span> --%>
<!-- 						&nbsp;&nbsp; -->
<!-- 						<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-040'" onclick="selectDept();">选择部门</a> -->
<!-- 					</td> -->
<!-- 				</tr> -->
			<tr>
				<td class="tdR"><span style="color: red">*</span>开启状态:</td>
				<td colspan="3">
					<input type="radio" id="activatedState_1" name="isAvailable" value="1" <c:if test="${emp.isAvailable == null || emp.isAvailable == '1'}">checked="checked"</c:if>/><label for="activatedState_1">开启</label>
					&nbsp;
					<input type="radio" id="activatedState_2" name="isAvailable" value="0" <c:if test="${emp.isAvailable == '0'}">checked="checked"</c:if>/><label for="activatedState_2">停用</label>
				</td>
			</tr>
			<tr>
				<td class="tdR">备注:</td>
				<td colspan="3">
					<textarea id="remark" name="memo" class="easyui-textbox" data-options="multiline:true,validType:'length[0,50]'" style="width:300px;height:70px">${emp.memo}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<a href="javascript:;" class="easyui-linkbutton" id="submitBtn" iconCls="icon-011" onclick="submitForm();">提交</a>
					&nbsp;&nbsp;&nbsp;
					<a href="javascript:;" class="easyui-linkbutton" id="cancelBtn" iconCls="icon-013" onclick="closeDialog(empAddModifyDialog);">取消</a>
				</td>
			</tr>
		</table>
		<div id="deptDialog"></div>
	</form>
</div>
