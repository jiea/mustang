package com.jiea.mustang.service.impl;

import com.jiea.mustang.dao.TestTransactionMapper;
import com.jiea.mustang.service.TestTransactionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;


@Service
public class TestTransactionServiceImpl implements TestTransactionService {

    @Resource
    private TestTransactionMapper testTransactionMapper;

    @Transactional
    @Override
    public void transfer(Integer out, Integer in, BigDecimal amt) {
        testTransactionMapper.outAmt(out, amt);
        int i = 1/0;
        testTransactionMapper.inAmt(in, amt);
    }
}
