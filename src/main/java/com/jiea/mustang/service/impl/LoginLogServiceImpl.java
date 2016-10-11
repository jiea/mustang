package com.jiea.mustang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiea.mustang.dao.LoginLogMapper;
import com.jiea.mustang.entity.LoginLog;
import com.jiea.mustang.service.LoginLogService;

@Service("loginLogService")
public class LoginLogServiceImpl implements LoginLogService {
	
	@Autowired
	private LoginLogMapper loginLogMapper;

	@Override
	public void add(LoginLog loginLog) {
		loginLogMapper.insertSelective(loginLog);
	}

}
