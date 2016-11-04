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

    /**
     * 根据主键获取员工信息
     */
    Emp getEmpById(Integer id);

    /**
     * 修改员工信息
     */
    int modifyEmp(Emp emp);

    /**
     * 重置密码
     */
    void resetPassword(Emp emp);

    /**
     * 停用
     */
    void disable(Emp emp);

    /**
     * 启用
     */
    void enabled(Emp emp);
}
