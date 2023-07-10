package com.se.iuh.service;

import java.util.List;

import com.se.iuh.entity.Item;


public interface ItemService {

	void insert(Item item);
	List<Item> findByOrderId(long orderId);
	
}
