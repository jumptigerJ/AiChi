package com.aichi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aichi.bean.Customer;
import com.aichi.service.CustomerService;

@Controller
@ResponseBody
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	@RequestMapping("customerQuery")
	public List<Customer> list(@RequestParam Integer pageNum){
		return customerService.list(pageNum);
	}
}
