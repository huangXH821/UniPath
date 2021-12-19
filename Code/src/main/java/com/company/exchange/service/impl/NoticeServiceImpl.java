package com.company.exchange.service.impl;

import com.company.exchange.dao.NoticeMapper;
import com.company.exchange.pojo.Notice;
import com.company.exchange.service.NoticeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService{
	 @Resource
	 private NoticeMapper noticeMapper;

	@Override
	public List<Notice> getNoticeList() {
		
		return noticeMapper.getNoticeList();
	}

	@Override
	public void insertSelective(Notice notice) {
		noticeMapper.insertSelective(notice);
		
	}




}
