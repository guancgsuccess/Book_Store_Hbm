package com.tz.online.book.dao;

import java.util.List;

import org.testng.annotations.Test;

import com.tz.online.entity.Book;
import com.tz.online.entity.Category;
import com.tz.online.util.BeanFactory;

public class TestBookDaoImpl {
	IBookDao dao = (IBookDao) BeanFactory.getInstance("bookDao");

	@Test
	public void testFindAll() {
		List<Book> books = dao.findAll("的", Category.精选图书, 1L, 7L);
		for (Book b : books) {
			System.out.println(b);
			System.out.println(b.getImages());
		}
	}
	@Test
	public void testFindAllNP() {
		List<Book> books = dao.findAll();
		for (Book b : books) {
			System.out.println(b);
			System.out.println(b.getImages());
		}
	}

	@Test
	public void testRowCount() {
		System.out.println(dao.getRows("的", Category.精选图书));
	}
	
	@Test
	public void testGetById(){
		System.out.println(dao.getById(14L));
	}
	
}
