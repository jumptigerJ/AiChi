package com.aichi.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aichi.bean.Master;
import com.aichi.dao.LoginDao;

@Repository
public class LoginDaoImpl extends SqlSessionDaoSupport implements LoginDao{
	@Autowired   //注入这个方法需要这个注解
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {

		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public List<Master> login(Master master) {
		List<Master> list = new ArrayList<Master>();
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		list = sqlSession.selectList("login.queryMasterLogin", master);
		
		return list;
	}
	
}
