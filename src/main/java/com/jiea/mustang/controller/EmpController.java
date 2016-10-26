package com.jiea.mustang.controller;

import com.jiea.mustang.common.constants.SystemConst;
import com.jiea.mustang.common.utils.SHAUtil;
import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.service.EmpService;
import com.jiea.mustang.vo.Rtn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("emp")
public class EmpController extends BaseController{

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
    public List<Emp> list(@RequestParam("page") Integer page, @RequestParam("rows") Integer rows, Emp emp) {
        List<Emp> list = null;
        try {
            list = empService.getEmpList(emp, page, rows);
        } catch (Exception e) {
           log.error(e.getMessage(), e);
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

    /**
     * 添加员工
     */
    @RequestMapping(value = "addEmp", method = RequestMethod.POST)
    public Rtn addEmp(Emp emp){
        try {
            emp.setPassword(SHAUtil.SHAEncode("123456"));
            emp.setCreateTime(new Date());
            emp.setCreator(1);
            int count = empService.insert(emp);
            if(count != 1){
                return new Rtn(false, "新增员工失败");
            }
            return new Rtn(true);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return new Rtn(false, SystemConst.ERROR);
        }

    }
}
