package com.jiea.mustang.controller;

import com.alibaba.fastjson.JSON;
import com.jiea.mustang.common.constants.SystemConst;
import com.jiea.mustang.dto.Paging;
import com.jiea.mustang.dto.Rtn;
import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.entity.Role;
import com.jiea.mustang.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

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
     * 跳转至资源授权列表（角色——资源）
     */
    @RequestMapping(value = "toRoleResource", method = RequestMethod.GET)
    public String toRoleResource(@RequestParam("menuIds") String menuIds, Model model){
        model.addAttribute("menuIds", menuIds);
        return "auth/role/role_resource_dialog";
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

    /**
     * 保存修改
     */
    @ResponseBody
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public Rtn save(@RequestParam("changes") String changes){
        try {
            Role role = JSON.parseObject(changes, Role.class);
            if (role != null){
                if(role.getId() != null){
                    // 修改
                    role.setOperator(1);
                    role.setOperateTime(new Date());
                    roleService.updateRoleById(role);
                }else{
                    // 新增
                    role.setCreator(1);
                    role.setCreateTime(new Date());
                    roleService.add(role);
                }
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return new Rtn(false, SystemConst.ERROR);
        }

        return new Rtn(true);
    }

    /**
     * 验证角色名称是否重复
     */
    @ResponseBody
    @RequestMapping(value = "verifyRoleName", method = RequestMethod.POST)
    public Rtn verifyRoleName(@RequestParam("val") String roleName, @RequestParam(value = "id", required = false) Integer id){
        try {
            int count = roleService.verifyRoleName(roleName, id);
            if (count > 0) {
                return new Rtn(false, "角色名称已存在");
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return new Rtn(false, SystemConst.ERROR);
        }
        return new Rtn(true);
    }
}
