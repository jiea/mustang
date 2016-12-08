package com.jiea.mustang.dao;

import com.jiea.mustang.entity.MenuRole;

import java.util.List;

public interface MenuRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MenuRole record);

    int insertSelective(MenuRole record);

    MenuRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MenuRole record);

    int updateByPrimaryKey(MenuRole record);

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
}