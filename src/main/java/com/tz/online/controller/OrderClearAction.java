package com.tz.online.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.online.entity.User;
import com.tz.online.order.service.IOrderService;
import com.tz.online.util.BeanFactory;

@WebServlet(urlPatterns = "/permission/order/clear")
public class OrderClearAction extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -367374744980467588L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User u = (User) req.getSession().getAttribute("user");
		IOrderService service = (IOrderService) BeanFactory.getInstance("orderService");
		service.clean(u);
		resp.sendRedirect(req.getContextPath() + "/permission/order/orderlist");

	}

}
