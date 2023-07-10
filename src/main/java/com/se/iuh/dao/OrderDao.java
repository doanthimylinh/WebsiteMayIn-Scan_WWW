package com.se.iuh.dao;

import java.util.List;

import com.se.iuh.entity.Order;

public interface OrderDao {

	void insert(Order order);
	
	void update(Order order);
	
	List<Order> findAll();
	
	List<Order> findByBuyer(long userId);
	

	
	Order findById(long orderId);
	
}
