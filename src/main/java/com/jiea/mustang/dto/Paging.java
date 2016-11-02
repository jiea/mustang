package com.jiea.mustang.dto;

import java.util.List;

/**
 * Created by pc on 2016/10/28.
 */
public class Paging<T> {

    private long total;

    private List<T> rows;

    public Paging(long total, List<T> rows) {
        this.total = total;
        this.rows = rows;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
