package com.traveler.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.traveler.model.PackageVO;

@Repository
public interface PackageDAO {
	
	
	//전체 목록
	public List<PackageVO> getAllPackage() throws Exception;
	
	//추가
	public void insertPackage(PackageVO packageVO) throws Exception;
	
	//수정
	public void updatePackage(PackageVO packageVO) throws Exception;
	
	//삭제
	public void deletePackage(PackageVO packageVO) throws Exception;
		
	//특정한 목록 찾기
	public List<PackageVO> getPackage(PackageVO packageVO) throws Exception;

}
