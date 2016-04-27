package com.aichi.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aichi.bean.Order;
import com.aichi.dao.OrderDao;
@Repository
public class OrderDaoImpl extends SqlSessionDaoSupport implements OrderDao {
	@Autowired   //注入这个方法需要这个注解
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {

		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public List<Order> list() {
		List<Order> list = new ArrayList<Order>();
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		list = sqlSession.selectList("Order.queryOrderList");

		return list;
	}
	
	//编辑订单
	public void edit(Order order) {
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		sqlSession.update("Order.updataOrder", order);
	}
	
	//删除订单
	public void del(Integer orderId) {
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		sqlSession.delete("Order.deleteOrder", orderId);
		
	}	

}
