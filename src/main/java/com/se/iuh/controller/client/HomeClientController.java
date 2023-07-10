package com.se.iuh.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.iuh.service.CategoryService;
import com.se.iuh.service.ProductService;

@Controller
@RequestMapping(value = "/client")
public class HomeClientController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ProductService productService;

	@GetMapping(value = "/home")
	public String home(HttpServletRequest request, HttpSession session) {
		request.setAttribute("hotOne", productService.hotProducts());

		request.setAttribute("featuredOne", productService.featuredProducts());

		session.setAttribute("categories", categoryService.findAll());
		return "client/home";
	}
}
