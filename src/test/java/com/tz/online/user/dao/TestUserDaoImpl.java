package com.tz.online.user.dao;

import org.testng.annotations.Test;

import com.tz.online.entity.Address;
import com.tz.online.entity.User;
import com.tz.online.util.BeanFactory;

public class TestUserDaoImpl {
	IUserDao dao=(IUserDao) BeanFactory.getInstance("userDao");
	@Test
	public void testSave(){
		User u=new User("zhangsan2", "123456", "123ea@qq.com", "12345678901", "tz", "烽火路");
		dao.save(u);
	}
	
	@Test
	public void testFindByName(){
		System.out.println(dao.findByName("张三"));
	}
	
	@Test
	public void testFindAddr(){
		User u=dao.findByName("zhangsan");
		dao.findAddress(u).forEach(System.out::println);
		
	}

	@Test
	public void testAddAddr(){
		User u=dao.findByName("zhangsan");
		Address a=new Address("江苏1", "苏州", "sada@qq.com", "asd", "110", "N", u);
		Address b=new Address("江苏2", "苏州", "sada@qq.com", "asd", "110", "N", u);
		Address c=new Address("江苏3", "苏州", "sada@qq.com", "asd", "110", "N", u);
		Address d=new Address("江苏4", "苏州", "sada@qq.com", "asd", "110", "N", u);
		Address e=new Address("江苏5", "苏州", "sada@qq.com", "asd", "110", "N", u);
		dao.addAddress(a);
		dao.addAddress(b);
		dao.addAddress(c);
		dao.addAddress(d);
		dao.addAddress(e);
		
		
	}
	@Test
	public void testUpdateAsN(){
		dao.updateAsN();
		
	}
}
