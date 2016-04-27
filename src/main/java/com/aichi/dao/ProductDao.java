package com.aichi.dao;

import java.util.List;

import com.aichi.bean.Product;

public interface ProductDao {
	//显示产品列表
	public List<Product> list();
	//添加产品
	public void add(Product product);
	//编辑产品
	public void edit(Product product);
	//删除产品
	public void del(Integer productId);
}
