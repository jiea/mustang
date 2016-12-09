package com.jiea.mustang.dao;

import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {

    /**
     * 角色分页列表
     */
    List<Emp> getRoleList(Role role);

    /**
     * 根据主键更新
     */
    void updateByPrimaryKeySelective(Role role);

    /**
     * 新增
     */
    void insertSelective(Role role);

    /**
     * 验证角色名称是否重复
     */
    int verifyRoleName(@Param("roleName") String roleName, @Param("id") Integer id);

    /**
     * 删除角色
     * @param roleId 角色主键
     */
    void deleteRole(Integer roleId);
}