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

@WebServlet(urlPatterns = "/book/list")
public class ListAction extends HttpServlet {

	private static final long serialVersionUID = -1302397688340287369L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IBookService service = (IBookService) BeanFactory.getInstance("bookService");
		String keyWord = req.getParameter("keyWord");
		keyWord = (null == keyWord) ? "" : keyWord;
		String cateGory = req.getParameter("cat");
		Category c = null;
		switch (cateGory) {
		case "1":
			c = Category.精选图书;
			break;
		case "2":
			c = Category.推荐图书;
			break;
		case "3":
			c = Category.特价图书;
			break;
		default:
			break;
		}
		String pageSize = req.getParameter("pageSize");
		pageSize = (null == pageSize) ? "4" : pageSize;
		String pageNow = req.getParameter("pageNow");
		pageNow = (null == pageNow) ? "1" : pageNow;
		

		PageBean<Book> page = service.findByPage(keyWord, c, Long.valueOf(pageNow), Long.valueOf(pageSize));
		req.setAttribute("page", page);
		req.setAttribute("cat", c);
		req.setAttribute("keyWord", keyWord);
		
		req.getRequestDispatcher("/jsp/booklist.jsp").forward(req, resp);
	
	}
}
