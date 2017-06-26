package com.traveler.dao;

import java.sql.SQLException;
import java.util.List;

import com.traveler.model.MemberVO;

public interface AdminPageDao {
	
	//모든 회원정보 출력
	public List<MemberVO> getAllAdmin() throws ClassNotFoundException, SQLException;
	
}
