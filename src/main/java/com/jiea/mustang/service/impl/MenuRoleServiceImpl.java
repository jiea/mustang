package com.jiea.mustang.service.impl;

import com.jiea.mustang.dao.MenuRoleMapper;
import com.jiea.mustang.entity.MenuRole;
import com.jiea.mustang.service.MenuRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by jiea on 2016/12/6.
 */
@Service("menuRoleService")
public class MenuRoleServiceImpl implements MenuRoleService {

    @Autowired
    private MenuRoleMapper menuRoleMapper;

    @Override
    public void menuRoleRelation(String menuId, String roleIds) {
        List<MenuRole> menuRoles = new ArrayList<MenuRole>();
        String[] roleIdArr = roleIds.split(",");
        for(String roleId : roleIdArr){
            MenuRole menuRole = new MenuRole();
            menuRole.setMenuId(Integer.parseInt(menuId));
            menuRole.setRoleId(Integer.parseInt(roleId));
            menuRole.setCreateTime(new Date());
            menuRole.setCreator(1);
            menuRoles.add(menuRole);
        }
        menuRoleMapper.insertBatch(menuRoles);
    }
}
