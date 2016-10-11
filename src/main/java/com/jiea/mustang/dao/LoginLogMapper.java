package com.jiea.mustang.dao;

import com.jiea.mustang.entity.LoginLog;

public interface LoginLogMapper {

	/**
	 * 新增登录日志
	 */
    int insertSelective(LoginLog record);
}