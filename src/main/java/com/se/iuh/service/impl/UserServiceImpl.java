package com.se.iuh.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.se.iuh.dao.UserDao;
import com.se.iuh.entity.Role;
import com.se.iuh.entity.User;
import com.se.iuh.entity.UserPrincipal;
import com.se.iuh.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService, UserDetailsService {

	@Autowired
	private UserDao userDao;

	@Override
	public void insert(User user) {
		
		userDao.insert(user);
	}

	@Override
	public void update(User user) {
		System.out.println(user.getPassword());
		userDao.update(user);
		
		System.out.println(user);
	}


	@Override
	public User findById(long userId) {
		User user = userDao.findById(userId);
		
		return user;
	}

	@Override
	public List<User> findAll() {
		List<User> users = userDao.findAll();
		return users;
	}

	@Override
	public User findByEmailOrPhoneAndPassword(String account, String password) {
		User user = userDao.findByEmailOrPhoneAndPassword(account, password);
		
		return user;
	}

	@Override
	public UserDetails loadUserByUsername(String account) throws UsernameNotFoundException {
		User user = userDao.loadUserByUsername(account);
		if (user == null) {
			throw new UsernameNotFoundException("Not Found!");
		}

		List<SimpleGrantedAuthority> roleList = new ArrayList<>();

		roleList.add(new SimpleGrantedAuthority(user.getRole().getRoleName()));

		UserPrincipal userPrincipal = new UserPrincipal(user.getEmail(), user.getPhone(), user.getPassword(), roleList);
		userPrincipal.setUserId(user.getUserId());
		userPrincipal.setEmail(user.getEmail());
		userPrincipal.setPhone(user.getPhone());
		userPrincipal.setAddress(user.getAddress());
		userPrincipal.setAvatar(user.getAvatar());
		userPrincipal.setFullname(user.getFullname());
		
		userPrincipal.setGender(user.isGender());
		userPrincipal.setPassword(user.getPassword());
		userPrincipal.setRole(user.getRole());
		return userPrincipal;
	}


	@Override
	public User findByEmail(String email) {
		User user = userDao.findByEmail(email);
		if (user != null) {
			
			return user;
		}
		return null;
	}

}
