package com.aichi.dao;

import java.util.List;

import com.aichi.bean.Order;

public interface OrderDao {
	//显示订单列表
	public List<Order> list();
	//编辑订单
	public void edit(Order order);
	//删除订单
	public void del(Integer orderId);
		
}
