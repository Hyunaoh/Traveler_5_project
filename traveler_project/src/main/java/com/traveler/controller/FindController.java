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

	// 가이드 찾기 리스트목록
	@RequestMapping("/findListForm.go")
	public String findListForm(Model model) throws Exception {
		System.out.println("[system] access findListForm!");

		// 모든 리스트 출력할 List 가져옴
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		List<FindVO> findList = findDAO.selectFindListAll();
		System.out.println("  >> success processing!");

		model.addAttribute("findList", findList);
		return "/find/findListForm";
	}

	// 가이드 찾기 모집글 올리기 Form
	@RequestMapping("/findInsertForm.go")
	public String findInsertForm(Model model) throws Exception {
		System.out.println("[system] access findInsertForm!");
		return "/find/findInsertForm";
	}

	// 가이드 찾기 모집글 올리기 Pro (실제 DB Insert 부분)
	@RequestMapping("/findInsertPro.go")
	public String findInsertPro(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findInsertPro!");

		// 성공여부 판단한 변수
		boolean check = false;

		// 입력한 정보 insert
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		if (findDAO.insertFindInfo(findVO) > 0) {
			// 성공
			check = true;
		}
		System.out.println("  >> processing result : " + check);

		model.addAttribute("check", check);
		return "/find/findInsertPro";
	}

	// 가이드 찾기 모집글 수정 Form
	@RequestMapping("/findUpdateForm.go")
	public String findUpdateForm(Model model, FindVO findVO_in) throws Exception {
		System.out.println("[system] access findUpdateForm!");

		// 수정할 글의 특정한 정보 VO 하나를 가져옴
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		FindVO findVO_out = findDAO.selectFindInfo(findVO_in);
		System.out.println("  >> success processing!");

		model.addAttribute("findVO", findVO_out);
		return "/find/findUpdateForm";
	}

	// 가이드 찾기 모집글 수정 Pro (실제 DB Update 부분)
	@RequestMapping("/findUpdatePro.go")
	public String findUpdatePro(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findUpdatePro!");

		// 성공여부 판단한 변수
		boolean check = false;

		// 입력한 정보 update
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		if (findDAO.updateFindInfo(findVO) > 0) {
			// 성공
			check = true;
		}
		System.out.println("  >> processing result : " + check);

		model.addAttribute("check", check);
		return "/find/findUpdatePro";
	}

	// 가이드 찾기 모집글 삭제 Pro (실제 DB Delete 부분)
	@RequestMapping("/findDeletePro.go")
	public String findDeletePro(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findDeletePro!");

		// 성공여부 판단한 변수
		boolean check = false;

		// 자신의 모집글 삭제
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		if (findDAO.deleteFindInfo(findVO) > 0) {
			// 성공
			check = true;
		}
		System.out.println("  >> processing result : " + check);

		model.addAttribute("check", check);
		return "/find/findDeletePro";
	}

}
