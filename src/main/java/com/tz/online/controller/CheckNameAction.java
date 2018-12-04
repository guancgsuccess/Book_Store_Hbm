package com.tz.online.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.online.entity.User;
import com.tz.online.user.service.IUserService;
import com.tz.online.util.BeanFactory;
@WebServlet(urlPatterns="/user/check")
public class CheckNameAction extends HttpServlet{

	private static final long serialVersionUID = 7527428181450206348L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IUserService service = (IUserService) BeanFactory.getInstance("userService");
		PrintWriter out=resp.getWriter();
		String uname=req.getParameter("uname");
		User u=service.login(uname);
		if (null!=u) {
			out.print("1");
		} else {
			out.print("0");
		}
	}
}
