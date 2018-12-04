package com.tz.online.book.dao;

import java.util.List;

import com.tz.online.entity.Book;
import com.tz.online.entity.Category;

public interface IBookDao {

	List<Book> findAll(String bookName, Category category, Long pageNow, Long pageSize);
	
	List<Book> findAll();

	Long getRows(String bookName, Category category);

	Book getById(Long id);
	
}
