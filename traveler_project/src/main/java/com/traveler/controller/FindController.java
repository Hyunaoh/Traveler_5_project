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

	// 가이드 찾기 전체 리스트
	@RequestMapping("/findListForm.go")
	public String findListForm(Model model) throws Exception {
		System.out.println("[system] access findListForm!");

		// 가이드 찾기 전체 List 가져옴
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		List<FindVO> findList = findDAO.selectFindListAll();
		System.out.println("  >> success processing!");

		// 전체 게시물 개수 가져옴
		int totalCount = findDAO.countFindList();
		
		model.addAttribute("findList", findList);
		model.addAttribute("totalCount", totalCount);
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

	// ���̵� ã�� ������ ���� Form
	@RequestMapping("/findUpdateForm.go")
	public String findUpdateForm(Model model, FindVO findVO_in) throws Exception {
		System.out.println("[system] access findUpdateForm!");

		// ������ ���� Ư���� ���� VO �ϳ��� ������
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		FindVO findVO_out = findDAO.selectFindInfo(findVO_in);
		System.out.println("  >> success processing!");

		model.addAttribute("findVO", findVO_out);
		return "/find/findUpdateForm";
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
			if((int)session.getAttribute("view_check") == findVO_in.getFind_pk()){
				// 새로고침 했을때는 그대로 값유지
				findVO_view.setFind_hit(findVO_out.getFind_hit());
			} else{
				findVO_view.setFind_hit(findVO_out.getFind_hit() + 1);
			}
		} catch (Exception e) {
			findVO_view.setFind_hit(findVO_out.getFind_hit() + 1);
		} finally {
			if(findDAO.updateFindInfo(findVO_view) > 0){
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
	public String findCountryListForm(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findCountryListForm!");

		// 국가 별 리스트 출력할 List 가져옴
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		List<FindVO> findList = findDAO.selectCountryFindList(findVO);
		System.out.println("  >> success processing!");

		// 전체 게시물 개수 가져옴
		int totalCount = findDAO.countFindList();
		
		model.addAttribute("findList", findList);
		model.addAttribute("totalCount", totalCount);
		return "/find/findListForm";
	}
	
	// 국가 별 조건 리스트 검색
	@RequestMapping("/findSearchListForm.go")
	public String findSearchListForm(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findSearchListForm!");

		// 검색 리스트 출력할 List 가져옴
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		List<FindVO> findList = findDAO.selectSearchFindList(findVO);
		System.out.println("  >> success processing!");

		// 전체 게시물 개수 가져옴
		int totalCount = findDAO.countFindList();
		
		model.addAttribute("findList", findList);
		model.addAttribute("totalCount", totalCount);
		return "/find/findListForm";
	}
}
