package com.jiea.mustang.controller;

import java.awt.Color;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jiea.mustang.common.constants.SystemConst;
import com.jiea.mustang.common.utils.CaptchaUtil;

@Controller
@RequestMapping("captcha")
public class CaptchaController extends BaseController {
	
	/**
	 *	获取验证码 
	 */
	@RequestMapping("getCaptcha")
	public void getCaptcha(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		// 设置相应的格式为图片格式
		response.setContentType("image/jpeg");
		// 禁止缓存
		response.setHeader("Pragma","No-cache");   
		response.setHeader("Cache-Control","no-cache");   
		response.setDateHeader("Expires",0);   
		
		String captcha = CaptchaUtil.generateTextCode(CaptchaUtil.TYPE_ALL_MIXED, 4, "0oOl1");
		session.setAttribute(SystemConst.CAPTCHA, captcha);
		ImageIO.write(CaptchaUtil.generateImageCode(captcha, 90, 30, 5,true,Color.WHITE,Color.BLACK,null),"JPEG",response.getOutputStream());
	}
	
}
