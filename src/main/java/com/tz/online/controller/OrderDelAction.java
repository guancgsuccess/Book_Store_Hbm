package com.tz.online.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.online.order.service.IOrderService;
import com.tz.online.util.BeanFactory;
@WebServlet(urlPatterns="/permission/order/del")
public class OrderDelAction extends HttpServlet{

	private static final long serialVersionUID = -8969136055782147122L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] ids=req.getParameter("ids").split(":");
		IOrderService service = (IOrderService) BeanFactory.getInstance("orderService");
		
		for (String id : ids) {
			service.delete(service.findById(Long.valueOf(id)));
		}
		resp.sendRedirect(req.getContextPath()+"/permission/order/orderlist");
		
	}

}
