package com.se.iuh.controller.client;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.iuh.service.ProductService;

@Controller
@RequestMapping(value = "/client")
public class SearchProductClientController {

	@Autowired
	private ProductService productService;

	@GetMapping(value = "/search")
	public String search(HttpServletRequest request, @RequestParam(name = "text", required = false) String text) {
		
		String categoryId = null;
		

		if (request.getParameter("categoryId") != "") {
			categoryId = request.getParameter("categoryId");
		}
		request.setAttribute("text", text);
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("products",
		productService.searchByClient(categoryId, text));
		return "client/product_grid";
	}
}
