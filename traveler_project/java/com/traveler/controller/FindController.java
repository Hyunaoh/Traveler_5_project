package com.traveler.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.traveler.commons.Commons;
import com.traveler.dao.FindDAO;
import com.traveler.model.FindVO;
import com.traveler.model.PagingVO;

@Controller
@RequestMapping("/find")
public class FindController {

	@Autowired
	SqlSession sqlSession;

	// 가이드 찾기 전체 리스트
	@RequestMapping("/findListForm.go")
	public String findListForm(Model model, PagingVO pagingVO) throws Exception {
		System.out.println("[system] access findListForm!");

		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		// 전체 게시물 개수 가져옴
		int totalCount = findDAO.countFindList();
		final int COUNT_PER_PAGE = 5; // 한페이지당 게시글 개수
		pagingVO.setCountBoardPerPage(COUNT_PER_PAGE);
		pagingVO.setTotalCount(totalCount);
		pagingVO = new Commons().processPaging(pagingVO); // 페이징 연산

		// 가이드 찾기 전체 List 가져옴
		FindVO findVO = new FindVO();
		findVO.setCountBoardPerPage(pagingVO.getCountBoardPerPage());
		findVO.setStartBoardNum(pagingVO.getStartBoardNum());
		List<FindVO> findList = findDAO.selectFindListAllPaging(findVO);
		System.out.println("  >> success processing!");

		// 전체 게시판에서 가져옴
		pagingVO.setState("listAll");

		model.addAttribute("findList", findList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pagingVO", pagingVO);
		return "/find/findListForm";
	}

	// ���̵� ã�� ������ �ø��� Form
	@RequestMapping("/findInsertForm.go")
	public String findInsertForm(Model model) throws Exception {
		System.out.println("[system] access findInsertForm!");
		return "/find/findInsertForm";
	}

	// ���̵� ã�� ������ �ø��� Pro (���� DB Insert �κ�)
	@RequestMapping("/findInsertPro.go")
	public String findInsertPro(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findInsertPro!");

		// �������� �Ǵ��� ����
		boolean check = false;

		// �Է��� ���� insert
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		if (findDAO.insertFindInfo(findVO) > 0) {
			// ����
			check = true;
		}
		System.out.println("  >> processing result : " + check);

		model.addAttribute("check", check);
		return "/find/findResult";
	}

	// 수정 Form
	@RequestMapping("/findUpdateForm.go")
	public String findUpdateForm(Model model, FindVO findVO_in, Principal principal) throws Exception {
		System.out.println("[system] access findUpdateForm!");

		// 세션 ID 값 가져옴
		String id = principal.getName();
		
		// 정보 가져옴
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		FindVO findVO_out = findDAO.selectFindInfo(findVO_in);
		System.out.println("  >> success processing!");
		
		// 작성자가 아니면 글을 수정 할 수 없음 (억지로 URL에 주소 치고 들어오는 사람 방지)
		String view;
		if(id.equals(findVO_out.getMember_id())){
			view = "/find/findUpdateForm";
		} else {
			view = "redirect:findListForm.go";
		}

		model.addAttribute("findVO", findVO_out);
		return view;
	}

	// ���̵� ã�� ������ ���� Pro (���� DB Update �κ�)
	@RequestMapping("/findUpdatePro.go")
	public String findUpdatePro(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findUpdatePro!");

		// �������� �Ǵ��� ����
		boolean check = false;

		// �Է��� ���� update
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		if (findDAO.updateFindInfo(findVO) > 0) {
			// ����
			check = true;
		}
		System.out.println("  >> processing result : " + check);

		model.addAttribute("check", check);
		return "/find/findResult";
	}

	// ���̵� ã�� ������ ���� Pro (���� DB Delete �κ�)
	@RequestMapping("/findDeletePro.go")
	public String findDeletePro(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findDeletePro!");

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
		return "/find/findResult";
	}

	// 가이드 찾기 자세한 정보 Form
	@Transactional
	@RequestMapping("/findDetailForm.go")
	public String findDetailForm(Model model, FindVO findVO_in, HttpSession session) throws Exception {
		System.out.println("[system] access findDetailForm!");

		// 특정한 글의 정보 VO 하나를 가져옴
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		FindVO findVO_out = findDAO.selectFindInfo(findVO_in);
		System.out.println("  >> success processing! (select)");

		// 조회수 증가
		boolean check = false;
		FindVO findVO_view = new FindVO();
		findVO_view.setFind_pk(findVO_in.getFind_pk());
		try {
			if ((int) session.getAttribute("view_check") == findVO_in.getFind_pk()) {
				// 새로고침 했을때는 그대로 값유지
				findVO_view.setFind_hit(findVO_out.getFind_hit());
			} else {
				findVO_view.setFind_hit(findVO_out.getFind_hit() + 1);
			}
		} catch (Exception e) {
			findVO_view.setFind_hit(findVO_out.getFind_hit() + 1);
		} finally {
			if (findDAO.updateFindInfo(findVO_view) > 0) {
				// 성공
				check = true;
				session.setAttribute("view_check", findVO_in.getFind_pk());
			}
			System.out.println("  >> Increase View Processing Result : " + check);
		}

		model.addAttribute("findVO", findVO_out);
		return "/find/findDetailForm";
	}

	// 국가 별 조건 리스트 검색
	@RequestMapping("/findCountryListForm.go")
	public String findCountryListForm(Model model, FindVO findVO, PagingVO pagingVO) throws Exception {
		System.out.println("[system] access findCountryListForm!");

		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);

		// 전체 게시물 개수 가져옴
		int totalCount = findDAO.countCountryFindList(findVO);
		final int COUNT_PER_PAGE = 5; // 한페이지당 게시글 개수
		pagingVO.setCountBoardPerPage(COUNT_PER_PAGE);
		pagingVO.setTotalCount(totalCount);
		pagingVO = new Commons().processPaging(pagingVO); // 페이징 연산

		// 국가 별 리스트 출력할 List 가져옴
		findVO.setCountBoardPerPage(pagingVO.getCountBoardPerPage());
		findVO.setStartBoardNum(pagingVO.getStartBoardNum());
		List<FindVO> findList = findDAO.selectCountryFindList(findVO);
		System.out.println("  >> success processing!");

		// 나라 게시판에서 가져옴
		pagingVO.setState("listCountryAll");

		model.addAttribute("findList", findList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("findVO", findVO);
		return "/find/findListForm";
	}

	// 검색
	@RequestMapping("/findSearchListForm.go")
	public String findSearchListForm(Model model, FindVO findVO, PagingVO pagingVO) throws Exception {
		System.out.println("[system] access findSearchListForm!");

		// 검색 리스트 출력할 List 가져옴
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);

		// 전체 게시물 개수 가져옴
		int totalCount = findDAO.countSearchFindList(findVO);
		final int COUNT_PER_PAGE = 5; // 한페이지당 게시글 개수
		pagingVO.setCountBoardPerPage(COUNT_PER_PAGE);
		pagingVO.setTotalCount(totalCount);
		pagingVO = new Commons().processPaging(pagingVO); // 페이징 연산

		// 국가 별 리스트 출력할 List 가져옴
		findVO.setCountBoardPerPage(pagingVO.getCountBoardPerPage());
		findVO.setStartBoardNum(pagingVO.getStartBoardNum());
		List<FindVO> findList = findDAO.selectSearchFindList(findVO);
		System.out.println("  >> success processing!");

		// 검색 게시판에서 가져옴
		pagingVO.setState("listSearchAll");

		model.addAttribute("findList", findList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("findVO", findVO);
		return "/find/findListForm";
	}

	// 신고했을경우
	@RequestMapping("/findDeclarePro.go")
	public String findDeclarePro(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findDeclarePro!");

		boolean check = false;
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		findVO.setFind_badState(0);
		if (findDAO.declareFind(findVO) > 0) {
			// success
			check = true;
		}
		System.out.println("  >> processing result : " + check);

		model.addAttribute("check", check);
		return "/find/findDeclarePro";
	}
	
	@ResponseBody
	@RequestMapping("/findMostViewAjax.go")
	public List<FindVO> findMostViewAjax() throws Exception{
		System.out.println("[system] access findMostViewAjax!");
		
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		
		// 가이드 찾기 전체 List 가져옴
		List<FindVO> findList = findDAO.selectMostFindListAll();
		System.out.println("  >> success processing!");

		// 전체 게시판에서 가져옴
		return findList;
	}
	
}
