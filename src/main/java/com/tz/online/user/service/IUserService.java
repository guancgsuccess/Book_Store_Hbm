package com.tz.online.user.service;

import java.util.List;

import com.tz.online.entity.Address;
import com.tz.online.entity.User;

public interface IUserService {
	void register(User u);

	User login(String userName);
	
	List<Address> findAddress(User u);
	
	void addAddress(Address addr);
	
	Address findAddrById(Long id);

}
