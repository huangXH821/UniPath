package com.company.exchange.service;

import com.company.exchange.pojo.Image;

import java.util.List;


public interface ImageService {
    int insert(Image record);

    public List<Image> getImagesByGoodsPrimaryKey(Integer goodsId);


    int deleteImagesByGoodsPrimaryKey(Integer goodsId);
}