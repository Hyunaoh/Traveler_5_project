package com.traveler.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.dao.PackageDAO;
import com.traveler.model.PackageVO;

@Controller
@RequestMapping("/package")
public class PackageController {
	
	@Autowired
	SqlSession sqlSession;
	
	//패키지 전체 목록 띄워주기
	@RequestMapping("getAllPackage.go")
	public String getAllpackage(Model model) throws Exception{
		
		System.out.println("전체 목록 띄워주는 컨트롤러 진입");
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		
		List<PackageVO> list = packageDAO.getAllPackage();
		model.addAttribute("listAll", list);
		
		
		return "/package/getListForm";
	}
	
	//패키지 등록하기
	@RequestMapping("insertPackage.go")
	public String insertPackage(Model model) throws Exception{
		
		System.out.println("전체 목록 띄워주는 컨트롤러 진입");
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		
		List<PackageVO> list = packageDAO.getAllPackage();
		model.addAttribute("listAll", list);
		
		
		return "/package/insertPackageForm";
	}
	
}
