package com.jiea.mustang.common.enums;

public enum EmpType {
    /**
     * 1 - 线上客户
     * 2 - 线下客户
     * 3 - 客户经理  
     */
	ON_LINE("1"), OFF_LINE("2"), CUSTOMER_MANAGER("3");
	
    private String value;

    EmpType(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }

    public static EmpType getEnumByText(String value) {
        if ("".equals(value) || value == null) {
            return null;
        }
        for (EmpType ot : EmpType.values()) {
            if (ot.value.equals(value)) {
                return ot;
            }
        }
        return null;
    }
}
