package com.traveler.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.traveler.model.MemberVO;

@Repository
public class AdminPageDaoImpl implements AdminPageDao {

	@Autowired
	private SqlSession adminSqlSession;

	@Override
	public List<MemberVO> getAllAdmin() throws ClassNotFoundException, SQLException {
		return adminSqlSession.selectList("adminSqlSession.getAllAdmin");
	}

}
