package com.jiea.mustang.service;

import com.jiea.mustang.entity.Emp;

public interface EmpService {
	
	/**
	 * 根据员工编号查询员工信息
	 */
	Emp getEmpByEmpNo(String username);

}
