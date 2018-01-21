package com.jiea.mustang.service;

import java.math.BigDecimal;

public interface TestTransactionService {

    void transfer(Integer out, Integer in, BigDecimal amt);
}
