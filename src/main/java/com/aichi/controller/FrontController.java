package com.aichi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aichi.bean.Customer;
import com.aichi.bean.Order;
import com.aichi.bean.Product;
import com.aichi.front.service.FrontBuyerService;
import com.aichi.front.service.FrontProductService;

@Controller
public class FrontController {
	@Autowired
	private FrontProductService frontProductService;
	@Autowired
	private FrontBuyerService frontBuyerService;
	//前台显示产品列表
	@ResponseBody
	@RequestMapping("frontList")
	public List<Product> list(Integer pageNum){
		return frontProductService.list(pageNum);
	}
	//买家登录
	@RequestMapping("buyerLogin")
	public String buyerLogin(Customer customer){
		Boolean flag = false;
		flag = frontBuyerService.login(customer);
		
		if(flag == true){
			return "redirect:test.jsp";
		}
		return "redirect:buyerLogin.jsp";
	}
	//买家注册
	@ResponseBody
	@RequestMapping("buyerRegister")
	public String buyerRegister(Customer customer){
	//	System.out.println(customer.getCustomerName()+"--"+customer.getBirthDate()+"---"+customer.getEmail()+"---"+customer.getPassword()+"---"+customer.getSex()+"---"+customer.getPhone());
		frontBuyerService.buyerRegister(customer);
		return "1111";
	}
	//点击进入产品页面,根据产品ID查找该产品
	@ResponseBody
	@RequestMapping("loadProduct")
	public List<Product> loadProduct(@RequestParam Integer productId){
		//System.out.println(productId);

		return frontProductService.loadProduct(productId);
	}
	//填写收件人信息提交订单
	@ResponseBody
	@RequestMapping("orderSubmit")
	public String orderSubmit(){
		System.out.println("111111111111111111111111");
	//	System.out.println("订单信息"+order.getProductId()+"---"+order.getNum()+"---"+order.getReceiver()+"---"+order.getReceiverAddress()+"---"+order.getReceiverPhone());
		return "1111";
	}
	
}
