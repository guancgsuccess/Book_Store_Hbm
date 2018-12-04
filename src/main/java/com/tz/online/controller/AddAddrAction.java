package com.tz.online.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.tz.online.entity.Address;
import com.tz.online.entity.User;
import com.tz.online.user.service.IUserService;
import com.tz.online.util.BeanFactory;

@WebServlet(urlPatterns = "/permission/order/addaddr")
public class AddAddrAction extends HttpServlet {

	private static final long serialVersionUID = -5689743396885837103L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IUserService service = (IUserService) BeanFactory.getInstance("userService");
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		Address a = new Address();
		a.setArea(req.getParameter("area"));
		a.setDetailAddress(req.getParameter("deatails"));
		a.setEmailCode(req.getParameter("mailcode"));
		a.setReciver(req.getParameter("username"));
		a.setTel(req.getParameter("tel"));
		a.setIsDefault(req.getParameter("isdefault"));
		User u = (User) req.getSession().getAttribute("user");
		a.setUser(u);
		service.addAddress(a);
		List<Address> addresss=service.findAddress(u);
		Collections.sort(addresss,new Comparator<Address>() {

			@Override
			public int compare(Address o1, Address o2) {
				
				return o2.getAddressId().compareTo(o1.getAddressId());
			}
		});
		String str = JSON.toJSONString(addresss);
		out.print(str);
	}
}
