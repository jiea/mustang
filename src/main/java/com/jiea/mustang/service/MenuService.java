package com.jiea.mustang.service;

import java.util.List;

import com.jiea.mustang.entity.Menu;

public interface MenuService {

    /**
     * 加载左侧菜单
     */
    List<Menu> getLeftMenu();

    /**
     * 获取所有菜单
     */
    List<Menu> getMenus();

    /**
     * 根据主键查询菜单
     */
    Menu getMenuById(Integer id);

    /**
     * 新增菜单
     */
    void addMenu(Menu menu);

    /**
     * 根据主键修改菜单
     */
    void updateMenuById(Menu menu);

    /**
     * 检查中文名称是否重复
     */
    int verifyNameZh(String nameZh, Integer id);

    /**
     * 根据主键删除菜单
     */
    void deleteMenu(Integer id);
}
