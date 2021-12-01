package com.company.exchange.service.impl;

import com.company.exchange.dao.CatelogMapper;
import com.company.exchange.pojo.Catelog;
import com.company.exchange.service.CatelogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("catelogService")
public class CatelogServiceImpl implements CatelogService {

    @Resource
    private CatelogMapper catelogMapper;

    public int getCount(Catelog catelog) {
        int count = catelogMapper.getCount(catelog);
        return count;
    }
    public List<Catelog> getAllCatelog() {
        List<Catelog> catelogs = catelogMapper.getAllCatelog();
        return catelogs;
    }
    public Catelog selectByPrimaryKey(Integer id){
        Catelog catelog = catelogMapper.selectByPrimaryKey(id);
        return catelog;
    }
    public int updateByPrimaryKey(Catelog catelog) {
        return  catelogMapper.updateByPrimaryKey(catelog);
    }
    public int updateCatelogNum(Integer id,Integer number) {
        return catelogMapper.updateCatelogNum(id,number);
    }
}
