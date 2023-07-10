package com.se.iuh.service;

import java.util.List;

import com.se.iuh.entity.User;

public interface UserService {

	void insert(User user);
	
	void update(User user);

	User findById(long userId);
	
	List<User> findAll();

	User findByEmailOrPhoneAndPassword(String account, String password);
	
	User findByEmail(String email);

	
}
