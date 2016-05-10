package com.aichi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public String buyerLogin(Customer customer,HttpSession session){
		Boolean flag = false;
		flag = frontBuyerService.login(customer);
		
		if(flag == true){
			List<Customer> list = frontBuyerService.customerInfo(customer);
			for(Customer c:list){
				session.setAttribute("customerId", c.getCustomerId());
				session.setAttribute("customerName", c.getCustomerName());
				
			}
			session.setAttribute("customer", customer);
			
			return "redirect:index.jsp";
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
	//跳转到产品购买页
	@RequestMapping("receiver_info")
	public ModelAndView product(ModelAndView model,@RequestParam Integer id,@RequestParam String product,@RequestParam String price,HttpServletRequest requset,@RequestParam String buyNum){
		System.out.println("#######"+id);
		requset.setAttribute("id", id);
		model.addObject("id",id);
		model.addObject("product",product);
		model.addObject("price",price);
		model.addObject("buyNum",buyNum);
		model.setViewName("redirect:receiver_info.jsp");
		return model;   
	}
	//点击进入产品页面,根据产品ID查找该产品
	@ResponseBody
	@RequestMapping("loadProduct")
	public List<Product> loadProduct(@RequestParam Integer productId){
		//System.out.println(productId);

		return frontProductService.loadProduct(productId);
	}
	//填写收件人信息提交订单
	@RequestMapping("orderSubmit")
	public String orderSubmit(Order order){
		frontBuyerService.orderSubmit(order);
		return "redirect:successOrder.jsp";

	}
	
}
