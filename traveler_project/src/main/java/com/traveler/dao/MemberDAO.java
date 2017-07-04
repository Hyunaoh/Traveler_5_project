package com.traveler.dao;

import java.util.List;

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

	
	public void adminUpdateGuide(MemberVO memberVO);

	
	
	

	
	
	

	
	
}
