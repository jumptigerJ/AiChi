package com.aichi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aichi.bean.Cart;
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
				session.setAttribute("email", c.getEmail());
				session.setAttribute("phone", c.getPhone().toString().substring(0, 3));
				
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
	public ModelAndView product(ModelAndView model,@RequestParam Integer id,@RequestParam String product,@RequestParam String price,@RequestParam String buyNum){
		System.out.println("#######"+id);
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
	//返回买家的所有订单消息
	@ResponseBody
	@RequestMapping("myOrder")
	public List<Order> myOrder(Integer customerId){
		List<Order> list = frontBuyerService.queryMyOrder(customerId);
		return list;
	}
	//加入购物车
	@RequestMapping("addToCart")
	public String addToCart(Cart cart){
		frontBuyerService.addToCart(cart);
		System.out.println("++++--"+cart.getProductName()+cart.getCustomerId()+cart.getNum()+cart.getPrice());
		return "redirect:cart.jsp";
	}
	//显示购物车产品
	@ResponseBody
	@RequestMapping("myCart")
	public List<Cart> myCart(@RequestParam Integer customerId){
		return frontBuyerService.queryMyCart(customerId);
	}
	//购物车产品立即购买跳转到产品购买页
	@RequestMapping("cartReceiverInfo")
	public ModelAndView cartProduct(ModelAndView model,@RequestParam Integer id,@RequestParam String product,@RequestParam String price,@RequestParam String buyNum,@RequestParam Integer cartId){
		System.out.println("#######"+id);
		model.addObject("id",id);
		model.addObject("product",product);
		model.addObject("price",price);
		model.addObject("buyNum",buyNum);
		model.setViewName("redirect:receiver_info.jsp");
		frontBuyerService.deleteCartProduct(cartId);
		return model;   
	}
	//删除购物车产品
	@RequestMapping("deleteCartProduct")
	public void deleteCartProduct(Integer cartId){
		frontBuyerService.deleteCartProduct(cartId);
	}
	//修改手机号码
	@ResponseBody
	@RequestMapping("editPhone")
	public Map<String,String> checkPhone(String oldphone){
		System.out.println("+++"+oldphone);
		boolean flag = false;
		flag = frontBuyerService.checkPhone(oldphone);
		Map<String,String> inf = new HashMap<String,String>();
		System.out.println(flag);
		if(flag==true){
			inf.put("info", "手机号码正确");
			inf.put("status", "y");
		}else{
			inf.put("info", "手机号码不正确");
			inf.put("status", "n");
		}
		return inf;
	}
}
