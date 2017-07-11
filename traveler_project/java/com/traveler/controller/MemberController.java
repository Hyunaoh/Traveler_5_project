package com.traveler.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.Principal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
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
import com.traveler.dao.PackageDAO;
import com.traveler.model.FacebookVO;
import com.traveler.model.GoogleVO;
import com.traveler.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	SqlSession sqlSession;

	// Facebook Login
	@RequestMapping("/facebookLogin.go")
	public String facebookLogin(Model model, FacebookVO facebookVO) throws Exception {
		System.out.println("[system] access facebookLogin! ");
		String view = "";
		if(facebookVO != null){
			MemberVO memberVO = new MemberVO();
			memberVO.setMember_id(facebookVO.getF_email());
			MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
			memberVO = memberDAO.selectMemberList(memberVO);
			try{
				if(memberVO.getMember_id().equals(facebookVO.getF_email())){
					// 이미 가입한 회원!
					// 로그인을 한다.
					model.addAttribute("memberVO", memberVO);
					view = "/member/loginForm";
				}
			} catch(Exception e){
				// 회원이 아님 (회원가입을 함)
				// 구글 정보 가져옴
				model.addAttribute("facebookVO", facebookVO);
				view = "/member/memberInsertForm";
			}
		}
		return view;
	}
	
	// Google Login
	@RequestMapping("/googleLogin.go")
	public String googleLogin(Model model, GoogleVO googleVO) throws Exception {
		System.out.println("[system] access googleLogin! ");
		String view = "";
		if(googleVO != null){
			MemberVO memberVO = new MemberVO();
			memberVO.setMember_id(googleVO.getEmail());
			MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
			memberVO = memberDAO.selectMemberList(memberVO);
			try{
				if(memberVO.getMember_id().equals(googleVO.getEmail())){
					// 이미 가입한 회원!
					// 로그인을 한다.
					model.addAttribute("memberVO", memberVO);
					view = "/member/loginForm";
				}
			} catch(Exception e){
				// 회원이 아님 (회원가입을 함)
				// 구글 정보 가져옴
				model.addAttribute("googleVO", googleVO);
				view = "/member/memberInsertForm";
			}
		}
		return view;
	}
	
	
	// DB member Insert
	@RequestMapping("/memberInsertForm.go")
	public String memberInsertForm(Model model, GoogleVO googleVO) throws Exception {
		System.out.println("[system] access memberInsertForm! ");
		model.addAttribute("googleVO", googleVO);
		return "/member/memberInsertForm";
	}

	
	//가이드권한 신청 폼
	@RequestMapping("/guideForm.go")
	public String guideForm(MemberVO memberVO, Model model, Principal pincipal) throws Exception {
		
		MemberDAO memberDAO=sqlSession.getMapper(MemberDAO.class);
		//ID 저장
		memberVO.setMember_id(pincipal.getName());
		MemberVO list= memberDAO.selectMyPage(memberVO);
		
		model.addAttribute("list", list);
		return "/member/guideForm";
	}
	
	//가이드 신청 - isGuide 
	@RequestMapping("/memberGuideUp.go")
	public String memberGuideUp(Principal pincipal) throws Exception {
		System.out.println("[system] access memberGuideUp! ");
		
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		MemberVO memberVO=new MemberVO();
		
		memberVO.setMember_id(pincipal.getName());
		MemberVO vo= memberDAO.selectMyPage(memberVO);
		
		memberDAO.updateIsGuide(vo);
		
		
		return "home";
	}

	
	//멤버 회원가입
	@Transactional
	@RequestMapping("/memberInsertPro.go")
	public String memberInsertPro(Model model, MemberVO memberVO) throws Exception {
		System.out.println("[system] access memberInsertPro! ");

		boolean check = false;

		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		if (memberDAO.insertMember(memberVO) > 0 && memberDAO.insertRole(memberVO) > 0) {
			check = true;
		}
		System.out.println("멤버 입력 완료");
		model.addAttribute("check", check);
		return "/member/memberInsertPro";
	}

	
	// Login security
	@RequestMapping("/loginForm.go")
	public String loginForm() throws Exception {
		System.out.println("[system] access loginForm! ");
		return "/member/loginForm";
	}
	
	
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

	//회원탈퇴 form 
	@RequestMapping("/memberDeleteForm.go")
	public String memberDeleteForm(Model model)throws Exception{
		System.out.println("[system] access memberDelete! ");
		
		return "/member/memberDeleteForm";
	}
	
	//회원탈퇴 pro
	@RequestMapping("/memberDelete.go")
	public String memberDelete(Model model, HttpServletRequest request, Principal principal )throws Exception{
		System.out.println("[system] access memberDelete! ");
		String confirm_pwd=request.getParameter("confirm_pwd");
				System.out.println("confirm_pwd:" + confirm_pwd);
			
		int flag= 0;
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		MemberVO vo= new MemberVO();
		vo.setMember_id(principal.getName());
		System.out.println(vo.toString());
		String member_pwd = memberDAO.selectMemberPwd(vo);
		
				System.out.println("member_pwd:" + member_pwd);
		if(member_pwd.equals(confirm_pwd)){
		memberDAO.memberDelete(vo);
		flag= 1;
		}else{
		System.out.println("실패");
		}
		model.addAttribute("flag", flag);
		return "/member/loginForm";
	}
	
	
	@RequestMapping("/mypageForm.go")
	public String myPageForm(Model model, Principal principal)throws Exception{
		System.out.println("[system] access myPageForm! ");
		
		MemberVO memberVO=new MemberVO();
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		PackageDAO packageDAO=sqlSession.getMapper(PackageDAO.class);
		
		memberVO.setMember_id(principal.getName());
		MemberVO list = memberDAO.selectMemberList(memberVO);
		
		List list2=packageDAO.selectPackage_id(memberVO);
		
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		return "/member/mypage";	
	}
	
	
	//세부사항 insert
	@RequestMapping("/memberInsertDetail.go")
	public String memberInsertDetail()throws Exception{
		System.out.println("[system] access memberInsertDetail! ");
	return "/member/memberInsertDetail";
	}

	
	@RequestMapping("/memberPurchase.go")
	public String memberPurchase()throws Exception{
		System.out.println("[system] access memberInsertDetail! ");
	return "/member/memberPurchase";
	}
	
	@RequestMapping("/memberAdvice.go")
	public String memberAdvice()throws Exception{
		System.out.println("[system] access memberInsertDetail! ");
	return "/member/memberAdvice";
	}
	
	
	
	
	
	
//---------------------------------------------------------------------
	@RequestMapping("/memberInsertDetailPro.go")
	public String memberInsertDetailPro(HttpServletRequest request, Model model, MemberVO memberVO, Principal principal, @RequestParam("imgFile") MultipartFile imgFile)throws Exception{
		System.out.println("[system] access memberInsertDetailPro! ");
		
		//서버에 이미지 저장
		
		String savePath = request.getRealPath("resources/images/profiles");
		String originalFilename=imgFile.getOriginalFilename();
		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
		String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
		String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
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
	
//		 String saveLocalPath = "C:/git/traveler/traveler_project/src/main/webapp/resources/images/profiles";
//		 imgCopy(fullPath, saveLocalPath, rename);
		 
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
