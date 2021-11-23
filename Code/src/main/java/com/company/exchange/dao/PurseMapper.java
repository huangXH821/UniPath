package com.company.exchange.dao;

import com.company.exchange.pojo.Purse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PurseMapper {
	
	public void updatePurseByuserId(Integer userId, Float balance);

	public void updatePurseOfdel(Integer userId, Float balance);

	public void addPurse(Integer userId);

	public Purse selectPurseByUserId(Integer user_id);

	public void updatePurse(Purse purse);

	public List<Purse> selectPurseList();

	public List<Purse> getPagePurseByPurse(@Param("userId") Integer userId, @Param("state") Integer state);

	public Purse selectPurseById(int id);

	public void updateByPrimaryKey(Purse purse);

	public void updatePurseById(Purse purse);

	


}
