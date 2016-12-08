package com.jiea.mustang.service;

import java.util.List;

public interface MenuRoleService {

    /**
     * 菜单-角色 授权
     * @param menuId    资源主键
     * @param roleIds   角色主键集合
     */
    void menuRoleRelation(String menuId, String roleIds);

    /**
     * 通过资源主键获取对应的角色主键
     * @param menuId 资源主键
     * @return List<Integer>
     */
    List<Integer> getRoleIdsByMenuId(Integer menuId);
}
