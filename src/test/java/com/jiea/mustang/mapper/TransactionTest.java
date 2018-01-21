package com.jiea.mustang.mapper;


import com.jiea.mustang.service.TestTransactionService;
import org.junit.Test;

import javax.annotation.Resource;
import java.math.BigDecimal;

public class TransactionTest extends BaseTest{

    @Resource
    private TestTransactionService testTransactionService;

    @Test
    public void testTransaction(){
        testTransactionService.transfer(1, 2, new BigDecimal(100));
    }


}
