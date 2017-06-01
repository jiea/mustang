package com.jiea.mustang.controller;

import com.jiea.mustang.common.constants.SystemConst;
import com.jiea.mustang.common.utils.SHAUtil;
import com.jiea.mustang.dto.Paging;
import com.jiea.mustang.dto.Rtn;
import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.service.EmpService;
import com.jiea.mustang.task.TestTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@Controller
@RequestMapping("emp")
public class EmpController extends BaseController {

    @Autowired
    private EmpService empService;

    @Autowired
    private ThreadPoolTaskExecutor taskExecutor;

    /**
     * 跳转至员工列表
     */
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String to() {
        return "auth/emp/emp_list";
    }

    /**
     * 员工列表查询
     */
    @ResponseBody
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public Paging<Emp> list(@RequestParam("page") Integer page, @RequestParam("rows") Integer rows, Emp emp) {
        Paging<Emp> paging = null;
        try {
            taskExecutor.execute(new TestTask());
            paging = empService.getEmpList(emp, page, rows);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return paging;
    }

    /**
     * 打开员工添加层
     */
    @RequestMapping(value = "toAddEmp", method = RequestMethod.GET)
    public String toAddEmp() {
        return "auth/emp/emp_add";
    }


    /**
     * 打开员工添加修改层
     */
    @RequestMapping(value = "toModifyEmp/{id}", method = RequestMethod.GET)
    public String toModifyEmp(@PathVariable("id") Integer id, Model model) {
        try {
            Emp emp = empService.getEmpById(id);
            if(emp != null){
                model.addAttribute("emp", emp);
            }else{
                log.error("根据主键没有查询到员工信息，员工主键：" + id);
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }

        return "auth/emp/emp_modify";
    }

    /**
     * 添加员工信息
     */
    @ResponseBody
    @RequestMapping(value = "addEmp", method = RequestMethod.POST)
    public Rtn addEmp(Emp emp) {
        try {
            if(emp != null){
                emp.setPassword(SHAUtil.SHAEncode(SystemConst.DEFAULT_PWD));
                emp.setCreateTime(new Date());
                emp.setCreator(1);
                int count = empService.insert(emp);
                if (count != 1) {
                    return new Rtn(false, "新增员工信息失败，影响的行数：" + count);
                }
                return new Rtn(true);
            }else{
                log.error("添加员工信息，员工参数为空");
                return new Rtn(false, "新增员工信息失败");
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return new Rtn(false, SystemConst.ERROR);
        }
    }

    /**
     * 修改员工信息
     */
    @ResponseBody
    @RequestMapping(value = "modifyEmp", method = RequestMethod.POST)
    public Rtn ModifyEmp(Emp emp){
        try {
            if(emp != null){
                emp.setOperateTime(new Date());
                emp.setOperator(1);
                int count = empService.modifyEmp(emp);
                if(count != 1){
                    return new Rtn(false, "修改员工信息失败，影响的行数：" + count);
                }
                return new Rtn(true);
            }else{
                log.error("修改员工信息，员工参数为空");
                return new Rtn(false, "修改员工信息失败");
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return new Rtn(false, SystemConst.ERROR);
        }
    }

    /**
     * 密码重置
     */
    @ResponseBody
    @RequestMapping(value = "resetPassword", method = RequestMethod.POST)
    public Rtn resetPassword(@RequestParam("id") Integer id){
        Emp emp = new Emp();
        try {
            emp.setId(id);
            emp.setPassword(SHAUtil.SHAEncode(SystemConst.DEFAULT_PWD));
            emp.setOperateTime(new Date());
            emp.setOperator(1);
            empService.resetPassword(emp);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return new Rtn(false, SystemConst.ERROR);
        }

        return new Rtn(true);
    }

    /**
     * 停用
     */
    @ResponseBody
    @RequestMapping(value = "disable", method = RequestMethod.POST)
    public Rtn disable(@RequestParam("id") Integer id){
        Emp emp = new Emp();
        try {
            emp.setId(id);
            emp.setIsAvailable("0");
            emp.setOperateTime(new Date());
            emp.setOperator(1);
            empService.disable(emp);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            new Rtn(false, SystemConst.ERROR);
        }

        return new Rtn(true);
    }

    /**
     * 启用
     */
    @ResponseBody
    @RequestMapping(value = "enabled", method = RequestMethod.POST)
    public Rtn enabled(@RequestParam("id") Integer id){
        Emp emp = new Emp();
        try {
            emp.setId(id);
            emp.setIsAvailable("1");
            emp.setOperateTime(new Date());
            emp.setOperator(1);
            empService.enabled(emp);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            new Rtn(false, SystemConst.ERROR);
        }

        return new Rtn(true);
    }
}
