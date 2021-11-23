package com.company.exchange.pojo;

import java.util.ArrayList;
import java.util.List;

public class GoodsExtend{
	private Goods goods;
    public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	private List<Image> images = new ArrayList<Image>();
    private List<Comments> comments=new ArrayList<Comments>();
	private int num;
	private String phone;

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public List<Image> getImages() {
		return images;
	}
	public void setImages(List<Image> images) {
		this.images = images;
	}
	public List<Comments> getComments() {
		return comments;
	}
	public void setComments(List<Comments> comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "GoodsExtend [goods=" + goods + ", images=" + images + ", comments=" + comments + "]";
	}
	
	
}