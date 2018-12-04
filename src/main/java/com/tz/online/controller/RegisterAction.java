package com.tz.online.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.online.entity.User;
import com.tz.online.user.service.IUserService;
import com.tz.online.util.BeanFactory;
@WebServlet(urlPatterns="/user/register")
public class RegisterAction extends HttpServlet{

	private static final long serialVersionUID = -1115793688794598001L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IUserService service=(IUserService) BeanFactory.getInstance("userService");
		User u=new User();
		u.setUserName(req.getParameter("username"));;
		u.setPassWord(req.getParameter("password"));
		u.setEmail(req.getParameter("email"));
		u.setPhone(req.getParameter("tel"));
		u.setCompany(req.getParameter("company"));
		u.setAddress(req.getParameter("addr"));
		service.register(u);
		
		//用以控制注册完成进入主页之后
		//弹出提示
		req.getSession().setAttribute("alarm", "1");
		resp.sendRedirect(req.getContextPath()+"/book/index");
		
	}

}
