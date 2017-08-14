package com.jiea.mustang.aspect;

import com.jiea.mustang.entity.LoginLog;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LogAspect {

    protected final Logger log = LoggerFactory.getLogger(LogAspect.class);

    @Autowired
    private LoginLog loginLog;

    @Pointcut(value = "* com.jiea.mustang.controller.*(..)")
    private void logAspect(){}

    @Around("logAspect()")
    public void around(ProceedingJoinPoint pjp){
        Object o = pjp.getArgs()[0];
        // log.info(pjp.getArgs()[0]);
    }

}
