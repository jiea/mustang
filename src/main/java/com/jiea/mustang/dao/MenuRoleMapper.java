package com.jiea.mustang.dao;

import com.jiea.mustang.entity.MenuRole;

import java.util.List;

public interface MenuRoleMapper {
    /**
     * 批量插入
     * @param menuRoles 资源角色实体集合
     */
    void insertBatch(List<MenuRole> menuRoles);

    /**
     * 通过资源主键获取对应的角色主键
     * @param menuId    资源主键
     * @return          List<Integer>
     */
    List<Integer> getRoleIdsByMenuId(Integer menuId);

    /**
     * 根据资源主键删除资源角色关系
     * @param menuId    资源主键
     */
    void deleteByMenuId(Integer menuId);

    /**
     * 根据角色主键删除资源角色关系
     * @param roleId    角色主键
     */
    void deleteByRoleId(Integer roleId);
}