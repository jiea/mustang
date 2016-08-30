package com.jiea.mustang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/emp")
public class EmpController {
	
	@RequestMapping(name="/list", method=RequestMethod.GET)
	public String list(){
		return "emp_list";
	}
}
