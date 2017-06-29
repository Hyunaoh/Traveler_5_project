package com.traveler.dao;

import java.util.List;

import com.traveler.model.FindVO;

public interface FindDAO {

	// ÀüÃ¼ ¸ñ·Ï °¡Á®¿È
	public List<FindVO> selectFindListAll() throws Exception;

	// ¸ñ·Ï Insert
	public int insertFindInfo(FindVO findVO) throws Exception;

	// ¸ñ·Ï Update
	public int updateFindInfo(FindVO findVO) throws Exception;

	// ¸ñ·Ï Delete
	public int deleteFindInfo(FindVO findVO) throws Exception;

	// Æ¯Á¤ÇÑ Á¤º¸ ÇÏ³ª¸¦ °¡Á®¿È
	public FindVO selectFindInfo(FindVO findVO_in);
	
	// ì „ì²´ ê²Œì‹œë¬¼ ê°œìˆ˜ ê°€ì ¸ì˜´
	public int countFindList() throws Exception;

	// êµ­ê°€ë³„ ëª©ë¡ ê°€ì ¸ì˜´
	public List<FindVO> selectCountryFindList(FindVO findVO);

	// ê²€ìƒ‰ ë¦¬ìŠ¤íŠ¸ ê°€ì ¸ì˜´
	public List<FindVO> selectSearchFindList(FindVO findVO);
}
