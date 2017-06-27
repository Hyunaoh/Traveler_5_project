package com.traveler.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.dao.FindDAO;
import com.traveler.model.FindVO;

@Controller
@RequestMapping("/find")
public class FindController {

	@Autowired
	SqlSession sqlSession;

	// °¡ÀÌµå Ã£±â ¸®½ºÆ®¸ñ·Ï
	@RequestMapping("/findListForm.go")
	public String findListForm(Model model) throws Exception {
		System.out.println("[system] access findListForm!");

		// ¸ðµç ¸®½ºÆ® Ãâ·ÂÇÒ List °¡Á®¿È
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		List<FindVO> findList = findDAO.selectFindListAll();
		System.out.println("  >> success processing!");

		model.addAttribute("findList", findList);
		return "/find/findListForm";
	}

	// °¡ÀÌµå Ã£±â ¸ðÁý±Û ¿Ã¸®±â Form
	@RequestMapping("/findInsertForm.go")
	public String findInsertForm(Model model) throws Exception {
		System.out.println("[system] access findInsertForm!");
		return "/find/findInsertForm";
	}

	// °¡ÀÌµå Ã£±â ¸ðÁý±Û ¿Ã¸®±â Pro (½ÇÁ¦ DB Insert ºÎºÐ)
	@RequestMapping("/findInsertPro.go")
	public String findInsertPro(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findInsertPro!");

		// ¼º°ø¿©ºÎ ÆÇ´ÜÇÑ º¯¼ö
		boolean check = false;

		// ÀÔ·ÂÇÑ Á¤º¸ insert
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		if (findDAO.insertFindInfo(findVO) > 0) {
			// ¼º°ø
			check = true;
		}
		System.out.println("  >> processing result : " + check);

		model.addAttribute("check", check);
		return "/find/findResult";
	}

	// °¡ÀÌµå Ã£±â ¸ðÁý±Û ¼öÁ¤ Form
	@RequestMapping("/findUpdateForm.go")
	public String findUpdateForm(Model model, FindVO findVO_in) throws Exception {
		System.out.println("[system] access findUpdateForm!");

		// ¼öÁ¤ÇÒ ±ÛÀÇ Æ¯Á¤ÇÑ Á¤º¸ VO ÇÏ³ª¸¦ °¡Á®¿È
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		FindVO findVO_out = findDAO.selectFindInfo(findVO_in);
		System.out.println("  >> success processing!");

		model.addAttribute("findVO", findVO_out);
		return "/find/findUpdateForm";
	}

	// °¡ÀÌµå Ã£±â ¸ðÁý±Û ¼öÁ¤ Pro (½ÇÁ¦ DB Update ºÎºÐ)
	@RequestMapping("/findUpdatePro.go")
	public String findUpdatePro(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findUpdatePro!");

		// ¼º°ø¿©ºÎ ÆÇ´ÜÇÑ º¯¼ö
		boolean check = false;

		// ÀÔ·ÂÇÑ Á¤º¸ update
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		if (findDAO.updateFindInfo(findVO) > 0) {
			// ¼º°ø
			check = true;
		}
		System.out.println("  >> processing result : " + check);

		model.addAttribute("check", check);
		return "/find/findResult";
	}

	// °¡ÀÌµå Ã£±â ¸ðÁý±Û »èÁ¦ Pro (½ÇÁ¦ DB Delete ºÎºÐ)
	@RequestMapping("/findDeletePro.go")
	public String findDeletePro(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findDeletePro!");

		// ¼º°ø¿©ºÎ ÆÇ´ÜÇÑ º¯¼ö
		boolean check = false;

		// ÀÚ½ÅÀÇ ¸ðÁý±Û »èÁ¦
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		if (findDAO.deleteFindInfo(findVO) > 0) {
			// ¼º°ø
			check = true;
		}
		System.out.println("  >> processing result : " + check);

		model.addAttribute("check", check);
		return "/find/findResult";
	}

	// ê°€ì´ë“œ ì°¾ê¸° ìžì„¸í•œ ì •ë³´ Form
	@RequestMapping("/findDetailForm.go")
	public String findDetailForm(Model model, FindVO findVO_in) throws Exception {
		System.out.println("[system] access findDetailForm!");

		// íŠ¹ì •í•œ ê¸€ì˜ ì •ë³´ VO í•˜ë‚˜ë¥¼ ê°€ì ¸ì˜´
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		FindVO findVO_out = findDAO.selectFindInfo(findVO_in);
		System.out.println("  >> success processing!");

		model.addAttribute("findVO", findVO_out);
		return "/find/findDetailForm";
	}
}
