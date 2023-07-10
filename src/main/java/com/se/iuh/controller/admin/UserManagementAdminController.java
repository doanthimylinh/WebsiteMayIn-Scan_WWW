package com.se.iuh.controller.admin;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.se.iuh.dao.RoleDao;
import com.se.iuh.entity.Role;
import com.se.iuh.entity.User;
import com.se.iuh.service.RoleService;
import com.se.iuh.service.UserService;

@Controller
@RequestMapping("/admin")
public class UserManagementAdminController {

	

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	

	@GetMapping("/user-list")
	public String userList(HttpServletRequest request) {
		
		
		request.setAttribute("users", userService.findAll());
		return "admin/user/listUser";
	}

	

	@GetMapping(value = "/user-create")
	public String userCreate(HttpServletRequest request) {
		request.setAttribute("roles", roleService.findAll());
		return "admin/user/createUser";
	}

	@PostMapping(value = "/user-create")
	public String userCreate(HttpServletRequest request, @RequestParam(name = "email") String email,
			@RequestParam(name = "fullName", required = false) String fullName,
			@RequestParam(name = "gender") boolean gender, @RequestParam(name = "phone") String phone,
			@RequestParam(name = "address") String address, @RequestParam(name = "roleId") long roleId,
			@RequestParam(name = "password") String password, @RequestParam(name = "repassword") String repassword,
			@RequestParam(name = "avatarFile") MultipartFile avatarFile) {
		String reg = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
		
		if (userService.findByEmail(email) != null) {
			request.setAttribute("roles", roleService.findAll());
			request.setAttribute("message", "Email đã tồn tại!");
			return "admin/user/createUser";
		} else {

			User user = new User();
			Role role = new Role();
			role.setRoleId(roleId);

			user.setEmail(email);
			user.setFullname(fullName);
			user.setGender(gender);
			user.setPhone(phone);
			user.setAddress(address);
			user.setRole(role);
			if (avatarFile != null && avatarFile.getSize() > 0) {
				String originalFilename = avatarFile.getOriginalFilename();
				int lastIndex = originalFilename.lastIndexOf(".");
				String ext = originalFilename.substring(lastIndex);
				String avatarFilename = System.currentTimeMillis() + ext;
				File newfile = new File("E:\\BTL_WWW_N9\\18_N9_WWW\\image_spring_boot\\" + avatarFilename);
				FileOutputStream fileOutputStream;
				try {
					fileOutputStream = new FileOutputStream(newfile);
					fileOutputStream.write(avatarFile.getBytes());
					fileOutputStream.close();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				user.setAvatar(avatarFilename);
			}
			if(!phone.matches(reg)) {
				request.setAttribute("message", "Số điện thoại không hợp lệ!");
				request.setAttribute("roles", roleService.findAll());
				return "admin/user/createUser";
			}
			if (password.equals(repassword)) {
				user.setPassword(new BCryptPasswordEncoder().encode(repassword));
				userService.insert(user);
				return "redirect:../admin/user-list";
			} else {
				request.setAttribute("message", "Mật khẩu không khớp!");
				request.setAttribute("roles", roleService.findAll());
				return "admin/user/createUser";
			}
		}

	}

	
	@GetMapping(value = "user-update")
	public String userUpdate(HttpServletRequest request, @RequestParam(name = "userId") long userId) {
		request.setAttribute("roles", roleService.findAll());
		request.setAttribute("user", userService.findById(userId));
		return "admin/user/updateUser";
	}
	
	@PostMapping (value = "user-update")
	public String userUpdate(HttpServletRequest request, @RequestParam(name = "userId") long userId,
			@RequestParam(name = "fullName", required = false) String fullName,
			@RequestParam(name = "gender") boolean gender, @RequestParam(name = "phone") String phone,
			@RequestParam(name = "address") String address, @RequestParam(name = "roleId") long roleId,
			@RequestParam(name = "password", required = false) String password, @RequestParam(name = "repassword", required = false) String repassword,
			@RequestParam(name = "avatarFile") MultipartFile avatarFile,
			@RequestParam(name = "avatar") String avatar) {
		String reg = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
		User user = userService.findById(userId);
		Role role = new Role();
		role.setRoleId(roleId);
  
		user.setFullname(fullName);
		user.setGender(gender);
		user.setPhone(phone);
		user.setAddress(address);
		user.setRole(role);
		if (avatarFile != null && avatarFile.getSize() > 0) {
			String originalFilename = avatarFile.getOriginalFilename();
			int lastIndex = originalFilename.lastIndexOf(".");
			String ext = originalFilename.substring(lastIndex);
			String avatarFilename = System.currentTimeMillis() + ext;
			File newfile = new File("E:\\BTL_WWW_N9\\18_N9_WWW\\image_spring_boot\\" + avatarFilename);
			FileOutputStream fileOutputStream;
			try {
				fileOutputStream = new FileOutputStream(newfile);
				fileOutputStream.write(avatarFile.getBytes());
				fileOutputStream.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			user.setAvatar(avatarFilename);
		}
		if(!phone.matches(reg)) {
			request.setAttribute("message", "Số điện thoại không hợp lệ!");
			request.setAttribute("roles", roleService.findAll());
			return "admin/user/updateUser";
		}
		if(password.equals("")&& repassword.equals("")) {
			user.setPassword(user.getPassword());
			userService.update(user);
			return "redirect:../admin/user-list";
		}else if (password.equals(repassword) && password != null) {
			user.setPassword(new BCryptPasswordEncoder().encode(repassword));
			userService.update(user);
			return "redirect:../admin/user-list";
		}
		else {
			request.setAttribute("message", "Mật khẩu không khớp!");
			request.setAttribute("roles", roleService.findAll());
			request.setAttribute("user", userService.findById(userId));
			return "admin/user/updateUser";
		}
	}

}

