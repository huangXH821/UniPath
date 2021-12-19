package com.company.exchange.service;

import com.company.exchange.pojo.Focus;

import java.util.List;

public interface FocusService {
	

    public List<Focus> getFocusByUserId(Integer user_id);
    

    public void deleteFocusByUserIdAndGoodsId(Integer goods_id, Integer user_id);


	public void addFocusByUserIdAndId(Integer goods_id, Integer user_id);

}
