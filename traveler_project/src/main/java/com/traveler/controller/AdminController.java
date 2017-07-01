package com.traveler.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.commons.Commons;
import com.traveler.dao.FindDAO;
import com.traveler.model.FindVO;
import com.traveler.model.PagingVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/adminForm.go")
	public String adminForm(){
		System.out.println("[system] access adminForm!");
		return "admin/adminForm";
	}

	@RequestMapping("/adminBoardForm.go")
	public String adminBoardForm(Model model, PagingVO pagingVO) throws Exception{
		System.out.println("[system] access adminBoardForm!");
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		
		// 전체 게시물 개수 가져옴
		final int COUNT_PER_PAGE = 6; // 한페이지당 게시글 개수
		pagingVO.setCountBoardPerPage(COUNT_PER_PAGE);
		pagingVO.setTotalCount(findDAO.countFindList());
		pagingVO = new Commons().processPaging(pagingVO); // 페이징 연산

		// 가이드 찾기 전체 List 가져옴
		FindVO findVO = new FindVO();
		findVO.setCountBoardPerPage(pagingVO.getCountBoardPerPage());
		findVO.setStartBoardNum(pagingVO.getStartBoardNum());
		List<FindVO> findList = findDAO.selectFindListAllPaging(findVO);
		System.out.println("  >> success processing! - 1");
		
		// 전체 나쁜 게시물 개수 가져옴
		final int COUNT_PER_PAGE_BAD = 3; // 한페이지당 게시글 개수
		PagingVO pagingVO_bad = new PagingVO();
		pagingVO_bad.setCurrentPageNum(pagingVO.getCurrentPageNum());
		pagingVO_bad.setCountBoardPerPage(COUNT_PER_PAGE_BAD);
		pagingVO_bad.setTotalCount(findDAO.countBadFindList());
		pagingVO_bad = new Commons().processPaging(pagingVO_bad); // 페이징 연산
		
		// 의심되는 게시물 List 가져옴
		FindVO findVO2 = new FindVO();
		findVO2.setCountBoardPerPage(pagingVO_bad.getCountBoardPerPage());
		findVO2.setStartBoardNum(pagingVO_bad.getStartBoardNum());
		List<FindVO> badFindList = findDAO.selectBadFindListAllPaging(findVO2);
		System.out.println("  >> success processing! - 2");
		
		model.addAttribute("findList", findList);
		model.addAttribute("badFindList", badFindList);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("pagingVO_bad", pagingVO_bad);
		return "admin/adminBoardForm";
	}
	
	@RequestMapping("/adminBoardDeletePro.go")
	public String adminBoardDeletePro(Model model, FindVO findVO) throws Exception{
		System.out.println("[system] access adminBoardDeletePro!");
		
		// �������� �Ǵ��� ����
		boolean check = false;

		// �ڽ��� ������ ����
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		if (findDAO.deleteFindInfo(findVO) > 0) {
			// ����
			check = true;
		}
		System.out.println("  >> processing result : " + check);

		model.addAttribute("check", check);
		
		return "redirect:adminBoardForm.go";
	}
	
	@RequestMapping("/adminBoardDeclarePro.go")
	public String adminBoardDeclarePro(Model model, FindVO findVO) throws Exception{
		System.out.println("[system] access adminBoardDeclarePro!");
		
		// 결과 상태 표시해줄 변수
		boolean check = false;

		// 괜찮은 상태로 수정
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		findVO.setFind_badState(1);
		if (findDAO.declareFind(findVO) > 0) {
			// 성공
			check = true;
		}
		System.out.println("  >> processing result : " + check);

		model.addAttribute("check", check);
		
		return "redirect:adminBoardForm.go";
	}
	
	@RequestMapping("/adminMemberForm.go")
	public String adminMemberForm(){
		System.out.println("[system] access adminMemberForm!");
		return "admin/adminMemberForm";
	}

	@RequestMapping("/adminGuideForm.go")
	public String adminGuideForm(){
		System.out.println("[system] access adminGuideForm!");
		return "admin/adminGuideForm";
	}

	@RequestMapping("/adminPackageForm.go")
	public String adminPackageForm(){
		System.out.println("[system] access adminPackageForm!");
		return "admin/adminPackageForm";
	}
}