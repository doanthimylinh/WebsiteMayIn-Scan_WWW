package com.se.iuh.controller.client;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.iuh.entity.Item;
import com.se.iuh.entity.UserPrincipal;
import com.se.iuh.service.ItemService;
import com.se.iuh.service.OrderService;

@Controller
@RequestMapping(value = "/client")
public class MyOrderClientController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ItemService itemService;
	
	@GetMapping(value = "/my-order")
	public String myOrder(HttpServletRequest request) {
		UserPrincipal userPrincipal = (UserPrincipal) request.getSession().getAttribute("user");
		long userId = (long) userPrincipal.getUserId();
		request.setAttribute("orders", orderService.findByBuyer(userId));
		return "client/my_order";
	}
	
	@GetMapping(value = "order-details")
	public String orderDetails(HttpServletRequest request, @RequestParam(name = "orderId") long orderId) {
		List<Item> items = itemService.findByOrderId(orderId);
		float subTotal = 0;
		for (Item item : items) {
			subTotal += (item.getUnitPrice() * item.getQuantity());
		}
		request.setAttribute("subTotal", subTotal);
		request.setAttribute("items", items);
		return "client/order_details";  
	}
}
