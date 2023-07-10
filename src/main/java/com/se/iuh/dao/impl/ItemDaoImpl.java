package com.se.iuh.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.iuh.dao.ItemDao;
import com.se.iuh.entity.Item;

@Repository
@Transactional
public class ItemDaoImpl implements ItemDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void insert(Item item) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(item);
	}


	@Override
	public List<Item> findByOrderId(long orderId) {
		String sql = "SELECT i FROM Item i WHERE i.order.orderId = " + orderId;
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.list();
	}

}
