package com.aichi.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aichi.bean.Product;
import com.aichi.dao.ProductDao;
import com.aichi.service.ProductService;
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao productDao;
	//显示列表
	public List<Product> list(Integer pageNum) {
		List<Product> list = new ArrayList<Product>();
		List<Product> sublist = new ArrayList<Product>();
		list = productDao.list();
		int pageNumCount = list.size();
		int begin = (pageNum-1)*6;
		int end = pageNum*6;
		if(end > pageNumCount){
			end = pageNumCount;
		}
		sublist = list.subList(begin, end);
		for(Product li:sublist){
			li.setPageTotalNum(pageNumCount);
		}
		return sublist;
	}
	//添加产品
	public void add(Product product) {
		productDao.add(product);
	}
	//编辑产品
	public void edit(Product product) {
		productDao.edit(product);
		
	}
	//删除产品
	public void del(Integer productId) {
		productDao.del(productId);
		
	}

}
