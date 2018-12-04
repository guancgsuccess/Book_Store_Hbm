package com.tz.online.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tz.online.book.service.IBookService;
import com.tz.online.cart.service.IShoppingCart;
import com.tz.online.entity.Address;
import com.tz.online.entity.Book;
import com.tz.online.entity.OrderItem;
import com.tz.online.entity.User;
import com.tz.online.user.service.IUserService;
import com.tz.online.util.BeanFactory;

@WebServlet(urlPatterns = "/permission/order/comfirm")
public class ComfirmOrderAction extends HttpServlet {

	private static final long serialVersionUID = 107643533525322362L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IBookService bookService = (IBookService) BeanFactory.getInstance("bookService");
		IUserService service = (IUserService) BeanFactory.getInstance("userService");
		HttpSession ses=req.getSession();
		IShoppingCart cart = (IShoppingCart) ses.getAttribute("cart");
		String str=req.getParameter("ids");
		IShoppingCart cart_temp;
		if (str.equals("all")) {
			cart_temp=cart;
		}else{
			String[] ids=str.split(":");
			cart_temp=(IShoppingCart) BeanFactory.getInstance("cartService");
			for (String id : ids) {
				cart_temp.addCart(Long.valueOf(id), cart.find(Long.valueOf(id)));
			}
		}
		Map<Book, OrderItem> map = new HashMap<>();
		if (cart_temp!=null) {
			Map<Long, OrderItem> map1 = cart_temp.getItems();
			Set<Long> set = map1.keySet();
			for (Long l : set) {
				map.put(bookService.query(l), map1.get(l));
			}
		}
		req.setAttribute("bookAndItemTmp", map);
		
		//地址部分
		User u=(User) ses.getAttribute("user");
		List<Address> adds=service.findAddress(u);
		req.setAttribute("addresss", adds);	
		req.getRequestDispatcher("/jsp/confirm_order.jsp").forward(req, resp);
	}

}
