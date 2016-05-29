package com.aichi.front.dao;

import java.util.List;

import com.aichi.bean.Cart;
import com.aichi.bean.Customer;
import com.aichi.bean.Order;

public interface FrontBuyerDao {
	//买家登录确认
	public List<Customer> login(Customer customer);
	//买家注册
	public void buyerRegister(Customer customer);
	//买家填写收件人信息并下订单
	public void orderSubmit(Order order);
	//返回买家的所有信息
	public List<Customer> customerInfo(Customer customer);
	//返回买家的所有订单
	public List<Order> myOrder(Integer customerId);
	//添加到购物车
	public void addToCart(Cart cart);
	//显示购物车产品
	public List<Cart> myCart(Integer customerId);
	//删除购物车产品
	public void deleteCartProduct(Integer cartId);
	//验证手机号码
	public List<Customer> checkPhone(String oldPhone);
	//修改手机号码
	public String editPhone(String phone);
}
