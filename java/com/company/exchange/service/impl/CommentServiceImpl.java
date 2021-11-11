package com.company.exchange.service.impl;

import com.company.exchange.dao.CommentsMapper;
import com.company.exchange.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("CommentService")
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentsMapper commentsMapper;

    @Override
    public int getCommentCount(Integer goodsId) {
        return commentsMapper.getCommentCount(goodsId);
    }
}
