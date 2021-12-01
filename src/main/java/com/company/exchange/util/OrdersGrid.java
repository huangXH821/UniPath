package com.company.exchange.util;

import com.company.exchange.pojo.Orders;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;



@XmlRootElement
public class OrdersGrid {
    private int current;
    private int rowCount;
    private int total;
    private List<Orders> rows;

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<Orders> getRows() {
        return rows;
    }

    public void setRows(List<Orders> rows) {
        this.rows = rows;
    }
}
