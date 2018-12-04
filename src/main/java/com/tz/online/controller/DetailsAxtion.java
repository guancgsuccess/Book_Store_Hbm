package com.tz.online.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.online.book.service.IBookService;
import com.tz.online.entity.Book;
import com.tz.online.util.BeanFactory;
@WebServlet(urlPatterns="/book/details")
public class DetailsAxtion extends HttpServlet{

	private static final long serialVersionUID = -1156455727124552567L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IBookService service=(IBookService) BeanFactory.getInstance("bookService");
		Long id=Long.valueOf(req.getParameter("id")) ;
		Book b=service.query(id);
		req.setAttribute("book", b);
		req.getRequestDispatcher("/jsp/details.jsp").forward(req, resp);
	}
}
