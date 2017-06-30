package com.traveler.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.Principal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.traveler.dao.MemberDAO;
import com.traveler.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	SqlSession sqlSession;

	// DB member Insert
	@RequestMapping("/memberInsertForm.go")
	public String memberInsertForm(Model model) throws Exception {
		System.out.println("[system] access memberInsertForm! ");
		return "/member/memberInsertForm";
	}

	
	@Transactional
	@RequestMapping("/memberInsertPro.go")
	public String memberInsertPro(Model model, MemberVO memberVO) throws Exception {
		System.out.println("[system] access memberInsertPro! ");

		boolean check = false;

		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		if (memberDAO.insertMember(memberVO) > 0 && memberDAO.insertRole(memberVO) > 0) {
			check = true;
		}
		System.out.println("��ϵǾ����ϴ�");
		model.addAttribute("check", check);
		return "/member/memberInsertPro";
	}

	// Login security
	@RequestMapping("/loginForm.go")
	public String loginForm() throws Exception {
		System.out.println("[system] access loginForm! ");
		return "/member/loginForm";
	}

	
	// Duplicate instance ID
	@ResponseBody
	@RequestMapping("/idConfirmAjax.go")
	public boolean idConfirmAjax(@RequestBody MemberVO memberVO) throws Exception {
		System.out.println("[system] access idConfirmAjax! ");

		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		boolean check = false;

		try {
			MemberVO result_memberVO = memberDAO.selectMemberList(memberVO);
			if (result_memberVO.getMember_id() != null) {
				check = false;
			}
		} catch (Exception e) {
			check = true;
		}
		return check;
	}
	
	@RequestMapping("/mypageForm.go")
	public String myPageForm(Model model, Principal principal)throws Exception{
		System.out.println("[system] access myPageForm! ");
		
		MemberVO memberVO=new MemberVO();
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		
		memberVO.setMember_id(principal.getName());
		MemberVO list = memberDAO.selectMemberList(memberVO);
		
		model.addAttribute("list", list);
		return "/member/mypage";	
	}
	
	@RequestMapping("/memberInsertDetail.go")
	public String memberInsertDetail()throws Exception{
		System.out.println("[system] access memberInsertDetail! ");
	return "/member/memberInsertDetail";
	}

	@RequestMapping("/memberInsertDetailPro.go")
	public String memberInsertDetailPro(HttpServletRequest request, Model model, MemberVO memberVO, Principal principal, @RequestParam("imgFile") MultipartFile imgFile)throws Exception{
		System.out.println("[system] access memberInsertDetailPro! ");
		
		//서버에 이미지 저장
		
		String savePath = request.getRealPath("/resources/images/profiles");
		String originalFilename=imgFile.getOriginalFilename();
		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
		String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
		String fullPath = savePath + "\\" + rename;
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
	
		 String saveLocalPath = "C:/git/traveler/traveler_project/src/main/webapp/resources/images/profiles";
		 imgCopy(fullPath, saveLocalPath, rename);
		 
		 // 이미지 이름 셋팅
		 memberVO.setMember_profile(rename);
		 
		    
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		
		memberVO.setMember_id(principal.getName());
		memberDAO.updateMember(memberVO);
	
	return "redirect:mypageForm.go";
	}
	
	
	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
	
	// 이미지 복사
	public void imgCopy(String inputFullPath ,String outputImgPath, String img_name) throws Exception{
		
		String fullPath = outputImgPath + "\\" + img_name;
		
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
