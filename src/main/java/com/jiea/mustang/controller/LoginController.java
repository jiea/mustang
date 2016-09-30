package com.jiea.mustang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("login")
public class LoginController extends BaseController {
	
	/**
	 *  跳转到登录页面
	 */
	@RequestMapping("to")
	public String to(){
		return "login";
	}
}
