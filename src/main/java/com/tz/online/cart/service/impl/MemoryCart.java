package com.tz.online.cart.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.tz.online.cart.service.IShoppingCart;
import com.tz.online.entity.OrderItem;
public class MemoryCart implements IShoppingCart{

	//属性
	private Map<Long, OrderItem> items = new HashMap<>();

	private double total;

	private int count;

	public MemoryCart() {
		// TODO Auto-generated constructor stub
	}

	public MemoryCart(Map<Long, OrderItem> items, double total, int count) {
		super();
		this.items = items;
		this.total = total;
		this.count = count;
	}

	public Map<Long, OrderItem> getItems() {
		return items;
	}

	public void setItems(Map<Long, OrderItem> items) {
		this.items = items;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal() {
		Set<Long> set=items.keySet();
		Iterator<Long> iter=set.iterator();
		double total=0;
		while (iter.hasNext()) {
			total+=items.get(iter.next()).getAllPrice();
		}
		this.total=total;
	}

	public int getCount() {
		return count;
	}

	public void setCount() {
		Set<Long> set=items.keySet();
		Iterator<Long> iter=set.iterator();
		int count=0;
		while (iter.hasNext()) {
			count+=items.get(iter.next()).getCount();
		}
		this.count=count;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemoryCart [items=");
		builder.append(items);
		builder.append(", total=");
		builder.append(total);
		builder.append(", count=");
		builder.append(count);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public void addCart(Long bookId,OrderItem item) {
		if (this.items.containsKey(bookId)) {
			OrderItem oi=items.get(bookId);
			oi.setAllPrice(oi.getAllPrice()+item.getAllPrice());
			oi.setCount(oi.getCount()+item.getCount());
			items.put(bookId, oi);
		}else{
			items.put(bookId, item);
		}
		setCount();
		setTotal();
	}

	@Override
	public void clear() {
		items.clear();
		setCount();
		setTotal();
	}

	@Override
	public void modifyCount(Long bookId, Long count) {
		OrderItem oi=items.get(bookId);
		oi.setCount(count);
		oi.setAllPrice(count*oi.getPrice());
		items.put(bookId, oi);
		setCount();
		setTotal();

	}

	@Override
	public void delete(Long bookId) {
		items.remove(bookId);
		setCount();
		setTotal();

	}

	@Override
	public OrderItem find(Long bookId) {
		
		return items.get(bookId);
		
	}

}
