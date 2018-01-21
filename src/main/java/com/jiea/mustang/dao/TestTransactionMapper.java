package com.jiea.mustang.dao;

import com.jiea.mustang.entity.TestTransaction;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;

public interface TestTransactionMapper {

    void outAmt(@Param("out") Integer out, @Param("amt") BigDecimal amt);

    void inAmt(@Param("ins") Integer in, @Param("amt") BigDecimal amt);
}