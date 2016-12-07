package com.jiea.mustang.service;

/**
 * Created by jiea on 2016/12/6.
 */
public interface MenuRoleService {

    /**
     * 菜单-角色 授权
     * @param menuId
     * @param roleIds
     */
    void menuRoleRelation(String menuId, String roleIds);
}
