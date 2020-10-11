package com.springrest.demo.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.logging.Logger;

@Aspect
@Component
public class CRMLoggingAspect {

    private Logger logger = Logger.getLogger(getClass().getName());

    @Pointcut("execution(* com.springrest.demo.controller.*.*(..))")
    private void forControllerPackage() {}

    @Pointcut("execution(* com.springrest.demo.dao.*.*(..))")
    private void forDaoPackage() {}

    @Pointcut("execution(* com.springrest.demo.service.*.*(..))")
    private void forServicePackage() {}

    @Pointcut("forControllerPackage() || forServicePackage() || forDaoPackage()")
    private void forAppFlow() {}

    @Before("forAppFlow()")
    public void before(JoinPoint joinPoint) {
        String method = joinPoint.getSignature().toShortString();
        logger.info("===>>> in @Before: calling method: " + method);

        Object[] args = joinPoint.getArgs();

        for (Object arg : args) {
            logger.info("===>>> argument: " + arg);
        }
    }

    @AfterReturning(pointcut = "forAppFlow()",
                    returning = "result")
    public void afterReturning(JoinPoint joinPoint, Object result) {

        String method = joinPoint.getSignature().toShortString();
        logger.info("===>>> in @AfterReturning: calling method: " + method);
        logger.info("===>>> in result: " + result);
    }
}
