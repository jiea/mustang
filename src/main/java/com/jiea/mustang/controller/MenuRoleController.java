package com.jiea.mustang.controller;

import com.jiea.mustang.common.constants.SystemConst;
import com.jiea.mustang.dto.Rtn;
import com.jiea.mustang.service.MenuRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by jiea on 2016/12/6.
 */

@Controller
@RequestMapping("menuRole")
public class MenuRoleController extends BaseController{

    @Autowired
    private MenuRoleService menuRoleService;

    /**
     * 菜单-角色 授权
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "menuRoleRelation", method = RequestMethod.POST)
    public Rtn menuRoleRelation(@RequestParam("menuId") String menuId,
                                @RequestParam("roleIds") String roleIds){
        try {
            menuRoleService.menuRoleRelation(menuId, roleIds);
            return new Rtn(true);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return new Rtn(false, SystemConst.ERROR);
        }
    }
}
