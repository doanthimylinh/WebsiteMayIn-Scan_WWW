package com.se.iuh.dao;

import java.util.List;

import com.se.iuh.entity.Product;

public interface ProductDao {

	void insert(Product product);

	void update(Product product);

	Product findById(long productId);

	List<Product> findAll();

	List<Product> findAllByCategoryId(long categoryId);
	List<Product> hotProducts();

	List<Product> featuredProducts();

	List<Product> search(String categoryId, String text);

//	client
	List<Product> findAllByClient();

	List<Product> findAllByCategoryIdByClient(long categoryId);

	List<Product> searchByClient(String categoryId, String text);
//	int countByClient();
	
}
