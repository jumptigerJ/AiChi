package com.aichi.front.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
}
