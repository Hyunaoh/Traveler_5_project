package com.traveler.dao;

import com.traveler.model.MemberVO;

public interface MemberDAO {

	//회원 등록
	public int insertMember(MemberVO memberVO)throws Exception;
	
	
}
