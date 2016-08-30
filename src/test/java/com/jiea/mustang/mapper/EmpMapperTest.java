package com.jiea.mustang.mapper;

import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jiea.mustang.dao.EmpMapper;
import com.jiea.mustang.entity.Emp;

public class EmpMapperTest extends BaseTest{

	@Autowired
	private EmpMapper empMapper;
	
	@Test
	public void testInsertSelective(){
		Emp emp = new Emp();
		emp.setCreateTime(new Date());
		emp.setCreator(1);
		emp.setDeptId(2);
		emp.setEmail("123@163.com");
		emp.setEmpName("小明");
		emp.setEmpNo("121231");
		emp.setGender("1");
		emp.setIsAvailable("1");
		emp.setMemo("测试");
		emp.setMobile("13512312312");
		emp.setPassword("123123");
		emp.setTel("2312121212");
		
		empMapper.insertSelective(emp);
	}
}
