package com.jiea.mustang.entity;

import java.util.Date;

public class MenuRole extends Entity {

    private Integer roleId;

    private Integer menuId;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public MenuRole() {
    }

    public MenuRole(Integer menuId, Date createTime, Integer creator) {
        this.menuId = menuId;
        this.createTime = createTime;
        this.creator = creator;
    }
}