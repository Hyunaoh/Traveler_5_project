package com.traveler.controller;

import java.security.Principal;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.dao.GroupNoticeDAO;
import com.traveler.model.GroupNoticeVO;

@Controller
@RequestMapping("/group_notice/")
public class GroupNoticeController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("group_notice_insert.go")
	public String group_notice_insert(GroupNoticeVO groupNoticeVO) throws Exception{
		System.out.println("access group_notice_insert!");
		
		boolean check = false;
		GroupNoticeDAO groupNoticeDAO =sqlSession.getMapper(GroupNoticeDAO.class);
		if( groupNoticeDAO.insert(groupNoticeVO) > 0 ) {
			check = true;
		}
		
		System.out.println(" >> proccess result : " + check);
		return "redirect:../group/groupDetailForm.go?group_pak_pk="+groupNoticeVO.getGroup_notice_parent_pk();
	}
	
	@RequestMapping("group_notice_update.go")
	public String group_notice_update(GroupNoticeVO groupNoticeVO, Principal principal) throws Exception{
		System.out.println("access group_notice_update!");
		
		groupNoticeVO.setGroup_notice_writer(principal.getName());
		boolean check = false;
		GroupNoticeDAO groupNoticeDAO =sqlSession.getMapper(GroupNoticeDAO.class);
		if( groupNoticeDAO.update(groupNoticeVO) > 0 ) {
			check = true;
		}
		
		System.out.println(" >> proccess result : " + check);
		return "redirect:../group/groupDetailForm.go?group_pak_pk="+groupNoticeVO.getGroup_notice_parent_pk();
	}
	
	@RequestMapping("group_notice_delete.go")
	public String group_notice_delete(GroupNoticeVO groupNoticeVO, Principal principal) throws Exception{
		System.out.println("access group_notice_delete!");

		groupNoticeVO.setGroup_notice_writer(principal.getName());
		boolean check = false;
		GroupNoticeDAO groupNoticeDAO =sqlSession.getMapper(GroupNoticeDAO.class);
		if( groupNoticeDAO.delete(groupNoticeVO) > 0 ) {
			check = true;
		}
		
		System.out.println(" >> proccess result : " + check);
		return "redirect:../group/groupDetailForm.go?group_pak_pk="+groupNoticeVO.getGroup_notice_parent_pk();
	}
}
