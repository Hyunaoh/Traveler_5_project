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

	// 가이드 찾기 리스트목록
	@RequestMapping("/findListForm.go")
	public String findListForm(Model model) throws Exception {
		System.out.println("[system] access findListForm!");

		// 모든 리스트 출력할 List 가져옴
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		List<FindVO> findList = findDAO.selectFindListAll();
		System.out.println("  >> success processing!");

		// �쟾泥� 寃뚯떆臾� 媛쒖닔 媛��졇�샂
		int totalCount = findDAO.countFindList();
		
		model.addAttribute("findList", findList);
		model.addAttribute("totalCount", totalCount);
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
		return "/find/findResult";
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
		return "/find/findResult";
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
		return "/find/findResult";
	}

	// 媛��씠�뱶 李얘린 �옄�꽭�븳 �젙蹂� Form
	@Transactional
	@RequestMapping("/findDetailForm.go")
	public String findDetailForm(Model model, FindVO findVO_in, HttpSession session) throws Exception {
		System.out.println("[system] access findDetailForm!");

		// �듅�젙�븳 湲��쓽 �젙蹂� VO �븯�굹瑜� 媛��졇�샂
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		FindVO findVO_out = findDAO.selectFindInfo(findVO_in);
		System.out.println("  >> success processing! (select)");
		
		// 議고쉶�닔 利앷��
		boolean check = false;
		FindVO findVO_view = new FindVO();
		findVO_view.setFind_pk(findVO_in.getFind_pk());
		try {
			if((int)session.getAttribute("view_check") == findVO_in.getFind_pk()){
				// �깉濡쒓퀬移� �뻽�쓣�븣�뒗 洹몃��濡� 媛믪쑀吏�
				findVO_view.setFind_hit(findVO_out.getFind_hit());
			} else{
				findVO_view.setFind_hit(findVO_out.getFind_hit() + 1);
			}
		} catch (Exception e) {
			findVO_view.setFind_hit(findVO_out.getFind_hit() + 1);
		} finally {
			if(findDAO.updateFindInfo(findVO_view) > 0){
				// �꽦怨�
				check = true;
				session.setAttribute("view_check", findVO_in.getFind_pk());
			}
			System.out.println("  >> Increase View Processing Result : " + check);
		}
		
		model.addAttribute("findVO", findVO_out);
		return "/find/findDetailForm";
	}
	
	// 援�媛� 蹂� 議곌굔 由ъ뒪�듃 寃��깋
	@RequestMapping("/findCountryListForm.go")
	public String findCountryListForm(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findCountryListForm!");

		// 援�媛� 蹂� 由ъ뒪�듃 異쒕젰�븷 List 媛��졇�샂
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		List<FindVO> findList = findDAO.selectCountryFindList(findVO);
		System.out.println("  >> success processing!");

		// �쟾泥� 寃뚯떆臾� 媛쒖닔 媛��졇�샂
		int totalCount = findDAO.countFindList();
		
		model.addAttribute("findList", findList);
		model.addAttribute("totalCount", totalCount);
		return "/find/findListForm";
	}
	
	// 援�媛� 蹂� 議곌굔 由ъ뒪�듃 寃��깋
	@RequestMapping("/findSearchListForm.go")
	public String findSearchListForm(Model model, FindVO findVO) throws Exception {
		System.out.println("[system] access findSearchListForm!");

		// 寃��깋 由ъ뒪�듃 異쒕젰�븷 List 媛��졇�샂
		FindDAO findDAO = sqlSession.getMapper(FindDAO.class);
		List<FindVO> findList = findDAO.selectSearchFindList(findVO);
		System.out.println("  >> success processing!");

		// �쟾泥� 寃뚯떆臾� 媛쒖닔 媛��졇�샂
		int totalCount = findDAO.countFindList();
		
		model.addAttribute("findList", findList);
		model.addAttribute("totalCount", totalCount);
		return "/find/findListForm";
	}
}
