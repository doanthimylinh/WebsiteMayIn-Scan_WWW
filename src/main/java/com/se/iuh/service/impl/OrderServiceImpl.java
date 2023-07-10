package com.se.iuh.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.iuh.dao.OrderDao;
import com.se.iuh.entity.Order;
import com.se.iuh.entity.User;
import com.se.iuh.service.OrderService;

@Service
@Transactional
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDao orderDao;

	@Override
	public void insert(Order order) {

		
		orderDao.insert(order);
	}

	@Override
	public void update(Order order) {
//		
//
//		User user = new User();
//		user.setUserId(order.getBuyer().getUserId());
//		order.setOrderId(order.getOrderId());
//		order.setBuyDate(order.getBuyDate());
//		order.setPriceTotal(order.getPriceTotal());
//		order.setBuyer(user);
		
		orderDao.update(order);
	}


	@Override
	public List<Order> findAll() {
		List<Order> orders = orderDao.findAll();
//		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
//		
//		List<Order> orders2 = new ArrayList<Order>();
//		for (Order order : orders) {
//			User user = new User();
//			user.setUserId(order.getBuyer().getUserId());
//			user.setEmail(order.getBuyer().getEmail());
//			user.setAddress(order.getBuyer().getAddress());
//			user.setPhone(order.getBuyer().getPhone());
//			user.setFullname(order.getBuyer().getFullname());
//			
//			Order order2 = new Order();
//			order2.setOrderId(order.getOrderId());
//			String strBuyDate = sdf.format(order.getBuyDate());
//			order2.setBuyDate(order.getBuyDate());
//			order2.setPriceTotal(order.getPriceTotal());
//			order2.setBuyer(user);
//			orders.add(order);
////			order.setBuyer(user);
//		}
		return orders;
	}

	@Override
	public List<Order> findByBuyer(long userId) {
		List<Order> orders = orderDao.findByBuyer(userId);
		
		return orders;
	}


	@Override
	public Order findById(long orderId) {
		Order order = orderDao.findById(orderId);

		return order;
	}

}
