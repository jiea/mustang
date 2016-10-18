package com.jiea.mustang.service;

import com.jiea.mustang.entity.Emp;

import java.util.List;

public interface EmpService {
	
	/**
	 * 根据员工编号查询员工信息
	 */
	Emp getEmpByEmpNo(String username);
	
	/**
	 * 获取员工分页列表
	 */
	List<Emp> getEmpList(Emp emp, Integer page, Integer rows);

}
