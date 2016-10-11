<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.setAttribute("ctx", request.getContextPath());
%>
<%@ include file="/WEB-INF/jsp/common/easyui.jsp"%>
<html>
<head>
<meta charset="utf-8">
<title>用户登录</title>
<style type="text/css">
body {
	background: #eeeeee repeat-x left top;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

body, table, td, div {
	font-size: 12px;
	line-height: 24px;
}

.textfile {
	background: url(${path}/static/img/bg_login_textfile.gif) no-repeat left top;
	padding: 0px 2px;
	height: 29px;
	width: 143px;
	border: 0;
	line-height: 29px;
}

#chkcode {
	border: 1px double #bfd7f0;
	height: 27px;
	width: 60px;
	line-height: 27px;
}
</style>
</head>
<body>
	<table width="95" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td><div style="margin-top: 150px"></div></td>
		</tr>
		<tr>
			<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td style="background:url('${ctx}/static/img/bg_form.jpg');background-size:410px 185px;background-repeat:no-repeat;">
							<form id="userlogin" method="post" action="${app }/admin/j_spring_security_check">
								<table width="370" border="0" align="center" cellpadding="0" cellspacing="0" style="padding-top: 6px;">
									<tr height="35px">
										<td align="right" width="90">用户名：</td>
										<td width="165">
											<label>
												<input id="username" name="username" type="text" class="easyui-textbox" iconCls='icon-man' style="width: 165px; height: 28px;" />
											</label>
										</td>
										<td><label id="usernamelabel"></label></td>
									</tr>
									<tr height="35px">
										<td align="right" width="90">密 码：</td>
										<td>
											<label>
												<input id="password" name="password" type="password" class="easyui-textbox" iconCls='icon-lock' style="width: 165px; height: 28px;" autocomplete="off" disableautocomplete />
											</label>
										</td>
										<td><label id="passwordlabel"></label></td>
									</tr>
									<tr height="35px">
										<td align="right" width="90">验证码：</td>
										<td>
											<div style="width: 70px; height: 25px; float: left; margin-right: 12px;">
												<input style="width: 70px; height: 25px;" id="captcha" class="easyui-textbox" maxlength="4" />
											</div>
											<div style="width: 70px; height: 25px; float: left;">
												<img id="loginimg" name="loginimg" style="width: 70px; height: 25px; cursor: pointer;" src="${ctx}/captcha/getCaptcha" title='看不清，单击更改' onclick="changeCaptcha();" border="0" />
											</div>
										</td>
										<td><label id="captchalabel"></label></td>
									</tr>
									<tr height="30px">
										<td>&nbsp;</td>
										<td>
											<label> 
												<input onclick="login()" type="button" style="cursor:pointer;width:64px; height:25px;  border:0;background:url('${ctx}/static/img/btn_login.gif')" />
												&nbsp; 
												<input onclick="reset()" type="button" style="cursor:pointer;width:64px; height:25px;  border:0;background:url('${ctx}/static/img/btn_reset.gif')" />
											</label>
										</td>
										<td>&nbsp;</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
					<tr>
						<td><br> <br> <br></td>
					</tr>
					<tr align="center">
						<td>@Mustang</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	// 字段验证 
	function validate(username, password, captcha) {
		var flag = true;
		if (username.length == 0) {
			flag = false;
			showerror("usernamelabel", "请输入用户名");
			return flag;
		} else {
			$("#usernamelabel").html('');
		}
		if (password.length == 0) {
			flag = false;
			showerror("passwordlabel", "请输入密码");
			return flag;
		} else {
			$("#passwordlabel").html('');
		}
		if(captcha.length == 0){
			flag = false;
			showerror("captchalabel", "请输入验证码");
			return flag;
		} else {
			$("#captchalabel").html('');
		}

		return flag;
	}
	// 登录
	function login() {
		var username = $("#username").val();
		var password = $("#password").val();
		var captcha = $("#captcha").val();
		if (validate(username, password, captcha)) {
			$.post('${ctx}/login/do', {username: username, password: password, captcha: captcha}, function(data){
				if(!data.success){
					changeCaptcha();
					switch(data.code){
					case '-1':
						alert(data.msg);
						break;
					case '1':
						showerror("captchalabel", data.msg);
						break;
					case '2':
						showerror("usernamelabel", data.msg);
						break;
					}
				}else{
					window.location.href="${ctx}";
				}
			}, 'json');
		}
	}
	// 重置
	function reset() {
		$("#username").textbox('setValue', '');
		$("#password").textbox('setValue', '');
		$("#captcha").textbox('setValue', '');
	}
	//回车登录
	$(document).keydown(function(event) {
		if (event.keyCode == 13) {
			login();
		}
	});
	// 变更验证码
	function changeCaptcha() {
		$("#loginimg").attr("src", "${ctx}/captcha/getCaptcha?v=" + new Date().getTime());
	}
	// 错误提示
	function showerror(id, info) {
		$("#" + id).html("<font color='red'>&nbsp;× " + info + "</font>");
	}
</script>

</html>