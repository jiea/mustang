package com.jiea.mustang.dao;

import com.jiea.mustang.entity.Emp;

public interface EmpMapper {
	
	int insertSelective(Emp record);
}