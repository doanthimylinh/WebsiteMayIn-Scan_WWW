package com.se.iuh.controller.client;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.se.iuh.entity.Item;
import com.se.iuh.entity.Product;
import com.se.iuh.service.ProductService;

@Controller
@RequestMapping(value = "/client")
public class CartClientController {

	@Autowired
	private ProductService productService;
	
	@GetMapping(value = "/cart")
	public String cart(HttpServletRequest request, HttpSession session) {
		Object object = session.getAttribute("cart");
		int totalQuantity = 0;
		float subTotal = 0;
		if (object != null) {
			HashMap<Long, Item> mapItem = (HashMap<Long, Item>) object;
			for(Map.Entry<Long, Item> entry : mapItem.entrySet()) {
			    Long key = entry.getKey();
			    Item value = entry.getValue();
			    totalQuantity += value.getQuantity();
			    subTotal += (value.getUnitPrice() * value.getQuantity());
			}
		}
		session.setAttribute("totalQuantity", totalQuantity);
		session.setAttribute("subTotal", subTotal);
		return "client/cart"; 
	}
	

	
	@GetMapping(value = "/add-to-cart")
	public String adCart(HttpServletRequest request, HttpSession session,
			@RequestParam(name = "productId") long productId) {
		
		Product product = productService.findById(productId); // lay thong tin cua san pham khi nguoi dung chon mua
		float unitPrice = product.getPrice();
		
		Object object = session.getAttribute("cart"); // lay danh sach san pham trong gio hang tren session
		
		if (object == null) { // neu gio hang trong => them san pham vao gio hang va tao session moi chua gio hang
			Item items = new Item();
			items.setProduct(product);
			items.setUnitPrice(unitPrice);
			items.setQuantity(1);
			Map<Long, Item> mapItem = new HashMap<Long, Item>();
			mapItem.put(productId, items); // luu san pham vao map(gio hang) voi key = id cua san pham
			session.setAttribute("cart", mapItem); // luu gio hang vao session
		} else {  // neu gio hang da co san pham
			Map<Long, Item> mapItem = (Map<Long, Item>) object;
			if (mapItem.get(productId) == null) { // neu san pham chua co trong gio hang => them san pham vao gio hang
				Item items = new Item();
				items.setProduct(product);
				items.setUnitPrice(unitPrice);
				items.setQuantity(1);
				mapItem.put(productId, items); // luu san pham vao gio hang
			} else { // neu san pham da co trong gio hang => tang so luong san pham do trong gio hang len
				Item items = mapItem.get(productId);
				int quantity = items.getQuantity();
				if (quantity < 5) {
					items.setQuantity(quantity + 1);
				}
			}
			session.setAttribute("cart", mapItem);
		}
		return "redirect:../client/cart";
	}
	
	@PostMapping(value = "/add-to-cart")
	public String adCart(HttpSession session, @RequestParam(name = "productId") long productId,
			@RequestParam(name = "quantity") int quantity) {
		Product product = productService.findById(productId);
		float unitPrice = product.getPrice();
		
		Object object = session.getAttribute("cart");
		if (object == null) {
			Item items = new Item();
			items.setProduct(product);
			items.setQuantity(quantity);
			items.setUnitPrice(unitPrice);
			Map<Long, Item> mapItem = new HashMap<Long, Item>();
			mapItem.put(productId, items);
			session.setAttribute("cart", mapItem);
		} else {
			Map<Long, Item> mapItem = (Map<Long, Item>) object;
			if (mapItem.get(productId) == null) {
				Item items = new Item();
				items.setProduct(product);
				items.setQuantity(quantity);
				items.setUnitPrice(unitPrice);
				mapItem.put(productId, items);
			} else {
				Item items = mapItem.get(productId);
				items.setQuantity(quantity);
			}
			session.setAttribute("cart", mapItem);
		}

		return "redirect:../client/cart";
	}
	
	// Detele product from cart
	
	@GetMapping(value = "/delete-from-cart")
	public String deleteFromCart(HttpServletRequest request, HttpSession session,
			@RequestParam(name = "productId") long productId) {
		
		Object object = session.getAttribute("cart");
		Map<Long, Item> mapItem = (Map<Long, Item>) object;
		mapItem.remove(productId);
		session.setAttribute("cart", mapItem);
		return "redirect:../client/cart";
	}
}
