package com.traveler.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.dao.MemberDAO;
import com.traveler.dao.ReviewDAO;
import com.traveler.model.GoogleVO;
import com.traveler.model.MemberVO;
import com.traveler.model.NaverVO;
import com.traveler.model.ReviewVO;

@Controller
@RequestMapping(value ="/review")
public class ReviewController {
	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/star.go")
	public String adminForm(Model model, MemberVO vo) throws SQLException, ClassNotFoundException{
		return "review/star";
	}
	//review insertForm 접근
	@RequestMapping("/reviewWriteForm.go")
	public String reviewWriteForm(Model model,int package_pk, Principal principal)throws Exception{
		System.out.println("reviewWriteForm.go 접근");
		String user = principal.getName();
		model.addAttribute("package_pk", package_pk);
		model.addAttribute("user", user);
		return "/review/reviewWriteForm";
	}
	//insert Review
	@RequestMapping("/reviewWritePro.go")
	public String reviewWritePro(ReviewVO reviewVO, Model model)throws Exception{
		System.out.println("reviewWritePro.go 접근");
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		reviewDAO.insertReview(reviewVO);
		return "redirect:/home.go";
	}
	/*@RequestMapping("/writeform.go")
	public String formgo(Model model) throws Exception{
		System.out.println("writeform 접근");
		int package_pk = 1;
		String user = "test1"; //나중에 세션으로 변경
		reviewUpdateInit(user);
		//셀렉 시작
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		List<ReviewVO> reviewList = reviewDAO.getReviewList(package_pk);
		model.addAttribute("rlist", reviewList);
		//셀릭 끝
		return "review/reviewWriteForm";
	}*/
	/*@RequestMapping("/listForUpdate.go")
	public String listForUpdate(Model model)throws Exception{
		int package_pk = 1;
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		List<ReviewVO> reviewList = reviewDAO.getReviewList(package_pk);
		model.addAttribute("rlist", reviewList);
		return "review/reviewWriteForm";
	}*/
	//리뷰삭제 하는 부분
	@RequestMapping("/deleteReview.go")
	public String reviewDelete(int package_pk, int review_pk, Principal principal) throws Exception{
		System.out.println("deleteReview.go 접근");
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		String user = principal.getName();
		String view = "redirect:/package/packageDetailForm.go?package_pk=" + package_pk;
		reviewUpdateInit(user);
		reviewDAO.deleteReview(review_pk);
		return view;
	}
	
	//수정버튼을 눌렀을 시 접근하는 부분
	@RequestMapping("/updateReady.go")
	public String updateReady(int package_pk, int review_pk, Principal principal) throws Exception{
		System.out.println("updateReady.go 접근");
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		String user = principal.getName();
		String view = "redirect:/package/packageDetailForm.go?package_pk=" + package_pk + "#review_comment";
		reviewUpdateInit(user);
		reviewDAO.updateReady(review_pk);
		return view;
	}
	
	//업데이트 동작부분
	@RequestMapping("updatePro.go")
	public String updatePro(ReviewVO reviewVO, Principal principal) throws Exception{
		System.out.println("updatePro.go 접근");
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		String user = principal.getName();
		String view = "redirect:/package/packageDetailForm.go?package_pk=" + reviewVO.getPackage_pk();
		reviewUpdateInit(user);
		
		reviewDAO.updateReview(reviewVO);
		
		return view;
	}
	
	//udate_check를 매번 초기화 해줌.
	public void reviewUpdateInit(String user)throws Exception{
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		int result = 0;
		result = reviewDAO.checkReview(user);
		if(result == 1){
			reviewDAO.reviewUpdateInit(user);
		}
		
	}
}
