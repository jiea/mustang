package com.jiea.mustang.service;

import com.jiea.mustang.dto.Paging;
import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.entity.Role;

public interface RoleService {

    /**
     * 角色分页列表
     */
    Paging<Emp> getRoleList(Role role, Integer page, Integer rows);
}
