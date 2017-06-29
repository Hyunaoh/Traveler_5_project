package com.traveler.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
		
		//전체 패키지 목록
		List<PackageVO> list = packageDAO.getAllPackage();
		
		//패키지 전체 갯수
		int countPackage = packageDAO.countTotalPackage();
		
		model.addAttribute("listAll", list);
		model.addAttribute("count", countPackage);
		
		
		return "/package/getListForm";
	}
	
	//패키지 등록하기 폼
	@RequestMapping("insertPackageForm.go")
	public String insertPackageForm() throws Exception{
		System.out.println("insertPackageForm 컨트롤러 진입");
		
		return "/package/insertPackageForm";
	}
	
	//패키지 등록하기
	@RequestMapping("insertPackagePro.go")
	public String insertPackage(PackageVO packageVO, MultipartHttpServletRequest request) throws Exception{
		
		System.out.println("package 인서트 컨트롤러 진입");
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		
		//이미지 업로드
		 MultipartFile f = request.getFile("package_image");
	        String filename = f.getOriginalFilename();
	        
	        try {
	            byte[] b = f.getBytes();
	            File file = new File("c:\\git\\traveler\\traveler_project\\src\\main\\webapp\\resources\\"
	            		+ "upload\\"+packageVO.getPackage_pk());
	            //System.out.println(file.lastModified());
	            //System.out.println(new java.sql.Date(file.lastModified()));
	            //System.out.println(new java.util.Date(file.lastModified()));
	            //파일에 바이트 배열을 기록할 수 있는 스트림 생성
	            
	            //db packate_image 컬럼에 저장 할 경로
	            String dbImageName = packageVO.getPackage_pk();
	            
	            packageVO.setPackage_image(dbImageName);
	            FileOutputStream fos = new FileOutputStream(file);
	            fos.write(b);
	            fos.close();
	        } catch (IOException e){
	            System.out.println(e.getMessage());
	        }

	        packageDAO.insertPackage(packageVO);		
		
		return "redirect:getAllPackage.go";
	}
	
	@RequestMapping("packageCountryListForm.go")
	public String packageCountryListForm (Model model, PackageVO packageVO) throws Exception{
		
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		
		//전체 패키지 목록
		List<PackageVO> searchList = packageDAO.searchPackage(packageVO);
		
		//패키지 전체 갯수
		int countPackage = packageDAO.countTotalPackage();
		
		model.addAttribute("searchList", searchList);
		model.addAttribute("count", countPackage);
		
		return "/package/getListForm";
	}
	
}
