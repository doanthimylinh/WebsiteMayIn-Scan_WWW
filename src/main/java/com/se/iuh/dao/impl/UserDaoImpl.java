package com.se.iuh.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.iuh.dao.UserDao;
import com.se.iuh.entity.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void insert(User user) {
		sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public void update(User user) {
		sessionFactory.getCurrentSession().merge(user);
	}


	@Override
	public User findById(long userId) {
		return (User) sessionFactory.getCurrentSession().get(User.class, userId);
	}

	@Override
	public List<User> findAll() {
		String sql = "SELECT u FROM User u";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.list();
	}

	@Override
	public User findByEmailOrPhoneAndPassword(String account, String password) {
		String sql = "SELECT u FROM User u WHERE (u.email = '" + account + "' or u.phone = '" + account + "') and u.password = '" + password + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return (User) query.uniqueResult();
	}

	@Override
	public User loadUserByUsername(String account) {
		String sql = "SELECT u FROM User u WHERE (u.email = '" + account + "' or u.phone = '" + account + "')";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return (User) query.uniqueResult();
	}



	@Override
	public User findByEmail(String email) {
		String sql = "SELECT u FROM User u WHERE u.email = '" + email + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return (User) query.uniqueResult();
	}

}
