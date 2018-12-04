package com.tz.online.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tz.online.entity.User;
import com.tz.online.user.service.IUserService;
import com.tz.online.util.BeanFactory;

@WebServlet(urlPatterns = "/user/login")
public class LoginAction extends HttpServlet {

	private static final long serialVersionUID = 5733412554612310363L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IUserService service = (IUserService) BeanFactory.getInstance("userService");
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		String userName = req.getParameter("userName");
		String passWord = req.getParameter("passWord");
		String rm = req.getParameter("rm");
		User u = service.login(userName);
		if (null != u) {
			if (u.getPassWord().equals(passWord)) {
				if (rm.equals("true")) {
					Cookie c = new Cookie("login",URLEncoder.encode(userName, "utf-8")+":"+passWord);
					c.setMaxAge(60 * 60 * 24 * 3);
					c.setPath("/");
					resp.addCookie(c);
				} else {
					Cookie[] cs = req.getCookies();
					for (Cookie c : cs) {
						if (c.getName().equals("login")) {
//							c.setValue(null);
							c.setMaxAge(0);
							c.setPath("/");
							resp.addCookie(c);
						}
					}
				}
				session.setAttribute("user", u);
				out.print("2");
			} else {
				out.print("1");
			}
		} else {
			out.print("0");
		}

	}
}
