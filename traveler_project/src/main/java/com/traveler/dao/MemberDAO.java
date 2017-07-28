package com.traveler.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.traveler.model.CounselVO;
import com.traveler.model.MemberVO;

public interface MemberDAO {

	//Member DB Insert	
	public int insertMember(MemberVO memberVO)throws Exception;
	
	//Roll DB Insert 
	public int insertRole(MemberVO memberVO)throws Exception;
	
	//ID 중복 체크
	public MemberVO selectMemberList(MemberVO memberVO)throws Exception;

	//Mypage 항목 가져오기
	public MemberVO selectMyPage(MemberVO vo);

	//세부사항 업데이트
	public void updateMember(MemberVO result_memberVO);

	//모든 회원 정보 가져오기
	public List<MemberVO> selectAllMember();

	//가이드 권한 바꾸기
	public void adminUpdateGuide(MemberVO memberVO);

	//회원탈퇴
	public void memberDelete(MemberVO vo);

	public String selectMemberPwd(MemberVO vo);

	public void insertGuide(MemberVO memberVO);

	public void deleteGuide(MemberVO memberVO);

	public void updateIsGuide(MemberVO vo);

	//페이징
	public int getTotalCountOfNotice(MemberVO memberVO);

	public List getPagePerList(MemberVO memberVO);

	public List getPagePerList_group(MemberVO memberVO);
	
	//Q&A
	public void insertInquire(CounselVO counselVO);
	
	public List selectAllQnA(MemberVO memberVO);

	public int countTravel(MemberVO memberVO);

	public int countTravel2(MemberVO memberVO);

	

	


	
}
