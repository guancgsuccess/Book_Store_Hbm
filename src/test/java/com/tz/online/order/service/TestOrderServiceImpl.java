package com.tz.online.order.service;

import org.testng.annotations.Test;

import com.tz.online.entity.OrderStatus;
import com.tz.online.user.dao.IUserDao;
import com.tz.online.util.BeanFactory;

public class TestOrderServiceImpl {
	IOrderService service=(IOrderService) BeanFactory.getInstance("orderService");
	IUserDao dao=(IUserDao) BeanFactory.getInstance("userDao");
	@Test
	public void testQueryByPage(){
		service.queryByPage(dao.findByName("zhangsan"), OrderStatus.未付款, null, null, 1L, 5L, true).getList().forEach(System.out::println);
	}

}
