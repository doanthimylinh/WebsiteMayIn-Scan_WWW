package com.se.iuh.controller.authen;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.iuh.entity.Role;
import com.se.iuh.entity.User;
import com.se.iuh.service.UserService;

@Controller
public class RegisterController {

	@Autowired
	private UserService userService;


	@GetMapping(value = "/register")
	public String register() {
		return "authen/register";
	}

	@PostMapping(value = "/register")
	public String register(HttpServletRequest request, @RequestParam(name = "email") String email,
			@RequestParam(name = "password") String password, @RequestParam(name = "repassword") String repassword) {
		
		if (userService.findByEmail(email) != null) {
			User user = userService.findByEmail(email);
			if (user!=null) {
				request.setAttribute("error", "Email đã tồn tại!");
				return "authen/register";
			} else {
				if (!password.equals(repassword)) {
					request.setAttribute("error", "Mật khẩu không khớp!");
					request.setAttribute("email", email);
					user.setPassword(repassword);
					user.setAvatar("1608484153089.png");
					userService.update(user);
					return "authen/register";
				} else {
					user.setPassword(new BCryptPasswordEncoder().encode(password));
					userService.update(user);
					
				}
			}
		} else {
			if (!password.equals(repassword)) {
				request.setAttribute("error", "Mật khẩu không khớp!");
				request.setAttribute("email", email);
				return "authen/register";
			} else {
				User user = new User();
				user.setEmail(email);
				user.setPassword(new BCryptPasswordEncoder().encode(password));
				user.setAvatar("1608484153089.png");
				Role role = new Role();
				role.setRoleId(3);
				user.setRole(role);
				userService.insert(user);
				
			}
		}
		HttpSession session = request.getSession();
		session.setAttribute("emailRegister", email);
		return "authen/login";
	}
}
