package com.tz.online.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.online.book.service.IBookService;
import com.tz.online.entity.Book;
import com.tz.online.entity.Order;
import com.tz.online.entity.PageBean;
import com.tz.online.order.service.IOrderService;
import com.tz.online.util.BeanFactory;

@WebServlet(urlPatterns = "/permission/order/ordersingle")
public class OrderSingleAction extends HttpServlet {

	private static final long serialVersionUID = -5195733615717005107L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IOrderService service = (IOrderService) BeanFactory.getInstance("orderService");
		IBookService bs = (IBookService) BeanFactory.getInstance("bookService");
		String searchnum=req.getParameter("searchnum");
		Order o=service.findByNum(searchnum.trim());

		List<Order> os=new ArrayList<>();
		if (null!=o) {
			os.add(o);
		}
		


		PageBean<Order> page = new PageBean<>(1L, 2L, 1L);
		page.setList(os);
		List<Book> books = bs.findAll();
		Map<String, String> map = new HashMap<>();
		for (Book b : books) {
			map.put(b.getIsbn(), b.getImages().get(0).getUrl());
		}
		req.setAttribute("map", map);
		req.setAttribute("page", page);
		req.getRequestDispatcher("/jsp/ordersingle.jsp").forward(req, resp);
	}

}
