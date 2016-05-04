package com.aichi.front.dao;

import java.util.List;

import com.aichi.bean.Customer;

public interface FrontBuyerDao {
	//买家登录确认
	public List<Customer> login(Customer customer);
	//买家注册
	public void buyerRegister(Customer customer);
}
