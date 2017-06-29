package com.traveler.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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

		// ì „ì²´ ê²Œì‹œë¬¼ ê°œìˆ˜ ê°€ì ¸ì˜´
		int totalCount = findDAO.countFindList();
		
		model.addAttribute("findList", findList);
		model.addAttribute("totalCount", totalCount);
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
	@Transactional
	@RequestMapping("/findDetailForm.go")
	public String findDetailForm(Model model, FindVO findVO_in, HttpSession session) throws Exception {
		System.out.println("[system] access findDetailForm!");

		// íŠ¹ì •í•œ ê¸€ì˜ ì •ë³´ VO í•˜ë‚˜ë¥¼ ê°€ì ¸ì˜´
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		FindVO findVO_out = findDAO.selectFindInfo(findVO_in);
		System.out.println("  >> success processing! (select)");
		
		// ì¡°íšŒìˆ˜ ì¦ê°€
		boolean check = false;
		FindVO findVO_view = new FindVO();
		findVO_view.setFind_pk(findVO_in.getFind_pk());
		try {
			if((int)session.getAttribute("view_check") == findVO_in.getFind_pk()){
				// ìƒˆë¡œê³ ì¹¨ í–ˆì„ë•ŒëŠ” ê·¸ëŒ€ë¡œ ê°’ìœ ì§€
				findVO_view.setFind_hit(findVO_out.getFind_hit());
			} else{
				findVO_view.setFind_hit(findVO_out.getFind_hit() + 1);
			}
		} catch (Exception e) {
			findVO_view.setFind_hit(findVO_out.getFind_hit() + 1);
		} finally {
			if(findDAO.updateFindInfo(findVO_view) > 0){
				// ì„±ê³µ
				check = true;
				session.setAttribute("view_check", findVO_in.getFind_pk());
			}
			System.out.println("  >> Increase View Processing Result : " + check);
		}
		
		model.addAttribute("findVO", findVO_out);
		return "/find/findDetailForm";
	}
	
	// êµ­ê°€ ë³„ ì¡°ê±´ ë¦¬ìŠ¤íŠ¸ ê²€ìƒ‰
	@RequestMapping("/findCountryListForm.go")
	public String findCountryListForm(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findCountryListForm!");

		// êµ­ê°€ ë³„ ë¦¬ìŠ¤íŠ¸ ì¶œë ¥í•  List ê°€ì ¸ì˜´
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		List<FindVO> findList = findDAO.selectCountryFindList(findVO);
		System.out.println("  >> success processing!");

		// ì „ì²´ ê²Œì‹œë¬¼ ê°œìˆ˜ ê°€ì ¸ì˜´
		int totalCount = findDAO.countFindList();
		
		model.addAttribute("findList", findList);
		model.addAttribute("totalCount", totalCount);
		return "/find/findListForm";
	}
	
	// êµ­ê°€ ë³„ ì¡°ê±´ ë¦¬ìŠ¤íŠ¸ ê²€ìƒ‰
	@RequestMapping("/findSearchListForm.go")
	public String findSearchListForm(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findSearchListForm!");

		// ê²€ìƒ‰ ë¦¬ìŠ¤íŠ¸ ì¶œë ¥í•  List ê°€ì ¸ì˜´
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		List<FindVO> findList = findDAO.selectSearchFindList(findVO);
		System.out.println("  >> success processing!");

		// ì „ì²´ ê²Œì‹œë¬¼ ê°œìˆ˜ ê°€ì ¸ì˜´
		int totalCount = findDAO.countFindList();
		
		model.addAttribute("findList", findList);
		model.addAttribute("totalCount", totalCount);
		return "/find/findListForm";
	}
}
