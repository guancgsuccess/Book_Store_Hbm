package com.tz.online.util;

import java.io.InputStream;
import java.util.Properties;


public class BeanFactory {

	private static Properties prop;
	public static final String FILEPATH = "bean.properties";

	static {
		try {
			prop = new Properties();
			InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream(FILEPATH);
			prop.load(in);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("初始化文件失败");
		}
	}

	public static Object getInstance(String beanKey) {
		Object obj = null;
		String beanName = prop.getProperty(beanKey);
		try {
			Class<?> c = Class.forName(beanName);
			obj = c.newInstance();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return obj;
	}
}
