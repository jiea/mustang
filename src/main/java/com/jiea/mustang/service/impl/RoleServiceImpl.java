package com.jiea.mustang.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
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

    @Override
    public Paging<Emp> getRoleList(Role role, Integer page, Integer rows) {
        PageHelper.startPage(page, rows);
        List<Emp> list = roleMapper.getRoleList(roleMapper);
        return new Paging<>(((Page)list).getTotal(), list);
    }
}
