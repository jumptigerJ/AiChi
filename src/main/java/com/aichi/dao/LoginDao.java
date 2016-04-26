package com.aichi.dao;

import java.util.List;

import com.aichi.bean.Master;


public interface LoginDao {
	public List<Master> login(Master master);
}
