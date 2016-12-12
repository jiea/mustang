package com.jiea.mustang.controller;

import com.jiea.mustang.common.constants.SystemConst;
import com.jiea.mustang.dto.Rtn;
import com.jiea.mustang.service.EmpRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("empRole")
public class EmpRoleController extends BaseController {

    @Autowired
    private EmpRoleService empRoleService;

    /**
     * 跳转至员工授权列表（员工-角色）
     * @param empId 员工主键
     * @param model Model
     * @return  String
     */
    @RequestMapping(value = "toEmpRole", method = RequestMethod.GET)
    public String toEmpRole(@RequestParam("empId") Integer empId, Model model){
        // 通过员工主键获取对应的角色主键
        List<Integer> roleIds = empRoleService.getRoleIdsByEmpId(empId);
        model.addAttribute("empId", empId);
        model.addAttribute("roleIds", roleIds);
        return "auth/role/role_emp_dialog";
    }

    /**
     * 员工-角色 授权
     * @param empId     员工主键
     * @param roleIds   角色主键集合
     * @return  Rtn
     */
    @ResponseBody
    @RequestMapping(value = "empRoleRelation", method = RequestMethod.POST)
    public Rtn empRoleRelation(@RequestParam("empId") Integer empId, @RequestParam("roleIds") String roleIds){
        try {
            empRoleService.empRoleRelation(empId, roleIds);
            return new Rtn(true);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return new Rtn(false, SystemConst.ERROR);
        }
    }
}
