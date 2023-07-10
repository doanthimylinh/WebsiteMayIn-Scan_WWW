package com.se.iuh.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.se.iuh.dao.RoleDao;
import com.se.iuh.entity.Role;

import com.se.iuh.service.RoleService;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;
	
	@Override
	public List<Role> findAll() {
		List<Role> roles = roleDao.findAll();
		
		return roles;
	}
	
	
	
}
