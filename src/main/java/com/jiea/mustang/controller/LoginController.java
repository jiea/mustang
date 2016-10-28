package com.jiea.mustang.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiea.mustang.common.constants.SystemConst;
import com.jiea.mustang.common.utils.IPUtil;
import com.jiea.mustang.common.utils.SHAUtil;
import com.jiea.mustang.entity.Emp;
import com.jiea.mustang.entity.LoginLog;
import com.jiea.mustang.service.EmpService;
import com.jiea.mustang.service.LoginLogService;
import com.jiea.mustang.dto.Rtn;

@Controller
@RequestMapping("login")
public class LoginController extends BaseController {
	
	@Autowired
	private EmpService empService;
	
	@Autowired
	private LoginLogService loginLogService;
	
	/**
	 *  跳转到登录页面
	 */
	@RequestMapping(value="", method=RequestMethod.GET)
	public String to(){
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value = "do", method = RequestMethod.POST)
	public Rtn doLogin(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("captcha") String captcha, HttpServletRequest request, Rtn rtn) {
		try {
			// 验证验证码
			if (!captcha.equalsIgnoreCase((String) request.getSession().getAttribute(SystemConst.CAPTCHA))) {
				rtn.setSuccess(false);
				rtn.setCode("1");
				rtn.setMsg("验证码错误");
				return rtn;
			}
			// 根据登录名查询
			Emp emp = empService.getEmpByEmpNo(username);
			// 用户名不存在
			if (emp == null) {
				rtn.setSuccess(false);
				rtn.setCode("2");
				rtn.setMsg("用户名不存在或密码错误");
				return rtn;
			} else {
				// 密码错误
				if (!SHAUtil.SHAEncode(password).equals(emp.getPassword())) {
					rtn.setSuccess(false);
					rtn.setCode("2");
					rtn.setMsg("用户名不存在或密码错误");
					return rtn;
				} else {
					// 添加登录日志
					LoginLog loginLog = new LoginLog();
					loginLog.setEmpId(emp.getId());
					loginLog.setLoginIp(IPUtil.getIpAddr(request));
					loginLog.setCreateTime(new Date());
					loginLogService.add(loginLog);
					// 删除密码
					emp.setPassword(null);
					// 将员工信息emp放入session
					request.getSession().setAttribute(SystemConst.EMP, emp);
					
					rtn.setSuccess(true);
					rtn.setMsg("登录成功");
					return rtn;
				}
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			rtn.setSuccess(false);
			rtn.setCode("-1");
			rtn.setMsg(SystemConst.ERROR);
			return rtn;
		}
	}
}
