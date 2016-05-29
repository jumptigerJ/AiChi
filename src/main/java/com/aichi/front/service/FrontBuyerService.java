package com.aichi.front.service;

import java.util.List;

import com.aichi.bean.Cart;
import com.aichi.bean.Customer;
import com.aichi.bean.Order;

public interface FrontBuyerService {
	//买家登录
	public boolean login(Customer customer);
	//买家注册
	public void buyerRegister(Customer customer);
	//买家填写收件人信息并下订单
	public void orderSubmit(Order order);
	//返回买家所有信息
	public List<Customer> customerInfo(Customer customer);
	//返回买家的所有订单
	public List<Order> queryMyOrder(Integer customerId);
	//添加到购物车
	public void addToCart(Cart cart);
	//显示购物车列表
	public List<Cart> queryMyCart(Integer customerId);
	//删除购物车的产品
	public void deleteCartProduct(Integer cartId);
	//审核修改自己原先的手机号码
	public boolean checkPhone(String oldPhone);
}
