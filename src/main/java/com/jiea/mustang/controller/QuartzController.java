package com.jiea.mustang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("quartz")
public class QuartzController {

    /**
     * 跳转到定时任务列表
     * @return String
     */
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String to(){
        return "system/quartz/quartz_list";
    }


}
