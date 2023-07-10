package com.se.iuh.service;

import java.util.List;

import com.se.iuh.entity.Product;


public interface ProductService {

	void insert(Product product);

	void update(Product product);



	Product findById(long productId);

	List<Product> findAll();

	List<Product> findAllByCategoryId(long categoryId);


	List<Product> hotProducts();

	List<Product> featuredProducts();

	List<Product> search(String categoryId, String text);


	List<Product> findAllByClient();

	List<Product> findAllByCategoryIdByClient(long categoryId);

	List<Product> searchByClient(String categoryId, String text);

}
