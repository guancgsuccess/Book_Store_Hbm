package com.tz.online.cart.service;

import java.util.Map;

import com.tz.online.entity.OrderItem;

public interface IShoppingCart {
	// 添加到购物车
	void addCart(Long bookId, OrderItem item);

	// 清空购物车
	void clear();

	// 修改数量
	void modifyCount(Long bookId, Long count);

	// 删除某个条目
	void delete(Long bookId);

	// 获取总价
	double getTotal();

	// 获取商品数量
	int getCount();

	//获取购物车数据
	Map<Long, OrderItem> getItems();

	//获取购物车的商品详情
	OrderItem find(Long bookId);

}
