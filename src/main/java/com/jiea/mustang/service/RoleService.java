package com.jiea.mustang.service;

import com.jiea.mustang.dto.Paging;
import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.entity.Role;

public interface RoleService {

    /**
     * 角色分页列表
     */
    Paging<Emp> getRoleList(Role role, Integer page, Integer rows);

    /**
     * 根据主键修改
     */
    void updateRoleById(Role role);

    /**
     * 新增
     */
    void add(Role role);

    /**
     * 验证角色名称是否重复
     */
    int verifyRoleName(String roleName, Integer id);
}
