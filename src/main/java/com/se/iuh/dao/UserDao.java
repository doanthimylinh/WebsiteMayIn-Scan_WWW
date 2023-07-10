package com.se.iuh.dao;

import java.util.List;

import com.se.iuh.entity.User;

public interface UserDao {

	void insert(User user);
	
	void update(User user);

	
	User findById(long userId);
	
	List<User> findAll();

	User findByEmailOrPhoneAndPassword(String account, String password);

	User loadUserByUsername(String account);
	
	User findByEmail(String email);
	

}
