package com.tz.online.order.service;

import java.util.Date;
import java.util.List;

import com.tz.online.entity.Order;
import com.tz.online.entity.OrderStatus;
import com.tz.online.entity.PageBean;
import com.tz.online.entity.User;

public interface IOrderService {
	/**
	 * 保存订单
	 * @param o
	 */
	public void save(Order o);

	/*****
	 * 按主键查询
	 * @param id
	 */
	public Order findById(Long id);

	/*****
	 * 按订单号查询
	 * @param id
	 */
	public Order findByNum(String num);

	/****
	 * 删除
	 * @param o
	 */
	public void delete(Order o);

	/****
	 * 清空
	 * @param u
	 */
	public void clean(User u);

	/**
	 * 条件查询
	 * @param user
	 * @param status
	 * @param start
	 * @param end
	 * @param now
	 * @param size
	 * @return
	 */
	public PageBean<Order> queryByPage(User user, OrderStatus status, Date start, Date end, Long now, Long size,
			boolean flag);

}
