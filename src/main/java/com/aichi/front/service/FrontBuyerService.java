package com.aichi.front.service;

import java.util.List;

import com.aichi.bean.Customer;
import com.aichi.bean.Order;

public interface FrontBuyerService {
	//买家登录
	public boolean login(Customer customer);
	//买家注册
	public void buyerRegister(Customer customer);
	//买家填写收件人信息并下订单
	public void orderSubmit(Order order);
	//返回买家所有信息
	public List<Customer> customerInfo(Customer customer);
}
