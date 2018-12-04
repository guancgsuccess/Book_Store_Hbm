package com.tz.online.user.service;

import org.testng.annotations.Test;

import com.tz.online.entity.User;
import com.tz.online.util.BeanFactory;

public class TestUserServiceImpl {
	IUserService service=(IUserService) BeanFactory.getInstance("userService");
	@Test(priority=1)
	public void testSave(){
		User u=new User("张三", "123456", "123ea@qq.com", "12345678901", "tz", "烽火路");
		service.register(u);
	}
	
	@Test(priority=2)
	public void testFindByName(){
		System.out.println(service.login("张三"));
	}

}
