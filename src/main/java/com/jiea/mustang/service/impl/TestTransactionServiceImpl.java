package com.jiea.mustang.service.impl;

import com.jiea.mustang.dao.TestTransactionMapper;
import com.jiea.mustang.service.TestTransactionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;


@Service
public class TestTransactionServiceImpl implements TestTransactionService {

    @Resource
    private TestTransactionMapper testTransactionMapper;

    /**
     * @Transactional注解中的属性：
     * propagation: 事务的传播行为
     *      解决业务层方法之间的相互调用的问题。
     *      Propagation.REQUIRED            当前的方法必须运行在事务中，如果没有事务就新建一个事务。
     *      Propagation.SUPPORTS            当前的方法支持当前事务，如果没有事务就以非事务方式运行。
     *      Propagation.MANDATORY           方法必须在事务中执行，如果没有事务就抛出异常。
     *      Propagation.REQUIRES_NEW        新建一个事务运行，如果当前存在事务则挂起。
     *      Propagation.NOT_SUPPORTED       以非事务方式运行，如果存在事务，挂起当前事务。
     *      Propagation.NEVER               以非事务方式运行，如果存在事务，抛出异常。
     *      Propagation.NESTED              如果当前事务存在，则嵌套事务执行。
     *
     * isolation: 事务的隔离级别
     *      Isolation.DEFAULT               使用数据库默认的隔离级别。
     *      Isolation.READ_UNCOMMITTED      隔离级别最低，允许读取还未提交的数据，可能导致脏读、幻读、不可重复读。
     *      Isolation.READ_COMMITTED        允许读取已经提交的数据，可以防止脏读，但是幻读和不可重复读仍可发生。
     *      Isolation.REPEATABLE_READ       对相同字段的多次读取是一致的，除非数据被事务本身改变，可防止脏读、不可重复读、但幻读仍可发生。(Mysql 默认)
     *      Isolation.SERIALIZABLE          隔离级别最高，确保不发生脏读、幻读、不可重复读，但是速度最慢，影响性能。
     *
     *      几种读区别：
     *                  脏读     ：    一个事务读取了另外一个事务还未提交的数据。
     *                  不可重复读：    在同一个事务中，读取了另外事务已经提交的更新的数据。
     *                  幻读     ：    在同一个事务中，读取了另外事务已经提交的插入的数据。
     * readOnly: true 只读，在Mysql中，设置为true，只能查询，如果增删改会抛异常。
     * rollbackFor: 发生哪些异常回滚
     * noRollbackFor: 发生哪些异常不回滚
     */
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor=Exception.class)
    @Override
    public void transfer(Integer out, Integer in, BigDecimal amt) {
        testTransactionMapper.outAmt(out, amt);
        // int i = 1/0;
        testTransactionMapper.inAmt(in, amt);
    }
}
