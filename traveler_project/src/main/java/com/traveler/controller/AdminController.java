package com.traveler.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.commons.Commons;
import com.traveler.dao.FindDAO;
import com.traveler.dao.GroupDAO;
import com.traveler.dao.M_groupDAO;
import com.traveler.dao.MemberDAO;
import com.traveler.dao.PackageDAO;
import com.traveler.model.FindVO;
import com.traveler.model.GroupVO;
import com.traveler.model.M_groupVO;
import com.traveler.model.MemberVO;
import com.traveler.model.PackageVO;
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
	public String adminBoardForm(Model model,PagingVO pagingVO) throws Exception{
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
		return "admin/adminMemberForm";
	}

	@RequestMapping("/adminPackageForm.go")
	public String adminPackageForm(Model model) throws Exception{
		System.out.println("[system] access adminPackageForm!");
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		
		List<PackageVO> upapprovedList = packageDAO.getUnapprovedPackage();
		model.addAttribute("upapprovedlist", upapprovedList);
		
		return "admin/adminPackageForm";
	}
	
	//상품 게시글 승인 하는 Controller
	@RequestMapping("/adminPackagePro.go")
	public String adminPackagePro(Model model, PackageVO packageVO_in) throws Exception{
		System.out.println("[system] access adminPackagePro!");
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		
		PackageVO packageVO_out = new PackageVO();
		
		packageVO_out.setPackage_pk(packageVO_in.getPackage_pk());
		packageVO_out.setPackage_status(1);
		packageDAO.updatePackage(packageVO_out);
		
		return "redirect:adminPackageForm.go";
	}
	
	@RequestMapping("/adminMemberListForm.go")
	public String adminMemberListForm(Model model){
		System.out.println("[system] access adminMemberListForm!");
		MemberVO memberVO=new MemberVO();
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		
		List<MemberVO> list= memberDAO.selectAllMember();
		model.addAttribute("list", list);
		return "/admin/adminMemberList";
	}
	
	@RequestMapping("/adminMemberIsguide.go")
	public String adminMemberIsguide(Model model, MemberVO vo){
		System.out.println("[system] access adminMemberIsguide!");
		MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
		vo.toString();
		
		MemberVO memberVO= memberDAO.selectMyPage(vo);
		memberDAO.adminUpdateGuide(memberVO);
		
		return "redirect:adminMemberListForm.go";
	}
	
	@RequestMapping("/adminGroupPackageForm.go")
	public String adminGroupPackageForm(Model model) throws Exception{
		System.out.println("[system] access adminGroupPackageForm!");
		
		// 검증 안된 상품
		GroupVO groupVO1 = new GroupVO();
		groupVO1.setGroup_pak_status(0);
		GroupDAO groupDAO = sqlSession.getMapper(GroupDAO.class);
		List<GroupVO> groupList1 = groupDAO.selectAll(groupVO1);
		System.out.println(" >> success get List1");
		
		// 검증 완료된 상품
		GroupVO groupVO2 = new GroupVO();
		groupVO2.setGroup_pak_status(1);
		List<GroupVO> groupList2 = groupDAO.selectAll(groupVO2);
		System.out.println(" >> success get List2");
		
		model.addAttribute("groupList1", groupList1);
		model.addAttribute("groupList2", groupList2);
		return "admin/adminGroupPackageForm";
	}
	
	@RequestMapping("/adminGroupPackageUpdate.go")
	public String adminGroupPackageUpdate(GroupVO groupVO) throws Exception{
		System.out.println("[system] access adminGroupPackageUpdate!");
		
		boolean check = false;
		GroupDAO groupDAO = sqlSession.getMapper(GroupDAO.class);
		if( groupDAO.updateGroup(groupVO) > 0 ){
			check = true;
		}
		System.out.println(" >> proccess result : " + check + "/" + groupVO.getGroup_pak_pk());
		System.out.println(groupVO.getGroup_pak_status());
		
		return "redirect:adminGroupPackageForm.go";
	}
	@RequestMapping("/adminGroupPackageDelete.go")
	public String adminGroupPackageDelete(GroupVO groupVO) throws Exception{
		System.out.println("[system] access adminGroupPackageDelete!");
		
		boolean check = false;
		GroupDAO groupDAO = sqlSession.getMapper(GroupDAO.class);
		if( groupDAO.deleteGroup(groupVO) > 0 ){
			check = true;
		}
		
		return "redirect:adminGroupPackageForm.go";
	}
	
	@RequestMapping("/adminPayForm.go")
	public String adminPayForm(M_groupVO m_groupVO, Model model) throws Exception{
		System.out.println("[system] access adminPayForm!");
		
		// 단체 패키지 결제 안한 사람 명단
		M_groupDAO m_groupDAO = sqlSession.getMapper(M_groupDAO.class);
		List<M_groupVO> m_groupList = m_groupDAO.selectNotPayList(m_groupVO);
		
		model.addAttribute("m_groupList", m_groupList);
		return "admin/adminPayForm";
	}

	@RequestMapping("/adminPayPro.go")
	public String adminPayPro(M_groupVO m_groupVO) throws Exception{
		System.out.println("[system] access adminPayForm!");
		
		// 결제 완료
		boolean check = false;
		M_groupDAO m_groupDAO = sqlSession.getMapper(M_groupDAO.class);
		if(m_groupDAO.updatePayInfo(m_groupVO) > 0){
			check = true;
		}
		System.out.println(" >> Process Result : " + check);
		
		return "redirect:adminPayForm.go";
	}
}
