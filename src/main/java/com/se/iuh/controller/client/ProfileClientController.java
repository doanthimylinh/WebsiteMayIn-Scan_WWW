package com.se.iuh.controller.client;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.iuh.entity.Role;
import com.se.iuh.entity.User;
import com.se.iuh.entity.UserPrincipal;
import com.se.iuh.service.CategoryService;
import com.se.iuh.service.UserService;

@Controller
@RequestMapping(value = "/client")
public class ProfileClientController {

	@Autowired
	private UserService userService;

	@GetMapping(value = "/profile")
	public String profile() {
		return "client/profile";
	}

	@GetMapping(value = "/profile-from-cart")
	public String profileFromCart(HttpServletRequest request) {
		request.setAttribute("messageError", "Vui lòng nhập thông tin địa chỉ");
		return "client/profile";
	}

	@PostMapping(value = "/profile-update")
	public String profileUpdate(HttpServletRequest request, @RequestParam(name = "fullname") String fullname,
			@RequestParam(name = "phone") String phone, @RequestParam(name = "address") String address) {
		UserPrincipal userPrincipal = (UserPrincipal) request.getSession().getAttribute("user");
		String reg = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
		if (!phone.matches(reg)) {
			request.setAttribute("messageError", "Số điện thoại không hợp lệ!");
			return "client/profile";
		}
		userPrincipal.setFullname(fullname);
		userPrincipal.setPhone(phone);
		userPrincipal.setAddress(address);
		Role role = new Role();
		role.setRoleId(userPrincipal.getRole().getRoleId());
		role.setRoleName(userPrincipal.getRole().getRoleName());

		User user = new User();
		user.setUserId(userPrincipal.getUserId());
		user.setEmail(userPrincipal.getEmail());
		user.setPhone(userPrincipal.getPhone());
		user.setAddress(userPrincipal.getAddress());
		user.setAvatar(userPrincipal.getAvatar());
		user.setFullname(userPrincipal.getFullname());

		user.setGender(userPrincipal.isGender());
		user.setPassword(userPrincipal.getPassword());
		user.setRole(role);

		userService.update(user);
		request.setAttribute("messageSuccess", "Cập nhật thành công địa chỉ.");
		return "client/profile";

	}

	@PostMapping(value = "/change-password")
	public String changePassword(HttpServletRequest request) {
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		String repassword = request.getParameter("repassword");

		UserPrincipal userPrincipal = (UserPrincipal) request.getSession().getAttribute("user");

		Role role = new Role();
		role.setRoleId(userPrincipal.getRole().getRoleId());
		role.setRoleName(userPrincipal.getRole().getRoleName());

		User user = new User();
		user.setUserId(userPrincipal.getUserId());
		user.setEmail(userPrincipal.getEmail());
		user.setPhone(userPrincipal.getPhone());
		user.setAddress(userPrincipal.getAddress());
		user.setAvatar(userPrincipal.getAvatar());
		user.setFullname(userPrincipal.getFullname());

		user.setGender(userPrincipal.isGender());
		user.setRole(role);
		if (newpassword.equals(repassword) && repassword != null) {
			user.setPassword(new BCryptPasswordEncoder().encode(repassword));
			userService.update(user);
			System.out.println("thành công");
			request.setAttribute("messageSuccess", "Cập nhật thành công mật khẩu");
			return "client/profile";
		} else {
			request.setAttribute("messageError", "Mật khẩu không khớp!");
			return "client/profile";
		}
	}
}
