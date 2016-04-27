package com.aichi.service;

import java.util.List;

import com.aichi.bean.Product;

public interface ProductService {
	//显示列表
	public List<Product> list(Integer pageNum);
	//添加产品
	public void add(Product product);
	//编辑产品
	public void edit(Product product);
	//删除产品
	public void del(Integer productId);
}
