package com.jiea.mustang.controller;

import com.jiea.mustang.common.constants.SystemConst;
import com.jiea.mustang.dto.Rtn;
import com.jiea.mustang.entity.Menu;
import com.jiea.mustang.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("menu")
public class MenuController extends BaseController{
	
	@Autowired
	private MenuService menuService;
	
	/**
	 * 加载左侧菜单
	 */
	@ResponseBody
	@RequestMapping(value = "load", method = RequestMethod.GET)
	public List<Menu> load(){
        List<Menu> leftMenus = null;
        try {
            leftMenus = menuService.getLeftMenu();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return leftMenus;
	}

    /**
     * 跳转至菜单列表
     */
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String to(){
        return "auth/menu/menu_list";
    }

    /**
     * 获取菜单列表
     */
    @ResponseBody
    @RequestMapping(value = "getMenus", method = RequestMethod.GET)
    public List<Menu> getMenus(){
        List<Menu> menus = menuService.getMenus();
        return menus;
    }

    /**
     * 打开新增/修改菜单窗口
     */
    @RequestMapping(value = "openMenuDialog/{addType}/{nodeType}/{id}", method = RequestMethod.GET)
    public String openMenuDialog(@PathVariable("addType") String addType, @PathVariable("nodeType") String nodeType, @PathVariable("id") Integer id, Model model) {
        if ("add".equals(addType)) {
            // 如果id=-1则为父菜单
            if(id != -1){
                model.addAttribute("parentId", id);
            }
        } else if ("modify".equals(addType)) {
            Menu menu = menuService.getMenuById(id);
            model.addAttribute("menu", menu);
        }
        model.addAttribute("nodeType", nodeType);

        return "auth/menu/menu_input";
    }

    /**
     * 新增或修改菜单
     */
    @ResponseBody
    @RequestMapping(value = "addModifyMenu", method = RequestMethod.POST)
    public Rtn addModifyMenu(Menu menu){
        if (menu != null) {
            try {
                // 添加
                if (menu.getId() == null) {
                    menu.setCreateTime(new Date());
                    menu.setCreator(1);
                    menuService.addMenu(menu);
                } else {
                    // 修改
                    menu.setOperateTime(new Date());
                    menu.setOperator(1);
                    menuService.updateMenuById(menu);
                }
                return new Rtn(true);
            } catch (Exception e) {
                log.error(e.getMessage(), e);
                return new Rtn(false, SystemConst.ERROR);
            }
        }else{
            return new Rtn(false, "Menu实体为空");
        }
    }

    /**
     * 验证中文名称是否存在
     */
    @ResponseBody
    @RequestMapping(value = "verifyNameZh", method = RequestMethod.POST)
    public Rtn verifyNameZh(@RequestParam("val") String nameZh, @RequestParam("id") Integer id){
        try {
            int count = menuService.verifyNameZh(nameZh, id);
            if (count > 0) {
                return new Rtn(false, "中文名称已存在");
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return new Rtn(false, SystemConst.ERROR);
        }
        return new Rtn(true);
    }

    /**
     * 根据主键删除菜单
     */
    @ResponseBody
    @RequestMapping(value = "deleteMenu", method = RequestMethod.POST)
    public Rtn deleteMenu(@RequestParam("id") Integer id){
        try {
            menuService.deleteMenu(id);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return new Rtn(false, SystemConst.ERROR);
        }

        return new Rtn(true);
    }

    /**
     * 打开选择图片弹窗
     */
    @RequestMapping(value = "openIconDialog", method = RequestMethod.GET)
    public String openIconDialog(){
        return "auth/menu/icon";
    }

}
