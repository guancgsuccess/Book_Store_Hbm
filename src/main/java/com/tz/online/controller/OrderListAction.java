package com.tz.online.controller;

import java.io.IOException;
import java.util.Date;
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
import com.tz.online.entity.OrderStatus;
import com.tz.online.entity.PageBean;
import com.tz.online.entity.User;
import com.tz.online.order.service.IOrderService;
import com.tz.online.util.BeanFactory;
import com.tz.online.util.DateUtil;

@WebServlet(urlPatterns = "/permission/order/orderlist")
public class OrderListAction extends HttpServlet {

	private static final long serialVersionUID = -5195733615717005107L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User u = (User) req.getSession().getAttribute("user");

		IOrderService service = (IOrderService) BeanFactory.getInstance("orderService");
		IBookService bs = (IBookService) BeanFactory.getInstance("bookService");
		//status, start, end, now, size, flag
		String status = req.getParameter("status");
		OrderStatus os = null;
		if (status != null) {
			switch (status) {
			case "1":
				os = OrderStatus.已付款;
				break;
			case "2":
				os = OrderStatus.未付款;
				break;
			case "3":
				os = OrderStatus.交易成功;
				break;
			default:
				break;
			}
		}
		String start = req.getParameter("start");
		String end = req.getParameter("end");
		Date dateStart = null;
		Date dateEnd = null;
		if (start != null && start.trim().length() > 0) {
			dateStart = DateUtil.parse("yyyy-MM-dd", start);
		}
		if (end != null && end.trim().length() > 0) {
			dateEnd = DateUtil.parse("yyyy-MM-dd", end);
		}
		String now = req.getParameter("now");
		String size = req.getParameter("size");
		Long pageNow = 1L;
		Long pageSize = 2L;
		if (now != null && now.trim().length() > 0) {
			pageNow = Long.valueOf(now);
		}
		if (size != null && size.trim().length() > 0) {
			pageSize = Long.valueOf(size);
		}

		String flag = req.getParameter("flag");
		boolean flag2 = true;
		if (flag != null) {
			switch (flag) {
			case "1":
				flag2 = true;
				break;
			case "2":
				flag2 = false;
				break;
			default:
				break;
			}
		}

		PageBean<Order> page = service.queryByPage(u, os, dateStart, dateEnd, pageNow, pageSize, flag2);
		List<Book> books = bs.findAll();
		Map<String, String> map = new HashMap<>();
		for (Book b : books) {
			map.put(b.getIsbn(), b.getImages().get(0).getUrl());
		}
		req.setAttribute("map", map);
		req.setAttribute("page", page);
		req.setAttribute("flagp", flag);
		req.setAttribute("statusp", status);
		req.getRequestDispatcher("/jsp/orderlist.jsp").forward(req, resp);
	}

}
