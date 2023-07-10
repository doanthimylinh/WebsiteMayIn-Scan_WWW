package com.se.iuh.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.iuh.service.OrderService;

@Controller
@RequestMapping(value = "/admin")
public class HomeAdminController {

	@Autowired
	private OrderService orderService;
	
	@GetMapping(value = "/home")
	public String home(HttpServletRequest request) {
		request.setAttribute("orders", orderService.findAll());
		return "admin/home";
	}
	@GetMapping(value = "/go-web")
	public String goWeb(HttpServletRequest request) {
		request.setAttribute("orders", orderService.findAll());
		return "client/home";
	}
	
	
}
