package com.se.iuh.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.iuh.dao.ItemDao;
import com.se.iuh.entity.Item;
import com.se.iuh.entity.Order;
import com.se.iuh.entity.Product;

import com.se.iuh.service.ItemService;

@Service
@Transactional
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemDao itemDao;
	
	@Override
	public void insert(Item item) {
		itemDao.insert(item);
	}


	@Override
	public List<Item> findByOrderId(long orderId) {
		List<Item> items = itemDao.findByOrderId(orderId);
		
		return items;
	}

}
