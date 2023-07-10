package com.se.iuh.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.iuh.dao.CategoryDao;
import com.se.iuh.entity.Category;

@Transactional
@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Category> findAll() {
		String sql = "SELECT o FROM Category o";
		
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.list();
		
	}

}
