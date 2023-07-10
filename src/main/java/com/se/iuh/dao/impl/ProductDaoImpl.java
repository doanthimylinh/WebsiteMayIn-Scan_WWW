package com.se.iuh.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.se.iuh.dao.ProductDao;
import com.se.iuh.entity.Product;

@Repository
@Transactional
public class ProductDaoImpl implements ProductDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void insert(Product product) {
		sessionFactory.getCurrentSession().save(product);
	}

	@Override
	public void update(Product product) {
		sessionFactory.getCurrentSession().merge(product);
	}


	@Override
	public Product findById(long productId) {
		return (Product) sessionFactory.getCurrentSession().get(Product.class, productId);
	}

	@Override
	public List<Product> findAll() {
		
		String sql = "SELECT p FROM Product p ";

		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.list();
	}

	@Override
	public List<Product> findAllByCategoryId(long catgoryId) {
		String sql = "SELECT p FROM Product p WHERE p.category.categoryId = " + catgoryId;

		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.list();
	}



	@Override
	public List<Product> hotProducts() {
		String sql = "SELECT p FROM Product p WHERE p.status = 'Đang hoạt động' ORDER BY p.price DESC";
		Query query = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(4);
		return query.list();
	}

	@Override
	public List<Product> featuredProducts() {
		String sql = "SELECT p FROM Product p WHERE p.category.categoryId = 6  and p.status= 'Đang hoạt động' ORDER BY p.price DESC";

		Query query = sessionFactory.getCurrentSession().createQuery(sql).setMaxResults(4);
		return query.list();
	}

	@Override
	public List<Product> search(String categoryId, String text) {
		String sql = null;
	
		if (categoryId!=null) {
			sql = "SELECT p FROM Product p WHERE p.category.categoryId = " + categoryId;
			if (text != null) {
				sql += " and p.productName like '%" + text + "%'";
			}
		}else {
			if (text != null) {
				sql = " SELECT p FROM Product p where p.productName like '%" + text + "%'";
			}
		}

		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.list();
	}



	@Override
	public List<Product> findAllByClient() {
		String sql = "SELECT p FROM Product p WHERE p.status = 'Đang hoạt động' ";

		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.list();
	}

	@Override
	public List<Product> findAllByCategoryIdByClient(long categoryId) {
		String status= "Đang hoạt động";
		String sql = "SELECT p FROM Product p WHERE p.status = 'Đang hoạt động' and p.category.categoryId = " + categoryId;
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.list();
	}




	@Override
	public List<Product> searchByClient(String categoryId, String text) {
		String sql = null;
		if (categoryId!=null) {
			sql = "SELECT p FROM Product p WHERE p.status= 'Đang hoạt động' and p.category.categoryId = " + categoryId;
			if (text != null) {
				sql += " and p.productName like '%" + text + "%'  ";
			}
		}else {
			if (text != null) {
				sql = " SELECT p FROM Product p where p.productName like '%" + text + "%' and p.status= 'Đang hoạt động' ";
			}
		}

		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.list();
	}





}
