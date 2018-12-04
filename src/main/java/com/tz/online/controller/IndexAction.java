package com.tz.online.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.online.book.service.IBookService;
import com.tz.online.entity.Book;
import com.tz.online.entity.Category;
import com.tz.online.entity.PageBean;
import com.tz.online.util.BeanFactory;

@WebServlet(urlPatterns = "/book/index")
public class IndexAction extends HttpServlet {

	private static final long serialVersionUID = 3436735205773305747L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IBookService service = (IBookService) BeanFactory.getInstance("bookService");
		PageBean<Book> page1 = service.findByPage(null, Category.精选图书, 1l, 4l);
		PageBean<Book> page2 = service.findByPage(null, Category.推荐图书, 1l, 4l);
		PageBean<Book> page3 = service.findByPage(null, Category.特价图书, 1l, 4l);
		req.setAttribute("page1", page1);
		req.setAttribute("page2", page2);
		req.setAttribute("page3", page3);
		req.getRequestDispatcher("/jsp/index.jsp").forward(req, resp);
	}
}
