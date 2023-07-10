package com.se.iuh.dao;

import java.util.List;

import com.se.iuh.entity.Item;

public interface ItemDao {

	void insert(Item item);
	List<Item> findByOrderId(long orderId);
}
