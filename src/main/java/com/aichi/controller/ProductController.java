package com.aichi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aichi.bean.Product;
import com.aichi.service.ProductService;

@Controller
@ResponseBody
public class ProductController {
	@Autowired
	private ProductService productService;
	//显示产品列表
	@RequestMapping("productList")
	public List<Product> list(Integer pageNum){
		return productService.list(pageNum);
	}
	//添加产品
	@RequestMapping("productAdd")
	public String add(Product product){	
		productService.add(product);
		return null;
	}
	//编辑产品
	@RequestMapping("productEdit")
	public String edit(Product product){
		productService.edit(product);
		return null;
	}
	//删除产品
	@RequestMapping("productDelete")
	public String del(@RequestParam Integer productId){
		productService.del(productId);
		return null;
	}
	
}
