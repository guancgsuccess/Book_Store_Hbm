package com.tz.online.order.service.impl;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import com.tz.online.entity.Order;
import com.tz.online.entity.OrderStatus;
import com.tz.online.entity.PageBean;
import com.tz.online.entity.User;
import com.tz.online.order.dao.IOrderDao;
import com.tz.online.order.service.IOrderService;
import com.tz.online.util.BeanFactory;

public class OrderServiceImpl implements IOrderService {
	IOrderDao dao = (IOrderDao) BeanFactory.getInstance("orderDao");

	@Override
	public void save(Order o) {
		dao.save(o);
	}

	@Override
	public Order findById(Long id) {
		return dao.findById(id);
	}

	@Override
	public Order findByNum(String num) {
		// TODO Auto-generated method stub
		return dao.findByNum(num);
	}

	@Override
	public void delete(Order o) {
		dao.delete(o);

	}

	@Override
	public void clean(User u) {
		dao.clean(u);

	}

	@Override
	public PageBean<Order> queryByPage(User user, OrderStatus status, Date start, Date end, Long now, Long size,
			boolean flag) {
		PageBean<Order> page = new PageBean<>();
		List<Order> orders = dao.selectByPage(user, status, start, end, now, size);
		Collections.sort(orders, new Comparator<Order>() {

			@Override
			public int compare(Order o1, Order o2) {
				if (flag) {
					return o2.getCreateDate().compareTo(o1.getCreateDate());
				} else {
					return o1.getCreateDate().compareTo(o2.getCreateDate());
				}
			}
		});


		page.setList(orders);

		page.setPageNow(now);
		page.setPageSize(size);
		Long rowCount = dao.rowCount(user, status, start, end);
		Long pageCount = rowCount / size;
		if (rowCount % size != 0) {
			pageCount++;
		}
		page.setPageCount(pageCount);

		return page;
	}

}
