package com.aichi.front.dao;

import java.util.List;

import com.aichi.bean.Customer;
import com.aichi.bean.Order;

public interface FrontBuyerDao {
	//买家登录确认
	public List<Customer> login(Customer customer);
	//买家注册
	public void buyerRegister(Customer customer);
	//买家填写收件人信息并下订单
	public void orderSubmit(Order order);
	//返回买家的所有信息
	public List<Customer> customerInfo(Customer customer);
}
