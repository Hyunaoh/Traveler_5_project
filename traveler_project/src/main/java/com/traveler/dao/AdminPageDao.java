package com.traveler.dao;

import java.sql.SQLException;
import java.util.List;

import com.traveler.model.MemberVO;

public interface AdminPageDao {
	
	//��� ȸ������ ���
	public List<MemberVO> getAllAdmin() throws ClassNotFoundException, SQLException;
	
}
