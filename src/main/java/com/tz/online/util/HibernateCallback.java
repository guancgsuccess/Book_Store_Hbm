package com.tz.online.util;

import org.hibernate.HibernateException;
import org.hibernate.Session;

public interface HibernateCallback {

	Object doInHibernate(Session ses) throws HibernateException;
}
