package com.aichi.front.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aichi.bean.Customer;
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
		list = sqlSession.selectList(".queryBuyerLogin", customer);
		return list;
	}
	//买家注册
	public void buyerRegister(Customer customer) {
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		sqlSession.insert("Buyer.insertBuyer", customer);
	}
	
}
