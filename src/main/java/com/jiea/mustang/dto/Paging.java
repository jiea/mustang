package com.jiea.mustang.dto;

import java.util.List;

/**
 * Created by pc on 2016/10/28.
 */
public class Paging<T> {

    private long total;

    private List<T> data;

    public Paging(long total, List<T> data) {
        this.total = total;
        this.data = data;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
