<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div id="div" border="false" style="height: 100%; width: 100%; overflow: hidden; display: none">
	 	<form id="menuForm" class="easyui-form" method="post">
	 		<input type="hidden" name="parentId" id="parentId" value="${menu.parentId }">
	 		<input type="hidden" name="id" id="id" value="${menu.id }">
			<table class="tableForm" border="0" width="100%" height="100%">
				<tr>
					<td width="15%" class="tdR"><span style="color: red">*</span>中文名称：</td>
					<td width="35%">
						<input type="text" id="nameZh" name="nameZh" value="${menu.nameZh }" class="easyui-textbox" data-options="required:true,validType:'length[0,20]'" style="height: 30px;"/>
					</td>
					<td width="15%" class="tdR"><span style="color: red">*</span>英文名称：</td>
					<td width="35%">
						<input type="text" id="nameEn" name="nameEn" value="${menu.nameEn }" class="easyui-textbox" data-options="required:true,validType:['length[0,20]','hasRepateData[\'${path }/menu/verifyNameEn\', ${menu.id}]']" style="height: 30px;"/>
					</td>
				</tr>
				<%--<tr>--%>
					<%--<td class="tdR"><span style="color: red">*</span>菜单图标：</td>--%>
					<%--<td>--%>
						<%--<input type="text" id="menuIcon" name="menuIcon" value="${menu.menuIcon }" class="easyui-textbox" data-options="required:true,editable:false,buttonIcon:'icon-051',onClickButton:function(){chooseIcon()}" style="height: 30px;"/>--%>
					<%--</td>--%>
					<%--<td class="tdR">排序号：</td>--%>
					<%--<td>--%>
						<%--<input type="text" id="menuSort" name="menuSort" value="${menu.menuSort }" class="easyui-numberbox" style="height: 30px;"/>--%>
					<%--</td>--%>
				<%--</tr>--%>
				<c:if test="${nodeType == 'child'}">
				<tr>
					<td class="tdR"><span style="color: red">*</span>菜单路径：</td>
					<td colspan="3">
						<input type="text" id="menuUrl" name="menuUrl" value="${menu.menuUrl }" class="easyui-textbox" data-options="required:true,validType:'length[0,50]'" style="width:300px;height: 30px;"/>
					</td>
					
				</tr>
				</c:if>
				<tr>
					<td class="tdR">备注:</td>
					<td colspan="3">
						<textarea id="memo" name="memo" class="easyui-textbox" data-options="multiline:true,validType:'length[0,50]'" style="width:300px;height:60px">${menu.memo }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-011" onclick="submitForm();">提交</a>
						&nbsp;&nbsp;&nbsp;
						<a href="javascript:;" class="easyui-linkbutton" iconCls="icon-013" onclick="closeDialog(menuDialog);">取消</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		$.parser.onComplete = function() {
            dialogEffect("div");
		}
		var parentId = '${parentId}';
		function submitForm(){
			var menuForm = $("#menuForm");
			menuForm.form('submit', {
				url : '${path}/menu/addModifyMenu',
				onSubmit : function(){
					if(parentId != ''){
						$("#parentId").val(parentId);
					}
					<%--if(!hasRepeat('${path }/menu/verifyNameZh', $("#nameZh").val(), $("#id").val())){--%>
						<%--alertMsg("中文名称已存在", "warning");--%>
						<%--return false;--%>
					<%--}--%>
					<%--if(!hasRepeat('${path }/menu/verifyNameEn', $("#nameEn").val(), $("#id").val())){--%>
						<%--alertMsg("英文名称已存在", "warning");--%>
						<%--return false;--%>
					<%--}--%>
					if(menuForm.form("validate")){
                        MaskUtil.mask();
						return true;
					}else{
						return false;
					}
				},
				success : function(data){
					var obj = eval("(" + data + ")");
					MaskUtil.unmask();
					if(obj.success){
						showSuccessMsgSlide();
						closeDialog(menuDialog);
						menutg.treegrid('reload');
					}else{
                        alertMsg(obj.msg, 'error');
					}
				}
			});
		}
	</script>
