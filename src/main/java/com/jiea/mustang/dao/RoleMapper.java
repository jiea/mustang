package com.jiea.mustang.dao;

import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.entity.Role;

import java.util.List;

public interface RoleMapper {

    /**
     * 角色分页列表
     */
    List<Emp> getRoleList(RoleMapper roleMapper);
}