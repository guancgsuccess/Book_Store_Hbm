package com.tz.online.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tz.online.cart.service.IShoppingCart;
import com.tz.online.entity.Address;
import com.tz.online.entity.Order;
import com.tz.online.entity.OrderItem;
import com.tz.online.entity.OrderStatus;
import com.tz.online.entity.User;
import com.tz.online.order.service.IOrderService;
import com.tz.online.user.service.IUserService;
import com.tz.online.util.BeanFactory;

@WebServlet(urlPatterns = "/permission/order/submitorder")
public class SubmitAction extends HttpServlet {

	private static final long serialVersionUID = 2565001355295964661L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IUserService service = (IUserService) BeanFactory.getInstance("userService");
		IOrderService oservice = (IOrderService) BeanFactory.getInstance("orderService");
		HttpSession ses = req.getSession();
		User u = (User) ses.getAttribute("user");
		IShoppingCart c = (IShoppingCart) ses.getAttribute("cart");
		String addrid = req.getParameter("addrid");
		String[] bids = req.getParameter("bids").split(":");
		Address addr = service.findAddrById(Long.valueOf(addrid));

		Order o = new Order();
		o.setAddress(addr);
		o.setCreateDate(new Date());
		o.setOrderNum(String.valueOf(System.currentTimeMillis()));
		o.setOrderStatus(OrderStatus.未付款);
		o.setUser(u);
		Set<OrderItem> os = new HashSet<>();
		for (String s : bids) {
			OrderItem oi = c.find(Long.valueOf(s));
			oi.setOrder(o);
			os.add(oi);
		}
		o.setItems(os);
		oservice.save(o);

		for (String s : bids) {
			c.delete(Long.valueOf(s));
		}
		ses.setAttribute("cart", c);

		resp.sendRedirect(req.getContextPath() + "/permission/order/orderlist");

	}
}
