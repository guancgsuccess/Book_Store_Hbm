package com.tz.online.order.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.tz.online.entity.Order;
import com.tz.online.entity.OrderStatus;
import com.tz.online.entity.User;
import com.tz.online.order.dao.IOrderDao;
import com.tz.online.util.HibernateTemplate;
@SuppressWarnings("all")
public class OrderDaoImpl implements IOrderDao {
	HibernateTemplate ht = new HibernateTemplate();

	@Override
	public void save(Order o) {
		ht.execute(ses -> {
			ses.save(o);
			return null;
		});
	}

	@Override
	public Order findById(Long id) {

		return (Order) ht.execute(ses -> {
			return ses.get(Order.class, id);
		});
	}

	@Override
	public Order findByNum(String num) {
		return (Order) ht.execute(ses -> {
			return ses.createQuery("from Order where orderNum=:num").setParameter("num", num).uniqueResult();
		});
	}

	@Override
	public void delete(Order o) {
		ht.execute(ses -> {
			ses.delete(o);
			return null;
		});

	}

	@Override
	public void clean(User u) {
		ht.execute(ses -> {
			List<Order> os=ses.createQuery("from Order where user=:u").setParameter("u", u).list();
			for (Order o : os) {
				ses.delete(o);
			}
			return null;
		});

	}

	@Override
	public List<Order> selectByPage(User user, OrderStatus status, Date start, Date end, Long now, Long size) {
		return (List<Order>) ht.execute(ses -> {
			Criteria c = ses.createCriteria(Order.class, "o");
			c.add(Restrictions.eq("o.user", user));
			if (null != status) {
				c.add(Restrictions.eq("o.orderStatus", status));
			}
			if (null != start) {
				c.add(Restrictions.ge("o.createDate", start));
			}
			if (null != end) {
				c.add(Restrictions.le("o.createDate", end));
			}

			c.setProjection(Projections.distinct(Projections.property("orderId") ));
			List<Long> ids=c.setFirstResult((int) ((now - 1) * size)).setMaxResults((int) (1 * size)).list();
			List<Order> ods=new ArrayList<>();
			ses.clear();
			for (Long id : ids) {
				ods.add((Order) ses.get(Order.class, id));
				ses.clear();
			}
			
			return ods;
		});
	}

	@Override
	public Long rowCount(User user, OrderStatus status, Date start, Date end) {

		return (Long) ht.execute(ses -> {
			Criteria c = ses.createCriteria(Order.class, "o");
			c.add(Restrictions.eq("o.user", user));
			if (null != status) {
				c.add(Restrictions.eq("o.orderStatus", status));
			}
			if (null != start) {
				c.add(Restrictions.ge("o.createDate", start));
			}
			if (null != end) {
				c.add(Restrictions.le("o.createDate", end));
			}
			return c.setProjection(Projections.rowCount()).uniqueResult();
		});
	}

}
