package com.tz.online.user.dao.impl;

import java.util.List;

import com.tz.online.entity.Address;
import com.tz.online.entity.User;
import com.tz.online.user.dao.IUserDao;
import com.tz.online.util.HibernateTemplate;

@SuppressWarnings("all")
public class UserDaoImpl implements IUserDao {
	HibernateTemplate ht = new HibernateTemplate();

	@Override
	public void save(User u) {
		ht.execute(ses -> {
			ses.save(u);
			return null;
		});

	}

	@Override
	public User findByName(String userName) {

		return (User) ht.execute(ses -> {
			String hql = "from User where userName=:uname";
			return ses.createQuery(hql).setParameter("uname", userName).uniqueResult();
		});
	}

	@Override
	public List<Address> findAddress(User u) {
		// TODO Auto-generated method stub
		return (List<Address>) ht.execute(ses -> {
			return ses.createQuery("from Address where user=:user").setParameter("user", u).list();
		});
	}

	@Override
	public void addAddress(Address addr) {
		ht.execute(ses -> {
			ses.save(addr);
			return null;
		});

	}

	@Override
	public void updateAsN() {
		ht.execute(ses->{
			String hql="update Address set isDefault='N' where isDefault='Y'";
			ses.createQuery(hql).executeUpdate();
			return null;
		});
		
	}

	@Override
	public Address findAddrById(Long id) {
		// TODO Auto-generated method stub
		return (Address) ht.execute(ses->{
			return ses.get(Address.class, id);
		});
	}

}
