package com.aichi.front.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aichi.bean.Cart;
import com.aichi.bean.Customer;
import com.aichi.bean.Order;
import com.aichi.front.dao.FrontBuyerDao;
@Repository
public class FrontBuyerDaoImpl extends SqlSessionDaoSupport implements FrontBuyerDao {
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	//买家登录确认
	public List<Customer> login(Customer customer) {
		List<Customer> list = new ArrayList<Customer>();
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		list = sqlSession.selectList("Buyer.queryBuyerLogin", customer);
		return list;
	}
	//买家注册
	public void buyerRegister(Customer customer) {
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		sqlSession.insert("Buyer.insertBuyer", customer);
	}
	//买家填写收件人信息并下订单
	public void orderSubmit(Order order) {
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		sqlSession.insert("Buyer.insertOrder", order);
	}
	//返回买家所有信息
	public List<Customer> customerInfo(Customer customer) {
		List<Customer> list = new ArrayList<Customer>();
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		list = sqlSession.selectList("Buyer.queryBuyerLogin", customer);
		return list;
	}
	//返回买家的所有订单
	public List<Order> myOrder(Integer customerId) {
		List<Order> list = new ArrayList<Order>();
		SqlSession sqlSession = null;
		sqlSession = getSqlSession();
		System.out.println("++++++++"+customerId);
		list = sqlSession.selectList("Buyer.queryMyOrder", customerId);
		return list;
	}
	//添加到购物车
	public void addToCart(Cart cart) {
		SqlSession sqlSession = null;
		sqlSession = getSqlSession();
		sqlSession.insert("Buyer.addToCart", cart);
		
	}
	//显示购物车产品
	public List<Cart> myCart(Integer customerId) {
		List<Cart> list = new ArrayList<Cart>();
		SqlSession sqlSession = null;
		sqlSession = getSqlSession();
		list = sqlSession.selectList("Buyer.queryMyCart", customerId);
		return list;
	}
	//删除购物车产品
	public void deleteCartProduct(Integer cartId) {
		SqlSession sqlSession = null;
		sqlSession = getSqlSession();
		sqlSession.delete("Buyer.deleteCartProduct", cartId);
		
	}

	public String editPhone(String phone) {
		
		return null;
	}

	public List<Customer> checkPhone(String oldphone) {
		System.out.println("-----"+oldphone);
		List<Customer> list = new ArrayList<Customer>();
		SqlSession sqlSession = null;
		sqlSession = getSqlSession();
		list = sqlSession.selectList("Buyer.checkphone", oldphone);
		System.out.println("-----"+list.size());
		return list;
	}
	
}
