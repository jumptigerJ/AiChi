package com.aichi.front.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aichi.bean.Customer;
import com.aichi.front.dao.FrontBuyerDao;
import com.aichi.front.service.FrontBuyerService;
@Service
public class FrontBuyerServiceImpl implements FrontBuyerService {
	@Autowired
	private FrontBuyerDao frontBuyerDao;
	public boolean login(Customer customer) {
		List<Customer> list = new ArrayList<Customer>();
		list = frontBuyerDao.login(customer);
		if(list.size()!=0){
			return true;
		}
		return false;
	}

}
