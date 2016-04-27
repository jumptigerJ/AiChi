package com.aichi.dao;

import java.util.List;

import com.aichi.bean.Master;

public interface MasterDao {
	//显示列表
	public List<Master> list();
	//添加管理员
	public void add(Master master);
	//编辑管理员
	public void eidt(Master master);
	//删除管理员
	public void del(Integer masterId);
}
