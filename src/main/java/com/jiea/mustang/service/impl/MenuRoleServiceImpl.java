package com.jiea.mustang.service.impl;

import com.jiea.mustang.dao.MenuRoleMapper;
import com.jiea.mustang.entity.MenuRole;
import com.jiea.mustang.service.MenuRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Service("menuRoleService")
public class MenuRoleServiceImpl implements MenuRoleService {

    @Autowired
    private MenuRoleMapper menuRoleMapper;

    @Override
    public void menuRoleRelation(Integer menuId, String roleIds) {
        menuRoleMapper.deleteByMenuId(menuId);
        List<MenuRole> menuRoles = new ArrayList<>();
        String[] roleIdArr = roleIds.split(",");
        for(String roleId : roleIdArr){
            MenuRole menuRole = new MenuRole(menuId, new Date(), 1);
            menuRole.setRoleId(Integer.parseInt(roleId));
            menuRoles.add(menuRole);
        }
        menuRoleMapper.insertBatch(menuRoles);
    }

    @Override
    public List<Integer> getRoleIdsByMenuId(Integer menuId) {
        return menuRoleMapper.getRoleIdsByMenuId(menuId);
    }

}
