package com.jiea.mustang.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiea.mustang.common.utils.Pagination;
import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.service.EmpService;

@Controller
@RequestMapping("emp")
public class EmpController {
	
	@Autowired
	private EmpService empService;
	
	/**
	 * 跳转至员工列表
	 */
	@RequestMapping(value="", method=RequestMethod.GET)
	public String to(){
		return "auth/emp/emp_list";
	}
	
	@ResponseBody
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list(@RequestParam("paeg") Integer page, @RequestParam("rows") Integer rows,
			@ModelAttribute("emp") Emp emp) {
		Map<String, Object> conditions = this.getConditions(page, rows, emp); 
		Pagination pagination = empService.getEmpList(conditions);
		
		return null;
	}
	
	/**
	 * 打开员工添加修改层
	 */
	@RequestMapping(value="openEmpDialog", method=RequestMethod.GET)
	public String openEmpDialog(){
		return "auth/emp/emp_input";
	}
	
	/**
	 * 组装查询条件
	 */
	private Map<String, Object> getConditions(Integer page, Integer rows, Emp emp){
		Map<String, Object> conditions = new HashMap<>();
		conditions.put("page", page);
		conditions.put("pageSize", rows);
		if(emp != null){
			conditions.put("empName", emp.getEmpName());
			conditions.put("empNo", emp.getEmpNo());
			conditions.put("email", emp.getEmail());
			conditions.put("mobile", emp.getMobile());
		}
		return conditions;
	}
}
