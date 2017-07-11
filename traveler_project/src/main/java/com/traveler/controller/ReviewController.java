package com.traveler.controller;

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
	@RequestMapping("/logintest.go")
	public String logintest() throws Exception{
		return "review/APIExamNaverLogin";
	}
	@RequestMapping("/logintest2.go")
	public String logintest2() throws Exception{
		return "review/callback";
	}
	@RequestMapping("/loginvalue.go")
	public String loginvalue(Model model, NaverVO naverVO) throws Exception{
		System.out.println("email = " + naverVO.getN_email());
		System.out.println("nickname = " + naverVO.getN_nickname());
		System.out.println("age = " + naverVO.getN_name());
		System.out.println("name = " + naverVO.getN_name());
		System.out.println("token = " + naverVO.getN_token());
		String view = "";
		
		if(naverVO != null){
			MemberVO memberVO = new MemberVO();
			memberVO.setMember_id(naverVO.getN_email());
			MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
			memberVO = memberDAO.selectMemberList(memberVO);
			try {
				if(memberVO.getMember_id().equals(naverVO.getN_email()));
				// 이미 가입한 회원!
				// 로그인을 한다.
				model.addAttribute("memberVO", memberVO);
				view = "/member/loginForm";
				
			} catch (Exception e) {
				// 회원이 아님 (회원가입을 함)
				// 네이버 정보 가져옴
				model.addAttribute("naverVO", naverVO);
				view = "/member/TmemberInsertForm";
			}
		}
		return view;
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
