package com.company.exchange.dao;

import com.company.exchange.pojo.Focus;

import java.util.List;

public interface FocusMapper {
	


    public List<Focus> getFocusByUserId(Integer user_id);
    

    
    public void deleteFocusByUserIdAndGoodsId(Integer goods_id, Integer user_id);


	public void addFocusByUserIdAndGoodsId(Integer goods_id, Integer user_id);

}
