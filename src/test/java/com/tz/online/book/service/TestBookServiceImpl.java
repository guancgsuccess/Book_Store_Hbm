package com.tz.online.book.service;

import org.testng.annotations.Test;

import com.tz.online.util.BeanFactory;
import com.tz.online.book.service.IBookService;
import com.tz.online.entity.Book;
import com.tz.online.entity.Category;
import com.tz.online.entity.PageBean;

public class TestBookServiceImpl {

	IBookService service = (IBookService) BeanFactory.getInstance("bookService");

	@Test
	public void testFindByPage() {

		PageBean<Book> page = service.findByPage("", Category.精选图书, 1L, 7L);

		System.out.println(page);

	}

	@Test
	public void testQuery() {

		System.out.println(service.query(15L));
	}

}
