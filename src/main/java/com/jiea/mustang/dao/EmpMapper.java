package com.jiea.mustang.dao;

import com.jiea.mustang.entity.Emp;

public interface EmpMapper {
	
	/**
	 * 有条件插入
	 */
	int insertSelective(Emp record);
	
	/**
	 * 根据员工编号查询员工信息
	 */
	Emp getEmpByEmpNo(String username);
}