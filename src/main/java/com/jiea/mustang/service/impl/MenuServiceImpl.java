package com.jiea.mustang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiea.mustang.dao.MenuMapper;
import com.jiea.mustang.entity.Menu;
import com.jiea.mustang.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuMapper menuMapper;

	@Override
	public List<Menu> findMenuByEmpId(Integer empId) {
		return menuMapper.findMenuByEmpId(empId);
	}

	@Override
	public List<Menu> findMenuByParentId(List<Integer> menuPid) {
		return menuMapper.findMenuByParentId(menuPid);
	}

}
