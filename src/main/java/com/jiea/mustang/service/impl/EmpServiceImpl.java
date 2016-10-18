package com.jiea.mustang.service.impl;

import com.github.pagehelper.PageHelper;
import com.jiea.mustang.dao.EmpMapper;
import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("empService")
public class EmpServiceImpl implements EmpService {

	@Autowired
	private EmpMapper empMapper;

	@Override
	public Emp getEmpByEmpNo(String username) {
		return empMapper.getEmpByEmpNo(username);
	}

	@Override
	public List<Emp> getEmpList(Emp emp, Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		List<Emp> list = empMapper.getEmpList(emp);
		return list;
	}

}
