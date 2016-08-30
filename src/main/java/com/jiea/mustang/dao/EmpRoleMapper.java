package com.jiea.mustang.dao;

import com.jiea.mustang.entity.EmpRole;

public interface EmpRoleMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(EmpRole record);

	int insertSelective(EmpRole record);

	EmpRole selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(EmpRole record);

	int updateByPrimaryKey(EmpRole record);
}