package com.tz.online.user.service.impl;

import java.util.List;

import com.tz.online.entity.Address;
import com.tz.online.entity.User;
import com.tz.online.user.dao.IUserDao;
import com.tz.online.user.service.IUserService;
import com.tz.online.util.BeanFactory;

public class UserServiceImpl implements IUserService {
	IUserDao dao = (IUserDao) BeanFactory.getInstance("userDao");

	@Override
	public void register(User u) {
		dao.save(u);

	}

	@Override
	public User login(String userName) {

		return dao.findByName(userName);
	}

	@Override
	public List<Address> findAddress(User u) {
		// TODO Auto-generated method stub
		return dao.findAddress(u);
	}

	@Override
	public void addAddress(Address addr) {
		if (addr.getIsDefault().equals("Y")) {
			dao.updateAsN();
		}
		dao.addAddress(addr);

	}

	@Override
	public Address findAddrById(Long id) {
		// TODO Auto-generated method stub
		return dao.findAddrById(id);
	}

}
