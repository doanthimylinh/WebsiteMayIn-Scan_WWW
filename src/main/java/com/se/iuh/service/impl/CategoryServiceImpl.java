package com.se.iuh.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.iuh.dao.CategoryDao;
import com.se.iuh.entity.Category;

import com.se.iuh.service.CategoryService;


@Transactional
@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public List<Category> findAll() {
		List<Category> categories = categoryDao.findAll();
		
		return categories;
	}

}
