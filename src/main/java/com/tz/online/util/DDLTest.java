package com.tz.online.util;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

public class DDLTest {
	public static void main(String[] args) {
		Configuration cfg = new Configuration().configure();
		SchemaExport se = new SchemaExport(cfg);
		se.create(true, true);
	}

}
