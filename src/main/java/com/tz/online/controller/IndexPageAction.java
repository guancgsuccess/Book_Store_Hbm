package com.tz.online.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.tz.online.book.service.IBookService;
import com.tz.online.entity.Book;
import com.tz.online.entity.Category;
import com.tz.online.entity.PageBean;
import com.tz.online.util.BeanFactory;

@WebServlet(urlPatterns = "/book/page")
public class IndexPageAction extends HttpServlet {

	private static final long serialVersionUID = 168989079317053227L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json;charset=utf-8");
		IBookService service = (IBookService) BeanFactory.getInstance("bookService");
		Long pageNow = Long.valueOf(req.getParameter("pageNow"));
		String cat = req.getParameter("cat");
		Category c=null;
		switch (cat) {
		case "1":
			c=Category.精选图书;
			break;
		case "2":
			c=Category.推荐图书;
			break;
		case "3":
			c=Category.特价图书;
			break;
		default:
			break;
		}
		PageBean<Book> page=service.findByPage(null, c, pageNow, 4L);
		String str=JSON.toJSONString(page.getList());
		PrintWriter out=resp.getWriter();
		out.println(str);

	}

}
