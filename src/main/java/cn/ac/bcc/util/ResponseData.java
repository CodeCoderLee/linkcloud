package cn.ac.bcc.util;

import java.util.List;

/**
 * Created by bcc on 16/4/21.
 * bootstrap 返回数据的封装类
 */
public class ResponseData {

    private long total;

    private List rows;

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }
}