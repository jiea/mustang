package com.jiea.mustang.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jiea.mustang.dao.EmpRoleMapper;
import com.jiea.mustang.dao.MenuRoleMapper;
import com.jiea.mustang.dao.RoleMapper;
import com.jiea.mustang.dto.Paging;
import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiea.mustang.service.RoleService;

import java.util.List;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private MenuRoleMapper menuRoleMapper;

    @Autowired
    private EmpRoleMapper empRoleMapper;

    @Override
    public Paging<Emp> getRoleList(Role role, Integer page, Integer rows) {
        PageHelper.startPage(page, rows);
        List<Emp> list = roleMapper.getRoleList(role);
        return new Paging<>(((Page)list).getTotal(), list);
    }

    @Override
    public void updateRoleById(Role role) {
        roleMapper.updateByPrimaryKeySelective(role);
    }

    @Override
    public void add(Role role) {
        roleMapper.insertSelective(role);
    }

    @Override
    public int verifyRoleName(String roleName, Integer id) {
        return roleMapper.verifyRoleName(roleName, id);
    }

    @Override
    public void deleteRole(Integer roleId) {
        roleMapper.deleteRole(roleId);
        // 根据角色主键删除资源角色关系
        menuRoleMapper.deleteByRoleId(roleId);
        // 根据角色主键删除员工角色关系
        empRoleMapper.deleteByRoleId(roleId);
    }
}
