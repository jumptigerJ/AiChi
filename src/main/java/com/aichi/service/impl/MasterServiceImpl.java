package com.aichi.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aichi.bean.Master;
import com.aichi.bean.Order;
import com.aichi.dao.MasterDao;
import com.aichi.service.MasterService;
@Service
public class MasterServiceImpl implements MasterService {
	@Autowired
	private MasterDao masterDao;
	//显示列表
	public List<Master> list(Integer pageNum) {
		List<Master> list = new ArrayList<Master>();
		List<Master> sublist = new ArrayList<Master>();
		list = masterDao.list();
		int pageNumCount = list.size();
		int begin = (pageNum-1)*6;
		int end = pageNum*6;
		if(end > pageNumCount){
			end = pageNumCount;
		}
		sublist = list.subList(begin, end);
		for(Master li:sublist){
			li.setPageTotalNum(pageNumCount);
		}
		return sublist;
	}
	//添加管理员
	public void add(Master master) {
		masterDao.add(master);	
	}
	//编辑管理员
	public void eidt(Master master) {
		masterDao.eidt(master); 
		
	}
	//删除管理员
	public void del(Integer masterId) {
		masterDao.del(masterId);
	}

}
