package com.tz.online.book.service.impl;

import java.util.List;

import com.tz.online.book.dao.IBookDao;
import com.tz.online.book.service.IBookService;
import com.tz.online.entity.Book;
import com.tz.online.entity.Category;
import com.tz.online.entity.PageBean;
import com.tz.online.util.BeanFactory;

public class BookServiceImpl implements IBookService {
	IBookDao dao = (IBookDao) BeanFactory.getInstance("bookDao");

	@Override
	public PageBean<Book> findByPage(String bookName, Category category, Long pageNow, Long pageSize) {
		PageBean<Book> page = new PageBean<>();
		List<Book> books = dao.findAll(bookName, category, pageNow, pageSize);
		page.setList(books);

		page.setPageNow(pageNow);
		page.setPageSize(pageSize);
		Long rowCount = dao.getRows(bookName, category);
		Long pageCount = rowCount / pageSize;
		if (rowCount % pageSize != 0) {
			pageCount++;
		}
		page.setPageCount(pageCount);

		return page;
	}

	@Override
	public Book query(Long id) {
		
		return dao.getById(id);
	}

	@Override
	public List<Book> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

}
