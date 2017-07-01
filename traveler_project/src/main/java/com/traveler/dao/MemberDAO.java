package com.traveler.dao;

import com.traveler.model.MemberVO;

public interface MemberDAO {

	//ȸ�� ���
	public int insertMember(MemberVO memberVO)throws Exception;

	public MemberVO selectMemberList(MemberVO memberVO);

	
	
}
