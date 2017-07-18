package com.traveler.controller;

import java.io.File;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.traveler.dao.GroupDAO;
import com.traveler.dao.GroupNoticeDAO;
import com.traveler.dao.M_groupDAO;
import com.traveler.model.GroupNoticeVO;
import com.traveler.model.GroupVO;
import com.traveler.model.M_groupVO;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/groupListForm.go")
	public String groupListForm(Model model, GroupVO groupVO) throws Exception{
		System.out.println("[system] access groupListForm! ");
		
		groupVO.setGroup_pak_status(1);
		GroupDAO groupDAO = sqlSession.getMapper(GroupDAO.class);
		List<GroupVO> groupList = groupDAO.selectAll(groupVO);
		
		model.addAttribute("groupList", groupList);
		return "group/groupListForm";
	}
	
	// 삽입
	@RequestMapping("/groupInsertForm.go")
	public String groupInsertForm(){
		System.out.println("[system] access groupInsertForm! ");
		return "group/groupInsertForm";
	}
	@RequestMapping("/groupInsertPro.go")
	public String groupInsertPro(MultipartHttpServletRequest mhsq, GroupVO groupVO, Principal principal) throws Exception{
		System.out.println("[system] access groupInsertPro! ");

		// 넘어온 파일을 리스트로 저장
        List<MultipartFile> mf = mhsq.getFiles("imgFile");
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
             
        } else {
            for (int i = 0; i < mf.size(); i++) {
            	// 서버에 이미지 저장 경로
        		String savePath = mhsq.getRealPath("/resources/images/group_img");
        		// 이미지 rename시 붙일 업로드 날짜 정보
        		Calendar calendar = Calendar.getInstance();
        		Date date = calendar.getTime();
        		String now = (new SimpleDateFormat("yyMMdd-HH-mm-ss").format(date));
        		// 이미지 이름 rename
        		String originalFilename = mf.get(i).getOriginalFilename(); // fileName.jpg
        		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
        		String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
        		String rename = onlyFileName + "_" + now + extension; // fileName_20150721-14-07-50.jpg
        		String fullPath = savePath + "/" + rename;
        		
        		// 이미지 저장
        		mf.get(i).transferTo(new File(fullPath)); // 파일 저장
	        	groupVO.setGroup_pak_photo(rename);
            }
        }
		
		// 세션 ID 가져옴
		String guide_id = principal.getName();
		groupVO.setGroup_pak_guide(guide_id);
		
		boolean check = false;
		GroupDAO groupDAO = sqlSession.getMapper(GroupDAO.class);
		if(groupDAO.insertGroup(groupVO) > 0){
			check = true;
		}
		
		System.out.println(" >> Process Result : " + check);
		return "redirect:groupListForm.go";
	}
	
	// 수정
	@RequestMapping("/groupUpdateForm.go")
	public String groupUpdateForm(Model model, GroupVO groupVO_in) throws Exception{
		System.out.println("[system] access groupUpdateForm! ");
		
		GroupDAO groupDAO = sqlSession.getMapper(GroupDAO.class);
		GroupVO groupVO_result = groupDAO.selectInfo(groupVO_in);
		
		model.addAttribute("groupVO", groupVO_result);
		return "group/groupUpdateForm";
	}
	@RequestMapping("/groupUpdatePro.go")
	public String groupUpdatePro(MultipartHttpServletRequest mhsq, GroupVO groupVO) throws Exception{
		System.out.println("[system] access groupUpdatePro! ");
		
		// 넘어온 파일을 리스트로 저장
        List<MultipartFile> mf = mhsq.getFiles("imgFile");
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
             
        } else {
            for (int i = 0; i < mf.size(); i++) {
            	// 서버에 이미지 저장 경로
        		String savePath = mhsq.getRealPath("/resources/images/group_img");
        		// 이미지 rename시 붙일 업로드 날짜 정보
        		Calendar calendar = Calendar.getInstance();
        		Date date = calendar.getTime();
        		String now = (new SimpleDateFormat("yyMMdd-HH-mm-ss").format(date));
        		// 이미지 이름 rename
        		String originalFilename = mf.get(i).getOriginalFilename(); // fileName.jpg
        		String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
        		String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
        		String rename = onlyFileName + "_" + now + extension; // fileName_20150721-14-07-50.jpg
        		String fullPath = savePath + "/" + rename;
        		
        		// 이미지 저장
        		mf.get(i).transferTo(new File(fullPath)); // 파일 저장
	        	groupVO.setGroup_pak_photo(rename);
            }
        }
		
		boolean check = false;
		GroupDAO groupDAO = sqlSession.getMapper(GroupDAO.class);
		if(groupDAO.updateGroup(groupVO) > 0){
			check = true;
		}
		System.out.println(" >> Process Result : " + check);
		
		return "redirect:groupListForm.go";
	}
	
	// 삭제
	@RequestMapping("/groupDeletePro.go")
	public String groupDeletePro(GroupVO groupVO) throws Exception{
		System.out.println("[system] access groupDeletePro! ");
		
		boolean check = false;
		GroupDAO groupDAO = sqlSession.getMapper(GroupDAO.class);
		if(groupDAO.deleteGroup(groupVO) > 0){
			check = true;
		}
		
		System.out.println(" >> Process Result : " + check);
		return "redirect:groupListForm.go";
	}
	
	// 특정한 정보
	@RequestMapping("/groupDetailForm.go")
	public String groupDetailForm(GroupVO groupVO_in, Model model) throws Exception{
		System.out.println("[system] access groupDetailForm! ");

		// 현재 인원 업데이트
		M_groupVO m_groupVO = new M_groupVO();
		m_groupVO.setGroup_mem_package_pk(groupVO_in.getGroup_pak_pk());
		M_groupDAO m_groupDAO = sqlSession.getMapper(M_groupDAO.class);
		int count = m_groupDAO.countAll(m_groupVO);
		groupVO_in.setGroup_pak_current(count);
		boolean check = false;
		GroupDAO groupDAO = sqlSession.getMapper(GroupDAO.class);
		if(groupDAO.updateGroup(groupVO_in) > 0){
			check = true;
		}
		System.out.println(" >> Process Result : " + check);
		
		// 정보 가져옴
		GroupVO groupVO_result = groupDAO.selectInfo(groupVO_in);
		
		// 추가 공지사항 리스트 가져옴
		GroupNoticeVO groupNoticeVO = new GroupNoticeVO();
		groupNoticeVO.setGroup_notice_parent_pk(groupVO_in.getGroup_pak_pk());
		GroupNoticeDAO groupNoticeDAO = sqlSession.getMapper(GroupNoticeDAO.class);
		List<GroupNoticeVO> groupNoticeList = groupNoticeDAO.selectAll(groupNoticeVO);
		System.out.println(" >> Success Get GroupNotice List");
		
		model.addAttribute("groupVO", groupVO_result);
		model.addAttribute("groupNoticeList", groupNoticeList);
		return "group/groupDetailForm";
	}
}
