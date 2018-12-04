package com.tz.online.user.dao;

import java.util.List;

import com.tz.online.entity.Address;
import com.tz.online.entity.User;

public interface IUserDao {
	void save(User u);

	User findByName(String userName);

	List<Address> findAddress(User u);
	
	void addAddress(Address addr);
	
	void updateAsN();
	
	Address findAddrById(Long id);
	
}
