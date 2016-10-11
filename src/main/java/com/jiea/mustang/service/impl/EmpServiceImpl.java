package com.jiea.mustang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiea.mustang.dao.EmpMapper;
import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.service.EmpService;

@Service("empService")
public class EmpServiceImpl implements EmpService {
	
	@Autowired
	private EmpMapper empMapper;

	@Override
	public Emp getEmpByEmpNo(String username) {
		return empMapper.getEmpByEmpNo(username);
	}

}
