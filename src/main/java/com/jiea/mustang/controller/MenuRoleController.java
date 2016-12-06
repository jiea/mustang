package com.jiea.mustang.controller;

import com.jiea.mustang.service.MenuRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by jiea on 2016/12/6.
 */

@Controller
@RequestMapping("menuRole")
public class MenuRoleController {

    @Autowired
    private MenuRoleService menuRoleService;

    /**
     * 菜单-角色 授权
     * @return
     */
    @RequestMapping(value = "menuRoleRelation", method = RequestMethod.POST)
    public String menuRoleRelation(@RequestParam("menuIds") String menuIds,
                                   @RequestParam("roleIds") String roleIds){
        menuRoleService.menuRoleRelation(menuIds, roleIds);

        return null;
    }
}
