package com.jiea.mustang.controller;

import com.jiea.mustang.common.constants.SystemConst;
import com.jiea.mustang.dto.Rtn;
import com.jiea.mustang.service.MenuRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("menuRole")
public class MenuRoleController extends BaseController{

    @Autowired
    private MenuRoleService menuRoleService;

    /**
     * 跳转至资源授权列表（资源-角色）
     */
    @RequestMapping(value = "toRoleResource", method = RequestMethod.GET)
    public String toRoleResource(@RequestParam("menuId") String menuId, Model model){
        // 通过资源主键获取对应的角色主键
        List<Integer> roleIds = menuRoleService.getRoleIdsByMenuId(Integer.parseInt(menuId));
        model.addAttribute("menuId", menuId);
        model.addAttribute("roleIds", roleIds);
        return "auth/role/role_resource_dialog";
    }

    /**
     * 资源-角色 授权
     * @return  Rtn
     */
    @ResponseBody
    @RequestMapping(value = "menuRoleRelation", method = RequestMethod.POST)
    public Rtn menuRoleRelation(@RequestParam("menuId") Integer menuId,
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
