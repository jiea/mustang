package com.jiea.mustang.dao;

import com.jiea.mustang.entity.EmpRole;

import java.util.List;

public interface EmpRoleMapper {

	/**
	 * 通过员工主键获取对应的角色主键
	 * @param empId 员工主键
	 * @return	List<Integer>
     */
	List<Integer> getRoleIdsByEmpId(Integer empId);

	/**
	 * 根据员工主键删除对应的员工角色关系
	 * @param empId
     */
	void deleteByEmpId(Integer empId);

	/**
	 * 批量插入
	 * @param empRoles	员工角色关系List
     */
	void insertBatch(List<EmpRole> empRoles);
}