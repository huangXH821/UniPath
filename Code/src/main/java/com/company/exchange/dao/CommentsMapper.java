package com.company.exchange.dao;

import com.company.exchange.pojo.Comments;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface CommentsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Comments record);

    int insertSelective(Comments record);

    Comments selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comments record);

    int updateByPrimaryKeyWithBLOBs(Comments record);

    int updateByPrimaryKey(Comments record);

    @Select("select count(1) from comments where goods_id=#{goodsId}")
    int getCommentCount(@Param("goodsId") Integer goodsId);
}