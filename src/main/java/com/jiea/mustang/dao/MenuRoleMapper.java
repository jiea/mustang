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
     * @param menuRoles
     */
    void insertBatch(List<MenuRole> menuRoles);
}