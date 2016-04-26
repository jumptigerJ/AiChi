package com.aichi.service;

import java.util.List;

import com.aichi.bean.Customer;

public interface CustomerService {
	public List<Customer> list(Integer pageNum);
}
