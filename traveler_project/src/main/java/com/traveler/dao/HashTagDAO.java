package com.traveler.dao;

import java.util.List;

import com.traveler.model.HashTagVO;

public interface HashTagDAO {
	
	// 해시태그 전체 가져오기
		public List<HashTagVO> getHashTag() throws Exception;
		
		//hash태그 테이블에 insert 하기
		public int insertHashTag(String tag) throws Exception;
		
		//특정 태그 있는지 검색
		public int getSpecificHashTag(HashTagVO hashTagVO) throws Exception;
		
}
