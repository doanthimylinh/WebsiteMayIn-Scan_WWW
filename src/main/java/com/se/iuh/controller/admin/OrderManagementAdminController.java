package com.se.iuh.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.iuh.entity.Item;

import com.se.iuh.service.ItemService;
import com.se.iuh.service.OrderService;

@Controller
@RequestMapping(value = "/admin")
public class OrderManagementAdminController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ItemService itemService;
	
	@GetMapping(value = "/order-list")
	public String findAll(HttpServletRequest request) {
		request.setAttribute("orders", orderService.findAll());
		return "admin/order/order_list";
	}
	
	@GetMapping(value = "order-details")
	public String orderDetails(HttpServletRequest request) {
		long orderId = Long.parseLong(request.getParameter("orderId"));
		request.setAttribute("items", itemService.findByOrderId(orderId));
		request.setAttribute("order", orderService.findById(orderId));
		return "admin/order/order_details";
	}
	
}
