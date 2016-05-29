package com.aichi.front.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aichi.bean.Cart;
import com.aichi.bean.Customer;
import com.aichi.bean.Order;
import com.aichi.front.dao.FrontBuyerDao;
import com.aichi.front.service.FrontBuyerService;
@Service
public class FrontBuyerServiceImpl implements FrontBuyerService {
	@Autowired
	private FrontBuyerDao frontBuyerDao;
	//买家登录确认
	public boolean login(Customer customer) {
		List<Customer> list = new ArrayList<Customer>();
		list = frontBuyerDao.login(customer);
		if(list.size()!=0){
			return true;
		}
		return false;
	}
	//买家注册
	public void buyerRegister(Customer customer) {
		frontBuyerDao.buyerRegister(customer);
		
	}
	//买家填写收件人信息并下订单
	public void orderSubmit(Order order) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		order.setOrderTime(df.format(new Date()));
		frontBuyerDao.orderSubmit(order);
		
	}
	//返回买家的所有信息
	public List<Customer> customerInfo(Customer customer) {
		List<Customer> list = frontBuyerDao.customerInfo(customer);
		return list;
	}
	//返回买家的所有订单消息
	public List<Order> queryMyOrder(Integer customerId) {
		List<Order> list = frontBuyerDao.myOrder(customerId);
		return list;
	}
	//添加到购物车
	public void addToCart(Cart cart) {
		frontBuyerDao.addToCart(cart);
	}
	//显示购物车列表
	public List<Cart> queryMyCart(Integer customerId) {
		return frontBuyerDao.myCart(customerId);
	}
	//删除购物车的产品
	public void deleteCartProduct(Integer cartId) {
		frontBuyerDao.deleteCartProduct(cartId);
	}
	//审核修改手机原先号码
	public boolean checkPhone(String oldPhone) {
		List<Customer> list = new ArrayList<Customer>();
		list = frontBuyerDao.checkPhone(oldPhone);
		if(list.size()!=0){
			return true;
		}
		return false;
	}
	
}
