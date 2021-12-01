package com.company.exchange.service;

import com.company.exchange.pojo.Notice;

import java.util.List;

public interface NoticeService {

	List<Notice> getNoticeList();
	
	public void insertSelective(Notice notice);
	
	



}
