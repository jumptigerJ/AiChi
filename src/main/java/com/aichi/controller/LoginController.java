package com.aichi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aichi.bean.Master;
import com.aichi.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	@RequestMapping("login")
	public String login(Master master){
		boolean flag = false;
		flag = loginService.login(master);
		if(flag == true){
			return "back/index";
		}
		return "redirect:login.jsp";
	}
}
