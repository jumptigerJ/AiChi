package com.aichi.service;

import java.util.List;

import com.aichi.bean.Order;

public interface OrderService {
	//显示订单列表
	public List<Order> list(Integer pageNum);
	//编辑订单
	public void edit(Order order);
	//删除订单
	public void del(Integer orderId);
}
