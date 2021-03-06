package com.jiea.mustang.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.jiea.mustang.dao.MenuRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiea.mustang.dao.MenuMapper;
import com.jiea.mustang.entity.Menu;
import com.jiea.mustang.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuMapper menuMapper;

    @Autowired
    private MenuRoleMapper menuRoleMapper;

    @Override
    public List<Menu> getLeftMenu() {
        List<Menu> menuList = new ArrayList<>();
        List<Menu> childMenuList = menuMapper.findMenuByEmpId(1);	//super.getEmp().getId()	// 查找所有子菜单

        if(childMenuList != null && childMenuList.size() != 0){
            List<Integer> menuPid = new ArrayList<>();
            for(Menu menu : childMenuList){
                menuPid.add(menu.getParentId());
            }
            List<Menu> parentMenuList = menuMapper.findMenuByParentId(menuPid);			// 根据parentId查询主菜单
            if(parentMenuList != null && parentMenuList.size() != 0){
                for(Menu parentMenu : parentMenuList){
                    List<Menu> childList = new ArrayList<>();
                    for(Menu childMenu : childMenuList){
                        if(parentMenu.getId().equals(childMenu.getParentId())){
                            childList.add(childMenu);
                        }
                    }
                    parentMenu.setChildren(childList);
                    menuList.add(parentMenu);
                }
            }
        }

        return menuList;
    }

    @Override
    public List<Menu> getMenus() {
        List<Menu> menuList = menuMapper.selectAllMenu();
        List<Menu> menus = this.getMenuList(menuList, 0);
        return menus;
    }

    @Override
    public Menu getMenuById(Integer id) {
        return menuMapper.getMenuById(id);
    }

    @Override
    public void addMenu(Menu menu) {
        menuMapper.insert(menu);
    }

    @Override
    public void updateMenuById(Menu menu) {
        menuMapper.updateMenuById(menu);
    }

    @Override
    public int verifyNameZh(String nameZh, Integer id) {
        return menuMapper.verifyNameZh(nameZh, id);
    }

    @Override
    public void deleteMenu(Integer id) {
        menuMapper.deleteMenu(id);
        // 删除资源与角色关系
        menuRoleMapper.deleteByMenuId(id);
    }

    private List<Menu> getMenuList(List<Menu> menuList, int id) {
        List<Menu> menus = new ArrayList<>();
        for(Menu menu : menuList){
            menu.setMenuIcon(menu.getMenuIcon());
            if(id == menu.getParentId()){
                menu.setChildren(getMenuList(menuList, menu.getId()));
                menus.add(menu);
            }
        }
        return menus;
    }


}
