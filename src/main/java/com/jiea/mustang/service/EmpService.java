package com.jiea.mustang.service;

import com.jiea.mustang.dto.Paging;
import com.jiea.mustang.entity.Emp;

public interface EmpService {
	
	/**
	 * 根据员工编号查询员工信息
	 */
	Emp getEmpByEmpNo(String username);
	
	/**
	 * 获取员工分页列表
	 */
	Paging<Emp> getEmpList(Emp emp, Integer page, Integer rows);

	/**
	 * 新增员工
     */
	int insert(Emp emp);

}
