package com.jiea.mustang.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect     // 通过该注解将TestAspect标识为一个切面
public class TestAspect {

    protected final Logger log = LoggerFactory.getLogger(TestAspect.class);

    /**
     * 切点可以直接声明在增强方法处——匿名切点   如：@Around("execution(* com.jiea.mustang.controller.*.*(..))")
     * 也可以通过 @Pointcut 注解及切面类方法对切点进行命名——命名切点，这样可以在其他地方重用一个切点
     *
     * 方法访问修饰符为 private , 表明该命名切点只能在本切面类中使用；
     * 为 protected , 表明该命名切点可以在当前包中的切面类、子切面类中使用；
     * 为 public ， 可以在任何类中使用
     * 这种可引用行和类方法的可访问性相同。
     *
     * 命名切点仅利用方法名及访问修饰符的信息，所以习惯上方法的返回类型为 void , 并且方法体为空
     *
     * 切点函数及通配符见下图
     */
    @Pointcut("execution(* com.jiea.mustang.controller.*.*(..))")
    private void testAspect(){}

    /**
     * 环绕增强，
     * 如果是环绕增强，则使用 org.aspectj.lang.ProceedingJoinPoint 标识连接点对象个，该类是 JoinPoint 的子接口
     * - Object[] getArgs()             获取连接点方法运行时的入参列表
     * - Signature getSignature()       获得连接点的方法签名对象
     * - Object getTarget               获取连接点所在的目标对象
     * - Object getThis()               获取代理对象本身
     *
     * ProceedingJoinPoint 新增了两个用于执行连接点的方法
     * - Object proceed()               通过反射执行目标对象的连接点处的方法
     * - Object proceed(Object[] args)  通过反射执行目标对象连接点处的方法，不过使用新的入参替换原来的入参
     *
     * @param pjp
     * @return
     */
    @Around("testAspect()")
    public Object around(ProceedingJoinPoint pjp){
        Signature signature = pjp.getSignature();
        String className = signature.getDeclaringTypeName();
        String methodName = signature.getName();

        log.info("环绕增强开始：{}.{}()", className, methodName);
        Object o = null;
        try {
            o = pjp.proceed();
        } catch (Throwable e) {
            log.error(e.getMessage(), e);
        }

        log.info("环绕增强结束：{}.{}()", className, methodName);
        return o;
    }

    /**
     * 前置增强
     * @param jp
     */
    @Before("testAspect()")
    public void before(JoinPoint jp){
        Signature signature = jp.getSignature();
        String className = signature.getDeclaringTypeName();
        String methodName = signature.getName();
        log.info("前置增强：{}.{}()", className, methodName);
    }

    /**
     * Final 增强，不管是抛出异常还是正常退出，该增强都会得到执行
     * @param jp
     */
    @After("testAspect()")
    public void after(JoinPoint jp){

    }

    /**
     * 后置增强，目标正常退出，该增强会得到执行
     * @param jp
     * @param result    将返回值绑定到增强方法中
     */
    @AfterReturning(value = "testAspect()", returning = "result")
    public void AfterReturning(JoinPoint jp, Object result){

    }

    /**
     * 抛出增强，在目标方法抛出异常时，该增强会执行
     * @param jp
     * @param e     将抛出的异常绑定到增强方法中
     */
    @AfterThrowing(value = "testAspect()", throwing = "e")
    public void afterThrowing(JoinPoint jp, Exception e){

    }

}
