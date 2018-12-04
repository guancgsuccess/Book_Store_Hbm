package com.tz.online.order.dao;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.testng.annotations.Test;

import com.tz.online.entity.Order;
import com.tz.online.entity.OrderItem;
import com.tz.online.entity.OrderStatus;
import com.tz.online.entity.User;
import com.tz.online.user.dao.IUserDao;
import com.tz.online.util.BeanFactory;

public class TestOrderDaoImpl {
	IOrderDao odao = (IOrderDao) BeanFactory.getInstance("orderDao");
	IUserDao udao = (IUserDao) BeanFactory.getInstance("userDao");

	@Test(enabled=false)
	public void testSave() {
		Order o = new Order();
		User u = udao.findByName("zhangsan");
		OrderItem oi = new OrderItem("asd", "adsasd", "ads", 1L, 1.1, 1.1);
		oi.setOrder(o);
		Set<OrderItem> items = new HashSet<>();
		items.add(oi);
		o.setAddress(udao.findAddress(u).get(0));
		o.setCreateDate(new Date());
		o.setUser(u);
		o.setOrderStatus(OrderStatus.已付款);
		o.setItems(items);
		o.setOrderNum("asdad");
		odao.save(o);

	}

	@Test
	public void testFindById() {
		System.out.println(odao.findById(9L));
		;

	}

	@Test
	public void testFindByNum() {
		System.out.println(odao.findByNum("asdad"));

	}

	@Test(enabled=false)
	public void testDelete() {
		odao.delete(odao.findByNum("asdad"));

	}

	@Test(enabled=false)
	public void testClean() {
		odao.clean(udao.findByName("zhangsan"));

	}

	@Test
	public void testSelectByPage() {
		odao.selectByPage(udao.findByName("zhangsan"), null, null, null, 1L, 5L).forEach(System.out::println);
		;

	}

	@Test
	public void testRowCount() {
		System.out.println(odao.rowCount(udao.findByName("zhangsan"), null, null, null));
	}

}
