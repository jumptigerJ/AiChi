package com.aichi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aichi.bean.Master;
import com.aichi.service.MasterService;

@Controller
@ResponseBody
public class MasterController {
	@Autowired
	private MasterService masterService;
	//显示列表
	@RequestMapping("masterList")
	public List<Master> list(Integer pageNum){
		System.out.println(pageNum+"-----------");
		return masterService.list(pageNum);	
	}
	//添加管理员
	@RequestMapping("addMaster")
	public String add(Master master){
		masterService.add(master);
		return null;
	}
	//编辑管理员
	@RequestMapping("masterEdit")
	public String edit(Master master){
		masterService.eidt(master);
		return null;
	}
	//删除管理员
	@RequestMapping("masterDelete")
	public String del(@RequestParam Integer masterId){
		masterService.del(masterId);
		return null;
	}
}
