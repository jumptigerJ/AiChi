package com.aichi.service;

import java.util.List;

import com.aichi.bean.Master;

public interface MasterService {
	//显示列表
	public List<Master> list(Integer pageNum);
	//添加管理员
	public void add(Master master);
	//编辑管理员
	public void eidt(Master master);
	//删除管理员
	public void del(Integer masterId);
}
