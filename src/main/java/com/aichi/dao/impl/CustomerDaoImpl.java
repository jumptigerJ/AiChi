package com.aichi.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aichi.bean.Customer;
import com.aichi.dao.CustomerDao;
@Repository
public class CustomerDaoImpl extends SqlSessionDaoSupport implements CustomerDao {
	@Autowired   //注入这个方法需要这个注解
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public List<Customer> list() {
	
		List<Customer> list = new ArrayList<Customer>();
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		list = sqlSession.selectList("Customer.queryCustomerList");
		return list;
	}

}
