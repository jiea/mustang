package com.jiea.mustang.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
public class TestAspect {

    protected final Logger log = LoggerFactory.getLogger(TestAspect.class);

    @Pointcut("execution(* com.jiea.mustang.controller.*.*(..))")
    private void testAspect(){}

    @Around("testAspect()")
    public Object around(ProceedingJoinPoint pjp){
        String className = pjp.getSignature().getDeclaringTypeName();
        String methodName = pjp.getSignature().getName();

        log.info("环绕通知开始：{}.{}()", className, methodName);
        Object o = null;
        try {
            o = pjp.proceed();
        } catch (Throwable e) {
            log.error(e.getMessage(), e);
        }

        log.info("环绕通知结束：{}.{}()", className, methodName);
        return o;
    }

    @Before("testAspect()")
    public void before(JoinPoint jp){

    }

    @After("testAspect()")
    public void after(JoinPoint jp){

    }

    @AfterReturning("testAspect()")
    public void AfterReturning(JoinPoint jp){

    }

}
