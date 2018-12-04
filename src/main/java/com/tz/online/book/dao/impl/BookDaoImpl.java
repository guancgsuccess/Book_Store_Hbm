package com.tz.online.book.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.tz.online.book.dao.IBookDao;
import com.tz.online.entity.Book;
import com.tz.online.entity.Category;
import com.tz.online.util.HibernateTemplate;

@SuppressWarnings("all")
public class BookDaoImpl implements IBookDao {
	HibernateTemplate ht = new HibernateTemplate();

	@Override
	public List<Book> findAll(String bookName, Category category, Long pageNow, Long pageSize) {

		return (List<Book>) ht.execute(ses -> {
			Criteria c = ses.createCriteria(Book.class, "b");
			if (null != bookName && bookName.trim().length() > 0) {
				c.add(Restrictions.like("b.name", "%" + bookName + "%"));
			}
			if (null != category) {
				c.add(Restrictions.eq("b.category", category));
			}
			return c.setFirstResult((int) ((pageNow - 1) * pageSize)).setMaxResults((int) (1 * pageSize)).list();
		});
	}

	@Override
	public Long getRows(String bookName, Category category) {
		return (Long) ht.execute(ses -> {
			Criteria c = ses.createCriteria(Book.class, "b");
			if (null != bookName && bookName.trim().length() > 0) {
				c.add(Restrictions.like("b.name", "%" + bookName + "%"));
			}
			if (null != category) {
				c.add(Restrictions.eq("b.category", category));
			}
			return c.setProjection(Projections.rowCount()).uniqueResult();
		});
	}

	@Override
	public Book getById(Long id) {
		return (Book) ht.execute(ses->{
			return ses.get(Book.class, id);
		});
	}

	@Override
	public List<Book> findAll() {
		
		return (List<Book>) ht.execute(ses->{
			return ses.createQuery("from Book").list();
		});
	}


}
