package com.aichi.front.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aichi.bean.Product;
import com.aichi.front.dao.FrontProductDao;
@Repository
public class FrontProductDaoImpl extends SqlSessionDaoSupport implements FrontProductDao {
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	//显示产品列表
	public List<Product> list() {
		List<Product> list = new ArrayList<Product>();
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		list = sqlSession.selectList("FrontProduct.queryProductList");

		return list;
	}
	//添加产品
	public void add(Product product) {
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		sqlSession.insert("FrontProduct.insertProduct", product);
		
	}
	//编辑产品
	public void edit(Product product) {
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		sqlSession.update("FrontProduct.updateProduct", product);
		
	}
	//删除产品
	public void del(Integer productId) {
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		sqlSession.delete("FrontProduct.deleteProduct", productId);
	}
	//根据产品ID进入该产品购买页面,返回该产品数据
	public List<Product> loadProduct(Integer productId) {
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		return sqlSession.selectList("FrontProduct.queryProductListById", productId);
	}

}
