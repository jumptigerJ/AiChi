package com.aichi.front.dao;

import java.util.List;

import com.aichi.bean.Product;

public interface FrontProductDao {
	//显示产品列表
	public List<Product> list();
	//添加产品
	public void add(Product product);
	//编辑产品
	public void edit(Product product);
	//删除产品
	public void del(Integer productId);
	//根据产品ID进入该产品购买页面,返回该产品数据
	public List<Product> loadProduct(Integer productId);
}
