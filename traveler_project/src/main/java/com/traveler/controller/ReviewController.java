package com.traveler.controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.dao.ReviewDAO;
import com.traveler.model.MemberVO;
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
	@RequestMapping("/writeform.go")
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
	}
	@RequestMapping("/listForUpdate.go")
	public String listForUpdate(Model model)throws Exception{
		int package_pk = 1;
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		List<ReviewVO> reviewList = reviewDAO.getReviewList(package_pk);
		model.addAttribute("rlist", reviewList);
		return "review/reviewWriteForm";
	}
	@RequestMapping("/reviewWrite.go")
	public String reviewWrite(ReviewVO reviewVO, Model model) throws Exception{
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		String user = "test1"; //나중에 세션으로 변경
		reviewUpdateInit(user);
		//입력 부분
		System.out.println("점수 넘어 옴? " + reviewVO.getReview_score());
		reviewDAO.insertReview(reviewVO);
		System.out.println("입력완료");
		return "redirect:writeform.go";
	}
	
	//리뷰삭제 하는 부분
	@RequestMapping("/deleteReview.go")
	public String reviewDelete(int review_pk) throws Exception{
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		String user = "test1"; //나중에 세션으로 변경
		reviewUpdateInit(user);
		reviewDAO.deleteReview(review_pk);
		return "redirect:writeform.go";
	}
	
	//수정버튼을 눌렀을 시 접근하는 부분
	@RequestMapping("/updateReady.go")
	public String updateReady(int package_pk, int review_pk) throws Exception{
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		String user = "test1"; //나중에 세션으로 변경
		reviewUpdateInit(user);
		reviewDAO.updateReady(review_pk);
		return "redirect:listForUpdate.go#review_comment";
	}
	
	//업데이트 동작부분
	@RequestMapping("updatePro.go")
	public String updatePro(ReviewVO reviewVO) throws Exception{
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		String user = "test1"; //나중에 세션으로 변경
		reviewUpdateInit(user);
		
		reviewDAO.updateReview(reviewVO);
		
		return "redirect:writeform.go";
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
