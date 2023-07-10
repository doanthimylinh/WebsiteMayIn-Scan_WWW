package com.se.iuh.controller.client;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.se.iuh.dao.ItemDao;
import com.se.iuh.dao.OrderDao;
import com.se.iuh.entity.Item;
import com.se.iuh.entity.Order;
import com.se.iuh.entity.Product;
import com.se.iuh.entity.User;
import com.se.iuh.entity.UserPrincipal;

@Controller
@RequestMapping(value = "/client")
public class CheckoutController {

	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private ItemDao itemDao;
	
	@PostMapping(value = "/checkout")
	public String checkout(HttpSession session) {
		
		float subTotal = 0; // tong tien hang
		
		UserPrincipal userPrincipal = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// lay thong tin nguoi mua hang
		User user = new User();
		user.setUserId(userPrincipal.getUserId());
		
        Date date = new Date(new java.util.Date().getTime()); // lay ngay hien tai
        
		Object object = session.getAttribute("cart"); // lay danh sach gio hang tu session
		Map<Long, Item> mapItem = (Map<Long, Item>) object;
		
		for(Map.Entry<Long, Item> entry : mapItem.entrySet()) {
		    Long key = entry.getKey();
		    Item value = entry.getValue();
		    
		    subTotal += (value.getUnitPrice() * value.getQuantity()); // tinh tong tien hang
		}
		
		Order order = new Order();
		order.setBuyDate(date);
		order.setUser(user);
		order.setPriceTotal(subTotal);
		
		orderDao.insert(order);
		
		// insert danh sach san pham trong don hang vao bang item
		for(Map.Entry<Long, Item> entry : mapItem.entrySet()) {
		    Long key = entry.getKey();
		    Item value = entry.getValue();
		    
		    Product product = new Product();
		    product.setProductId(entry.getValue().getProduct().getProductId());
		    
		    Item item = new Item();
		    item.setItemId(entry.getValue().getItemId());
		    item.setProduct(product);
		    item.setQuantity(entry.getValue().getQuantity());
		    item.setUnitPrice(entry.getValue().getUnitPrice());
		    item.setOrder(order);
		    
		    // insert vao bang item
			itemDao.insert(item);
		}
	
		mapItem.clear();
		session.setAttribute("cart", mapItem);
		
		return "redirect:/client/my-order";
	}
}
