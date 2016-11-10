package com.jiea.mustang.controller;

import com.jiea.mustang.dto.Paging;
import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.entity.Role;
import com.jiea.mustang.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("role")
public class RoleController extends BaseController{

    @Autowired
    private RoleService roleService;

    /**
     * 跳转至角色列表
     */
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String to(){
        return "auth/role/role_list";
    }

    /**
     * 角色分页列表
     */
    @ResponseBody
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public Paging list(@RequestParam("page") Integer page, @RequestParam("rows") Integer rows, Role role){
        Paging<Emp> paging = null;
        try {
            paging = roleService.getRoleList(role, page, rows);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return paging;
    }
}
