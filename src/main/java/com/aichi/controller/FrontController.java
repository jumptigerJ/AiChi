package com.aichi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aichi.bean.Customer;
import com.aichi.bean.Product;
import com.aichi.front.service.FrontBuyerService;
import com.aichi.front.service.FrontProductService;

@Controller
public class FrontController {
	@Autowired
	private FrontProductService frontProductService;
	@Autowired
	private FrontBuyerService frontBuyerService;
	@ResponseBody
	@RequestMapping("frontList")
	public List<Product> list(Integer pageNum){
		return frontProductService.list(pageNum);
	}
	@RequestMapping("buyerLogin")
	public String buyerLogin(Customer customer){
		Boolean flag = false;
		flag = frontBuyerService.login(customer);
		
		if(flag == true){
			return "redirect:test.jsp";
		}
		return "redirect:buyerLogin.jsp";
	}
}
