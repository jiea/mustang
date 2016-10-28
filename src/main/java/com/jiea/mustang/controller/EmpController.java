package com.jiea.mustang.controller;

import com.jiea.mustang.common.constants.SystemConst;
import com.jiea.mustang.common.utils.SHAUtil;
import com.jiea.mustang.dto.Paging;
import com.jiea.mustang.dto.Rtn;
import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequestMapping("emp")
public class EmpController extends BaseController {

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
    public Paging<Emp> list(@RequestParam("page") Integer page, @RequestParam("rows") Integer rows, Emp emp) {
        Paging<Emp> paging = null;
        try {
            paging = empService.getEmpList(emp, page, rows);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return paging;
    }

    /**
     * 打开员工添加修改层
     */
    @RequestMapping(value = "openEmpDialog", method = RequestMethod.GET)
    public String openEmpDialog() {
        return "auth/emp/emp_input";
    }

    /**
     * 添加员工
     */
    @ResponseBody
    @RequestMapping(value = "addEmp", method = RequestMethod.POST)
    public Rtn addEmp(Emp emp) {
        try {
            emp.setPassword(SHAUtil.SHAEncode("123456"));
            emp.setCreateTime(new Date());
            emp.setCreator(1);
            int count = empService.insert(emp);
            if (count != 1) {
                return new Rtn(false, "新增员工失败");
            }
            return new Rtn(true);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return new Rtn(false, SystemConst.ERROR);
        }

    }
}
