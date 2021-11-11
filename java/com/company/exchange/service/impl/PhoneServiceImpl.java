package com.company.exchange.service.impl;

import com.company.exchange.dao.PhoneMapper;
import com.company.exchange.service.PhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("PhoneService")
public class PhoneServiceImpl implements PhoneService {

    @Autowired
    private PhoneMapper phoneMapper;

    @Override
    public String getUserPhone(Integer userId){
        return phoneMapper.getUserPhone(userId);
    }

}
