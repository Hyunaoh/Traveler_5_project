package com.traveler.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveler.dao.PackageDAO;
import com.traveler.model.PackageVO;

@Service
public class PackageService  {
	
	@Autowired
	private PackageDAO packageDAO;
	
	public List<PackageVO> getAllPackage() throws Exception{
		List packageList = packageDAO.getAllPackage();
		
		return packageList;
	}
	
	
	
}
