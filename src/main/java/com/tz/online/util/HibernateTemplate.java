package com.tz.online.util;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

public final class HibernateTemplate {

	public final Object execute(HibernateCallback hc) {
		Object obj = null;

		Session ses = null;
		Transaction tx = null;
		try {
			ses = HibernateUtil.getSession();
			tx = ses.beginTransaction();
			obj = hc.doInHibernate(ses);
			tx.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			HibernateUtil.close(ses);
		}
		return obj;
	}
}
