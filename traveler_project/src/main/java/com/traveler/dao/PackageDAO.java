package com.traveler.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.traveler.model.FindVO;
import com.traveler.model.PackageVO;

public interface PackageDAO {
	
	
	//전체 목록
	public List<PackageVO> getAllPackage() throws Exception;
	
	// 페이징 처리된 전체 리스트
	public List<PackageVO> selectPackageListAllPaging(PackageVO packageVO) throws Exception;
	
	//특정한 패키지 불러오기
	public PackageVO selectPackage(PackageVO packageVO) throws Exception;
	
	//추가
	public int insertPackage(PackageVO packageVO) throws Exception;
	
	//수정
	public int updatePackage(PackageVO packageVO) throws Exception;
	
	//삭제
	public int deletePackage(PackageVO packageVO) throws Exception;
		
	//특정한 나라 목록 찾기
	public List<PackageVO> searchPackage(PackageVO packageVO) throws Exception;
	
	//특정한 나라 게시물 갯수
	public int countContryPackage(PackageVO packageVO) throws Exception;
	
	//전체 패키지 등록 갯수
	public int countTotalPackage() throws Exception;
	
	//미승인 게시글 불러오기
	public List<PackageVO> getUnapprovedPackage() throws Exception;
	
	//해시태그 겹치는 게시물 가져오기
	public List<PackageVO> getSimillar(String str) throws Exception;
	
	
	
}
