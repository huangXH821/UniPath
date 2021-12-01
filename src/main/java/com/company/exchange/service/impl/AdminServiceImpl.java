package com.company.exchange.service.impl;

import com.company.exchange.dao.AdminMapper;
import com.company.exchange.pojo.Admin;
import com.company.exchange.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "adminService")
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminMapper am;

    @Override
    public Admin findAdmin(String username, String password) {
        // TODO Auto-generated method stub
        return am.findAdmin(username, password);
    }

    @Override
    public Admin findAdminById(Integer id) {
        // TODO Auto-generated method stub
        return am.findAdminById(id);
    }

    @Override
    public void updateAdmin(Admin admins) {
        am.updateAdmin(admins);
    }


}
