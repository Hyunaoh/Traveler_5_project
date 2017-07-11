package com.traveler.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
		
		model.addAttribute("list", list);
		model.addAttribute("count", countPackage);
		
		
		return "/package/getListForm";
	}
	
	//패키지 등록하기 폼
	@RequestMapping("insertPackageForm.go")
	public String insertPackageForm(Principal principal, Model model) throws Exception{
		System.out.println("insertPackageForm 컨트롤러 진입");
		String member_id= principal.getName();
		
		model.addAttribute("member_id", member_id);
		return "/package/insertPackageForm";
	}
	
	@RequestMapping("insertPackagePro.go")
	public String insertPackage(HttpServletRequest request,PackageVO packageVO, @RequestParam("imgFile") MultipartFile imgFile, Model model) throws Exception{
		System.out.println("package 인서트 컨트롤러 진입");
		
		//이미지 rename시 붙일 업로드 날짜 정보
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
        String now = (new SimpleDateFormat("yyMMdd-HH-mm-ss").format(date));

		
		// 서버에 이미지 저장
	    String savePath = request.getRealPath("/resources/images/package_img"); // 파일이 저장될 프로젝트 안의 폴더 경로
	   System.out.println("savePath"+savePath);
	    String originalFilename = imgFile.getOriginalFilename(); // fileName.jpg
	    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
	    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
	    
	    String rename = onlyFileName +"_"+now+extension; // fileName_20150721-14-07-50.jpg
	    String fullPath = savePath + "/" + rename;
	    if (!imgFile.isEmpty()) {
	        try {
	            byte[] bytes = imgFile.getBytes();
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
	            stream.write(bytes);
	            stream.close();
	        } catch (Exception e) {
	        }
	    }
	    
	    // 이미지 복사
	   /* String saveLocalPath = "C:/git/traveler/traveler_project/src/main/webapp/resources/images/package_img";
	    imgCopy(fullPath, saveLocalPath, rename);*/
	    
	    // 이미지 이름 셋팅
	    packageVO.setPackage_image(rename);
		
		boolean check = false;
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		if(packageDAO.insertPackage(packageVO) > 0){
			check=true;
		}
		
		return "redirect:getAllPackage.go";
	}
	
	@RequestMapping("packageCountryListForm.go")
	public String packageCountryListForm (Model model, PackageVO packageVO) throws Exception{
		
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		
		//전체 패키지 목록
		List<PackageVO> searchList = packageDAO.searchPackage(packageVO);
		
		PackageVO what = searchList.get(0);
		System.out.println("투스트링"+what.toString());
		
		//패키지 전체 갯수
		int countPackage = packageDAO.countTotalPackage();
		
		model.addAttribute("list", searchList);
		model.addAttribute("count", countPackage);
		
		return "/package/getListForm";
	}
	
	//패키지 상세보기
	@RequestMapping("packageDetailForm.go")
	public String packageDetailForm (Model model, PackageVO packageVO, HttpSession session) throws Exception{
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		
		PackageVO detailPackage = packageDAO.selectPackage(packageVO);
		System.out.println("투스트링"+detailPackage.toString());
		
		//조회수 증가
		boolean check = false;
		PackageVO packageVO_hit = new PackageVO();
		packageVO_hit.setPackage_pk(packageVO.getPackage_pk());
		
		try{
			if((int)session.getAttribute("view_check") == packageVO.getPackage_pk()){
				// 새로고침 했을때는 그대로 값유지
				packageVO_hit.setPackage_hit(detailPackage.getPackage_hit());
			} else{
			packageVO_hit.setPackage_hit(detailPackage.getPackage_hit()+1);
			}
		} catch (Exception e) {
			packageVO_hit.setPackage_hit(detailPackage.getPackage_hit()+1);
		} finally{
			if(packageDAO.updatePackage(packageVO_hit) > 0){
				// 성공
				check = true;
				session.setAttribute("view_check", packageVO.getPackage_pk());
			}
		}
		model.addAttribute("packageVO", detailPackage);
		
		return "/package/packageDetailForm";
	}
	
	//패키지 삭제
	@RequestMapping("packageDeletePro.go")
	public String packageDeletePro (PackageVO packageVO) throws Exception{
		System.out.println("패키지 삭제 PRO 컨트롤러");
		System.out.println(packageVO.getPackage_pk());
		System.out.println("-------------");
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		
		packageDAO.deletePackage(packageVO);
		
		
		return "redirect:getAllPackage.go";
	}
	
	//패키지 수정 폼
	@RequestMapping("updatePackageForm.go")
	public String updatePackageForm (Model model, PackageVO packageVO) throws Exception{
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		
		PackageVO detailPackage = packageDAO.selectPackage(packageVO);
		
		model.addAttribute("packageVO", detailPackage);
		
		return "/package/updatePackageForm";
	}
	
	//패키지 수정 프로
	@RequestMapping("updatePackagePro.go")
	public String updatePackagePro (PackageVO packageVO) throws Exception{
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		packageDAO.updatePackage(packageVO);
		
		return "redirect:packageDetailForm.go?package_pk="+packageVO.getPackage_pk();
	}
	
	
	// 이미지 복사
		public void imgCopy(String inputFullPath ,String outputImgPath, String img_name) throws Exception{
			
			String fullPath = outputImgPath + "/" + img_name;
			
			FileInputStream fis = null;
			FileOutputStream fos = null;

			try {
				fis = new FileInputStream(inputFullPath); // 원본파일
				fos = new FileOutputStream(fullPath); // 복사위치

				byte[] buffer = new byte[1024];
				int readcount = 0;

				while ((readcount = fis.read(buffer)) != -1) {
					fos.write(buffer, 0, readcount); // 파일 복사
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				fis.close();
				fos.close();
			}
		}
	
}
