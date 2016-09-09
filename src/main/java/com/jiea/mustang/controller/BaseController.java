package com.jiea.mustang.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.jiea.mustang.entity.Emp;




@Controller
public class BaseController {
	
	protected HttpSession session;
	
	protected final Logger log = LoggerFactory.getLogger(getClass());
	
	protected Emp getEmp(){
		return (Emp) session.getAttribute("emp");
	}

	public HttpSession getSession() {
		return session;
	}


	public void setSession(HttpSession session) {
		this.session = session;
	}
	
}
