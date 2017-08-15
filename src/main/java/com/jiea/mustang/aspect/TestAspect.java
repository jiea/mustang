package com.jiea.mustang.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class TestAspect {

    protected final Logger log = LoggerFactory.getLogger(TestAspect.class);

    @Pointcut("execution(* com.jiea.mustang.controller.*.*(..))")
    private void testAspect(){}

    @Around("testAspect()")
    public Object around(ProceedingJoinPoint pjp){
        String className = pjp.getSignature().getDeclaringTypeName();
        String metodName = pjp.getSignature().getName();

        log.info("环绕通知开始：{}.{}()", className, metodName);
        Object o = null;
        try {
            o = pjp.proceed();
        } catch (Throwable e) {
            log.error(e.getMessage(), e);
        }

        log.info("环绕通知结束：{}.{}()", className, metodName);
        return o;
    }

    @Before("testAspect()")
    public Object before(JoinPoint jp){
        return  null;
    }

}
