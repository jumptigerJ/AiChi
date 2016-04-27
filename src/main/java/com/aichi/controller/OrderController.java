package com.aichi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aichi.bean.Order;
import com.aichi.service.OrderService;

@Controller
@ResponseBody
public class OrderController {
	@Autowired
	private OrderService orderService;
	@RequestMapping("orderList")
	public List<Order> list(@RequestParam Integer pageNum){
		return orderService.list(pageNum);
	}
	
	@RequestMapping("orderEdit")
	public String edit(Order order){
		orderService.edit(order);
		return null;
	}
	
	@RequestMapping("orderDelete")
	public String del(@RequestParam Integer orderId){
		orderService.del(orderId);
		return null;
	}
}
