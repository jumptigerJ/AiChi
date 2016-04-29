package com.aichi.front.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aichi.bean.Product;
import com.aichi.front.dao.FrontProductDao;
import com.aichi.front.service.FrontProductService;
@Service
public class FrontProductServiceImpl implements FrontProductService {
	@Autowired
	private FrontProductDao frontProductDao;
	//显示列表
	public List<Product> list(Integer pageNum) {
		
//		List<Product> list = new ArrayList<Product>();
//		List<Product> sublist = new ArrayList<Product>();
//		list = frontProductDao.list();
//		int pageNumCount = list.size();
//		int begin = (pageNum-1)*6;
//		int end = pageNum*6;
//		if(end > pageNumCount){
//			end = pageNumCount;
//		}
//		sublist = list.subList(begin, end);
//		for(Product li:sublist){
//			li.setPageTotalNum(pageNumCount);
//		}
		return frontProductDao.list();
	}
	//添加产品
	public void add(Product product) {
		frontProductDao.add(product);
	}
	//编辑产品
	public void edit(Product product) {
		frontProductDao.edit(product);
		
	}
	//删除产品
	public void del(Integer productId) {
		frontProductDao.del(productId);
		
	}

}
