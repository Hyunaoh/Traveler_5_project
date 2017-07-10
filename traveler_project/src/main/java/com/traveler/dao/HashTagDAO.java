package com.traveler.dao;

import java.util.List;

import com.traveler.model.HashTagVO;

public interface HashTagDAO {
	
	//특정 hash태그 있는지 검색
		public List<HashTagVO> getHashTag() throws Exception;
		
		//hash태그 테이블에 insert 하기
		public int insertHashTag(String tag) throws Exception;
}
