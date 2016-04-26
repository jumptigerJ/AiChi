package com.aichi.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aichi.bean.Customer;
import com.aichi.dao.CustomerDao;
import com.aichi.service.CustomerService;
@Service
public class CustomerServiceImpl implements CustomerService{
@Autowired
private CustomerDao customerDao;
	public List<Customer> list(Integer pageNum) {
		List<Customer> list = new ArrayList<Customer>();
		List<Customer> sublist = new ArrayList<Customer>();
		list= customerDao.list();
		int pageNumCount = list.size();
		int begin = (pageNum-1)*6;
		int end = pageNum*6;
		if(end > pageNumCount){
			end = pageNumCount;
		}
		sublist = list.subList(begin, end);
		for(Customer li:sublist){
			li.setPageTotalNum(pageNumCount);
		}
		return sublist;
	}

}
