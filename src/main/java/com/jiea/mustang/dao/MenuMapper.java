package com.jiea.mustang.dao;

import java.util.List;

import com.jiea.mustang.entity.Menu;

public interface MenuMapper {
	
	/**
	 * 通过用户主键查询菜单
	 */
	List<Menu> findMenuByEmpId(Integer empId);
	
	/*
	 * 通过父id查询菜单
	 */
	List<Menu> findMenuByParentId(List<Integer> menuPid);
}