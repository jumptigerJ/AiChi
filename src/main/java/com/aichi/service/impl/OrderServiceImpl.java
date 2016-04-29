package com.aichi.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aichi.bean.Order;
import com.aichi.dao.OrderDao;
import com.aichi.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao orderDao;
	public List<Order> list(Integer pageNum) {
		List<Order> list = new ArrayList<Order>();
		List<Order> sublist = new ArrayList<Order>();
		list = orderDao.list();
		int pageNumCount = list.size();
		int begin = (pageNum-1)*6;
		int end = pageNum*6;
		if(end > pageNumCount){
			end = pageNumCount;
		}
		sublist = list.subList(begin, end);
		for(Order li:sublist){
			li.setPageTotalNum(pageNumCount);
		}
		return sublist;
	}
	//编辑订单
	public void edit(Order order) {
		orderDao.edit(order);
	}
	
	//删除订单
	public void del(Integer orderId) {
		orderDao.del(orderId);
		
	}

}
