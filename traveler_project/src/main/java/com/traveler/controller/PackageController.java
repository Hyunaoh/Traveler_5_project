package com.traveler.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.service.PackageService;

@Controller
@RequestMapping("/package")
public class PackageController {
	
	@Autowired
	PackageService packageService;
	
	/*
	@Autowired
	private SqlSession sqlSession; */
	
	//패키지 전체 목록 띄워주기
	@RequestMapping("getAllPackage.go")
	public String getAllpackage(Model model) throws Exception{
		System.out.println("전체 목록 띄워주는 컨트롤러 진입");
				
		model.addAttribute("listAll", packageService.getAllPackage());
		return "/package/getListForm";
	}
}
