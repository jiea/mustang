package com.jiea.mustang.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiea.mustang.entity.Menu;
import com.jiea.mustang.service.MenuService;

@RequestMapping("/menu")
public class MenuController extends BaseController{
	
	@Autowired
	private MenuService menuService;
	
	
	/**
	 * 	菜单格式：
	 * [{"menuid":"1","icon":"icon-sys","menuname":"控件使用",
			"menus":[
					{"menuid":"12","menuname":"疯狂秀才","icon":"icon-add","url":"http://hxling.cnblogs.com"},
					{"menuid":"13","menuname":"用户管理","icon":"icon-users","url":"demo2.html"},
					{"menuid":"14","menuname":"角色管理","icon":"icon-role","url":"demo2.html"},
					{"menuid":"15","menuname":"权限设置","icon":"icon-set","url":"demo.html"},
					{"menuid":"16","menuname":"系统日志","icon":"icon-log","url":"demo1.html"}
				]
		},{"menuid":"8","icon":"icon-sys","menuname":"员工管理",
			"menus":[{"menuid":"21","menuname":"员工列表","icon":"icon-nav","url":"demo.html"},
					{"menuid":"22","menuname":"视频监控","icon":"icon-nav","url":"demo1.html"}
				]
		},{"menuid":"56","icon":"icon-sys","menuname":"部门管理",
			"menus":[{"menuid":"31","menuname":"添加部门","icon":"icon-nav","url":"demo1.html"},
					{"menuid":"32","menuname":"部门列表","icon":"icon-nav","url":"demo2.html"}
				]
		},{"menuid":"28","icon":"icon-sys","menuname":"财务管理",
			"menus":[{"menuid":"41","menuname":"收支分类","icon":"icon-nav","url":"demo.html"},
					{"menuid":"42","menuname":"报表统计","icon":"icon-nav","url":"demo1.html"},
					{"menuid":"43","menuname":"添加支出","icon":"icon-nav","url":"demo2.html"}
				]
		},{"menuid":"39","icon":"icon-sys","menuname":"商城管理",
			"menus":[{"menuid":"51","menuname":"商品分类","icon":"icon-nav","url":"demo.html"},
					{"menuid":"52","menuname":"商品列表","icon":"icon-nav","url":"demo1.html"},
					{"menuid":"53","menuname":"商品订单","icon":"icon-nav","url":"demo2.html"}
				]
		}]
	 */
	
	/**
	 * 加载菜单
	 */
	@ResponseBody
	@RequestMapping("/load")
	public List<Menu> load(){
		List<Menu> menuList = new ArrayList<>();
		List<Menu> childMenuList = menuService.findMenuByEmpId(super.getEmp().getId());		// 查找所有子菜单
		
		if(childMenuList != null && childMenuList.size() != 0){
			List<Integer> menuPid = new ArrayList<>();
			for(Menu menu : childMenuList){
				menuPid.add(menu.getParentId());
			}
			List<Menu> parentMenuList = menuService.findMenuByParentId(menuPid);			// 根据parentId查询主菜单
			if(parentMenuList != null && parentMenuList.size() != 0){
				for(Menu parentMenu : parentMenuList){
					List<Menu> childList = new ArrayList<>();
					for(Menu childMenu : childMenuList){
						if(parentMenu.getId().equals(childMenu.getParentId())){
							childList.add(childMenu);
						}
					}
					parentMenu.setMenus(childList);
					menuList.add(parentMenu);
				}
			}
		}
		return menuList;
	}
	
}
