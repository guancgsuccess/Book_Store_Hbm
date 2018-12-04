package com.tz.online.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**Hibernate基础工具�?*/
public class HibernateUtil {

	private static SessionFactory sessionFactory;

	static {
		try {
			Configuration cfg = new Configuration().configure();
			ServiceRegistry sr = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
			sessionFactory = cfg.buildSessionFactory(sr);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Session getSession() {
		return sessionFactory == null ? null : sessionFactory.openSession();
	}

	public static void close(Session ses) {
		if (ses != null) {
			ses.close();
		}
	}
}
