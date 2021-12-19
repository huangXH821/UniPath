package com.company.exchange.pojo;

import java.util.List;

public class PageInfo<T> {

   private  List<T> data;

   private int firstPage=1;

   private int prePage;


    private int currentPage;

   private int nextPage;

   private int lastPage;

   private int pageNum=3;

   private int totalPage;
   private int total;

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public int getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }

    public int getPrePage() {
        return this.currentPage>1?this.currentPage-1:1;
    }

    public void setPrePage(int prePage) {
        this.prePage = prePage;
    }

    public int getNextPage() {
        return this.currentPage==this.totalPage?this.totalPage:this.currentPage+1;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getLastPage() {
        return this.total%this.pageNum==0?this.total/this.pageNum:this.total/this.pageNum+1;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }


    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalPage() {
        return  this.total%this.pageNum==0?this.total/this.pageNum:this.total/this.pageNum+1;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
}
