package com.se.iuh.controller.admin;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.se.iuh.entity.Category;
import com.se.iuh.entity.Product;

import com.se.iuh.service.CategoryService;
import com.se.iuh.service.ProductService;


@Controller
@RequestMapping(value = "/admin")
public class ProductManagementAdminController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@GetMapping(value = "/product-list")
	public String findAll(HttpServletRequest request) {


		
		request.setAttribute("products", productService.findAll());
		return "admin/product/listProduct";
	}


	@GetMapping(value = "/product-list-by-category")
	public String findAllByCategory(HttpServletRequest request, @RequestParam(name = "categoryId") long categoryId) {
		
		request.setAttribute("products", productService.findAllByCategoryId(categoryId));
		return "admin/product/listProductByCategory";
	}


	@GetMapping(value = "/product-create")
	public String insert(HttpServletRequest request) {
		request.setAttribute("categories", categoryService.findAll());
		return "admin/product/createNewProduct";
	}

	@PostMapping(value = "/product-create")
	public String insertPost(HttpServletRequest request, @RequestParam(name = "categoryId") long categoryId,
			@RequestParam(name = "productName") String productName,
			@RequestParam(name = "description") String description, @RequestParam(name = "price") float price,
			@RequestParam(name = "quantity") int quantity, @RequestParam(name = "status") String status,
			@RequestParam(name = "imageFile") MultipartFile imageFile) {
		Category category = new Category();
		category.setCategoryId(categoryId);
		Product product = new Product();
		product.setCategory(category);

		if (status.equals("1")) {
			product.setStatus("Đang hoạt động");
		} else {
			product.setStatus("Ngừng hoạt động");
		}

		product.setProductName(productName);
		product.setDescription(description);
		product.setPrice(price);
		product.setQuantity(quantity);
		if (imageFile != null && imageFile.getSize() > 0) {
//			lấy tên gốc file ảnh
			String originalFilename = imageFile.getOriginalFilename();
//			lấy loại tệp ảnh được lưu
			int lastIndex = originalFilename.lastIndexOf(".");
			String ext = originalFilename.substring(lastIndex);
			String avatarFilename = System.currentTimeMillis() + ext;
			File newfile = new File("E:\\BTL_WWW_N9\\18_N9_WWW\\image_spring_boot\\" + avatarFilename);
//			Mở tệp để lưu, ghi file
			FileOutputStream fileOutputStream;
			try {
				fileOutputStream = new FileOutputStream(newfile);
				fileOutputStream.write(imageFile.getBytes());
				fileOutputStream.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			product.setImage(avatarFilename);
		}

		productService.insert(product);
		return "redirect:../admin/product-list";
	}



	@GetMapping(value = "/product-update")
	public String update(HttpServletRequest request, @RequestParam(name = "productId") long productId) {
		request.setAttribute("product", productService.findById(productId));
		request.setAttribute("categories", categoryService.findAll());
		return "admin/product/updateProduct";
	}

	@PostMapping(value = "/product-update")
	public String update(HttpServletRequest request, @RequestParam(name = "newPrice", required = false) String newPrice,
			@RequestParam(name = "imageFile", required = false) MultipartFile imageFile) {
		long productId = Long.parseLong(request.getParameter("productId"));
		long categoryId = Long.parseLong(request.getParameter("categoryId"));
		float oldprice = Float.parseFloat(request.getParameter("oldPrice"));
		String productName = request.getParameter("productName");
		String description = request.getParameter("description");
		String status = request.getParameter("status");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String image = request.getParameter("image");

		Category category = new Category();
		category.setCategoryId(categoryId);
		Product product = new Product();
		product.setProductId(productId);
		if (status.equals("1")) {
			product.setStatus("Đang hoạt động");
		} else {
			product.setStatus("Ngừng hoạt động");
		}
		product.setCategory(category);
		product.setProductName(productName);
		product.setDescription(description);
		product.setQuantity(quantity);
		if (newPrice == null || newPrice.equals("")) {
			product.setPrice(oldprice);
		} else {
			product.setPrice(Float.parseFloat(newPrice));
		}
		if (imageFile != null && imageFile.getSize() > 0) {
			String originalFilename = imageFile.getOriginalFilename();
			int lastIndex = originalFilename.lastIndexOf(".");
			String ext = originalFilename.substring(lastIndex);
			String avatarFilename = System.currentTimeMillis() + ext;
			File newfile = new File("E:\\BTL_WWW_N9\\18_N9_WWW\\image_spring_boot\\" + avatarFilename);
			FileOutputStream fileOutputStream;
			try {
				fileOutputStream = new FileOutputStream(newfile);
				fileOutputStream.write(imageFile.getBytes());
				fileOutputStream.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			product.setImage(avatarFilename);
		} else {
			product.setImage(image);
		}
		productService.update(product);
		return "redirect:/admin/product-list";
	}

}
