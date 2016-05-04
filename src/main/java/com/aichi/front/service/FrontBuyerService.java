package com.aichi.front.service;

import com.aichi.bean.Customer;

public interface FrontBuyerService {
	//买家登录
	public boolean login(Customer customer);
	//买家注册
	public void buyerRegister(Customer customer);

}
