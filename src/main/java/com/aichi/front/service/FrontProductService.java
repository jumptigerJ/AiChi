package com.aichi.front.service;

import java.util.List;

import com.aichi.bean.Product;

public interface FrontProductService {
	//显示列表
	public List<Product> list(Integer pageNum);
	//添加产品
	public void add(Product product);
	//编辑产品
	public void edit(Product product);
	//删除产品
	public void del(Integer productId);
	//根据产品ID进入该产品购买页面,返回该产品数据
	public List<Product> loadProduct(Integer productId);
}
