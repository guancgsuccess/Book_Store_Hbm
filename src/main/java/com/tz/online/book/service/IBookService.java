package com.tz.online.book.service;

import java.util.List;

import com.tz.online.entity.Book;
import com.tz.online.entity.Category;
import com.tz.online.entity.PageBean;

public interface IBookService {

	PageBean<Book> findByPage(String bookName, Category category, Long pageNow, Long pageSize);

	Book query(Long id);
	
	List<Book> findAll();
	
}
