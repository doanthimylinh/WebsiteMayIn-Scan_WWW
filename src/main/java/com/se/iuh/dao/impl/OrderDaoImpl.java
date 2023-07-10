package com.se.iuh.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.iuh.dao.OrderDao;
import com.se.iuh.entity.Order;

@Repository
@Transactional
public class OrderDaoImpl implements OrderDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void insert(Order order) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(order);
	}

	@Override
	public void update(Order order) {
		sessionFactory.getCurrentSession().merge(order);
	}



	@Override
	public List<Order> findAll() {
		String sql = "SELECT o FROM Order o ORDER BY o.buyDate DESC";
		
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.list();
	}

	@Override
	public List<Order> findByBuyer(long userId) {
		String sql = "SELECT o FROM Order o WHERE user_id = " + userId + " ORDER BY o.orderId DESC";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.list();
	}



	@Override
	public Order findById(long orderId) {
		return (Order) sessionFactory.getCurrentSession().get(Order.class, orderId);
	}

}
