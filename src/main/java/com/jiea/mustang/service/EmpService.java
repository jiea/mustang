package com.jiea.mustang.service;

import java.util.Map;

import com.jiea.mustang.common.utils.Pagination;
import com.jiea.mustang.entity.Emp;

public interface EmpService {
	
	/**
	 * 根据员工编号查询员工信息
	 */
	Emp getEmpByEmpNo(String username);
	
	/**
	 * 获取员工分页列表
	 */
	Pagination getEmpList(Map<String, Object> conditions);

}
