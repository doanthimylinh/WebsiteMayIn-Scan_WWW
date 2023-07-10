package com.se.iuh.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.se.iuh.dao.RoleDao;
import com.se.iuh.entity.Role;

@Repository
@Transactional
public class RoleDaoImpl implements RoleDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Role> findAll() {
		String sql = "SELECT r FROM Role r ";

		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		return query.list();
	}

}
