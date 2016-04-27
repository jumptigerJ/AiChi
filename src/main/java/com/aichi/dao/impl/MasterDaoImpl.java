package com.aichi.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aichi.bean.Master;
import com.aichi.dao.MasterDao;
@Repository
public class MasterDaoImpl extends SqlSessionDaoSupport implements MasterDao {
	@Autowired   //注入这个方法需要这个注解
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	//显示列表
	public List<Master> list() {
		List<Master> list = new ArrayList<Master>();
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		list = sqlSession.selectList("Master.queryMasterList");
		return list;
	}
	//添加管理员
	public void add(Master master) {
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		sqlSession.insert("Master.insertMaster", master);
		
	}
	//编辑管理员
	public void eidt(Master master) {
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		sqlSession.update("Master.upadateMaster", master);
	}
	//删除管理员
	public void del(Integer masterId) {
		SqlSession sqlSession=null;
		sqlSession = getSqlSession();
		sqlSession.delete("Master.deleteMaster", masterId);
	}
		
}
