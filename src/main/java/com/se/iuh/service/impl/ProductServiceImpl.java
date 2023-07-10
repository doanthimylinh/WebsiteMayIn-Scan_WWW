package com.se.iuh.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.iuh.dao.ProductDao;
import com.se.iuh.entity.Category;
import com.se.iuh.entity.Product;

import com.se.iuh.service.ProductService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;

	@Override
	public void insert(Product product) {
		
		
		productDao.insert(product);
	}

	@Override
	public void update(Product product) {

		productDao.update(product);
	}

	@Override
	public Product findById(long productId) {
		Product product = productDao.findById(productId);


		return product;
	}

	@Override
	public List<Product> findAll() {
		List<Product> products = productDao.findAll();
//		List<ProductDTO> productDTOs = new ArrayList<>();
		
		return products;
	}

	@Override
	public List<Product> findAllByCategoryId(long categoryId) {
		List<Product> products = productDao.findAllByCategoryId(categoryId);

		return products;
	}


	@Override
	public List<Product> hotProducts() {
		List<Product> products = productDao.hotProducts();

		return products;
	}

	@Override
	public List<Product> featuredProducts() {
		List<Product> products = productDao.featuredProducts();
		
		
		return products;
	}

	@Override
	public List<Product> search(String categoryId, String text) {
		List<Product> products = productDao.search(categoryId, text);
		
		
		return products;
	}


	@Override
	public List<Product> findAllByClient() {
		List<Product> products = productDao.findAllByClient();
		
		
		return products;
	}

	@Override
	public List<Product> findAllByCategoryIdByClient(long categoryId) {
		List<Product> products = productDao.findAllByCategoryIdByClient(categoryId);
		
		return products;
	}

	@Override
	public List<Product> searchByClient(String categoryId, String text) {
		List<Product> products = productDao.searchByClient(categoryId, text);
		
		return products;
	}

}
