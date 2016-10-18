package com.jiea.mustang.controller;

import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("emp")
public class EmpController {

    @Autowired
    private EmpService empService;

    /**
     * 跳转至员工列表
     */
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String to() {
        return "auth/emp/emp_list";
    }

    @ResponseBody
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public List<Emp> list(@RequestParam("page") Integer page, @RequestParam("rows") Integer rows, @ModelAttribute("emp") Emp emp) {
        List<Emp> list = null;
        try {
            list = empService.getEmpList(emp, page, rows);
            System.out.println(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 打开员工添加修改层
     */
    @RequestMapping(value = "openEmpDialog", method = RequestMethod.GET)
    public String openEmpDialog() {
        return "auth/emp/emp_input";
    }

}
