package com.company.exchange.service;

import com.company.exchange.pojo.Admin;

public interface AdminService {

	
	public Admin findAdmin(String username, String password);

	public Admin findAdminById(Integer id);

	public void updateAdmin(Admin admins);
	
	

}
