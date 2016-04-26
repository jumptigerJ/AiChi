package com.aichi.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aichi.bean.Master;
import com.aichi.dao.LoginDao;
import com.aichi.service.LoginService;
@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginDao loginDao;
	public boolean login(Master master) {
		List<Master> list = new ArrayList<Master>();
		list = loginDao.login(master);
		if(list.size()!=0){
			return true;
		}
		return false;
	}
}
