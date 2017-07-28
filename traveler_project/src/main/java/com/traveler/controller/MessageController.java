package com.traveler.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.glass.ui.Application;
import com.traveler.dao.MemberDAO;
import com.traveler.dao.MessageDAO;
import com.traveler.model.MemberVO;
import com.traveler.model.MessageVO;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

/**
 * 쪽지함 (2017.06.27)
 * 
 * @author OHHYUNA
 *
 */

@Controller
@RequestMapping(value = "/message")
public class MessageController {

	@Autowired
	SqlSession sqlSession;

	static int count;

	@RequestMapping("/messageListView.go")
	public String messageListView(Model model, Principal pr) throws Exception {

		MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);
		MessageVO mVo = new MessageVO();
		
		/**
		 * 
		 * 받은/보낸사람 쪽지 개수 구하기
		 */

		// 해당 아이디 보낸사람 개수
		mVo.setMessage_send(pr.getName());
		int messageSend_total = mDao.countMessage(mVo);

		// 해당 아이디 받은사람 개수
		mVo.setMessage_send(null);
		mVo.setMessage_get(pr.getName());

		int messageGet_total = mDao.countMessage(mVo);

		model.addAttribute("messageGet_total", messageGet_total);
		model.addAttribute("messageSend_total", messageSend_total);

		return "/message/messageListView";
	}

	// 메세지 alert 창
	@RequestMapping("/alarm_view.go")
	public String alarm_view(Model model, HttpServletRequest request) {

		String msg = request.getParameter("msg");

		System.out.println("alert에 띄울 메세지 내용 : " + msg);
		// alert 창이 뜨기전, 그 안에 msg에 해당하는 객체를 model에 add해준다.

		model.addAttribute("msg", msg);
		return "/message/alarm_view";
	}

	// 메세지 작성 프로세스
	@ResponseBody
	@RequestMapping(value = "/messageWriteAjax.go", method = RequestMethod.POST)
	public int messageWritePro(@RequestBody MessageVO mVo, Principal principal, boolean chk_all) throws Exception {

		System.out.println("메세지 작성 Ajax실행");

		System.out.println("전체 쪽지 여부 : " + chk_all);

		MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);

		int insertRes = mDao.insertMessage(mVo);
		System.out.println("메세지 insert 여부 : " + insertRes);

		return insertRes;
	}

	// 메세지 쓰는함 View
	@ResponseBody
	@RequestMapping(value = "/messageWriteView.go", method = RequestMethod.POST)
	public List<MemberVO> messageWritePro() throws Exception {

		System.out.println("member List 뽑아오는 ajax 실행");

		MemberDAO memDao = sqlSession.getMapper(MemberDAO.class);

		List<MemberVO> mList = memDao.selectAllMember();

		return mList;

	}

	// 알람을 위한 메세지 alarm
	@ResponseBody
	@RequestMapping(value = "/messageAlarmAjax.go", method = RequestMethod.GET)
	public MessageVO messageAlarmAjax(Principal pr, Model model) {

		// 초기 flag는 false로 초기화 한다.

		MessageVO mVo = new MessageVO();
		if (pr != null) {
			mVo.setMessage_get(pr.getName());

			// 현재 쪽지 개수
			int count;

			MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);

			List<MessageVO> mList = mDao.selectByIdMessage(mVo);

			// 받은 메세지함일 경우
			if (mVo.getMessage_get() != null) {
				// 받은 메세지의 크기만큼을 count에 저장한 후,
				count = mList.size();
				// 저장한 count 값이 증가하게 되면 alert 창을 띄운다.

				// this.count 가 0일 경우, 현재 count값을 넣어준다.

				if (this.count == 0) {
					this.count = count;
				} else if (this.count < count) {
					System.out.println("=====================================");
					System.out.println(this.count + "개의 메세지가 " + count + "개로 변화하였습니다.");

					String send = mList.get(0).getMessage_send();
					String msg = mList.get(0).getMessage_message();

					System.out.println("보낸아이디 : " + send + " / 메세지 내용 : " + msg);

					this.count = count;

					return mList.get(0);
				}

			}
		}

		return null;
	}

	// 메세지 리스트의 Ajax
	@ResponseBody
	@RequestMapping("/messageViewAjax.go")
	public List<MessageVO> messageGetViewAjax(Model model, @RequestBody MessageVO mVo, Principal principal)
			throws Exception {

		System.out.println("보낸/받은 메세지함 Ajax실행");

		MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);

		List<MessageVO> mList = mDao.selectByIdMessage(mVo);

		return mList;
	}

	@ResponseBody
	@RequestMapping("/messageGetDeleteAjax.go")
	public int deleteGetMessage(Model model, @RequestBody MessageVO mVo, Principal principal) throws Exception {

		System.out.println("받은 메세지 삭제 Ajax실행");

		MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);
		
		System.out.println("시퀀스 넘버 : " + mVo.getMessage_seq());

		int res = mDao.deleteGetMessage(mVo);
		
		System.out.println("삭제여부 : " + res);

		return res;
	}

	@ResponseBody
	@RequestMapping("/messageSendDeleteAjax.go")
	public int deleteSendMessage(Model model, @RequestBody MessageVO mVo, Principal principal) throws Exception {

		System.out.println("보낸 메세지 삭제 Ajax실행");

		MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);

		System.out.println("시퀀스 넘버 : " + mVo.getMessage_seq());

		int res = mDao.deleteSendMessage(mVo);

		System.out.println("삭제여부 : " + res);

		return res;
	}

	// 메세지 모달창에 들어갈 내용들
	@RequestMapping("/messageGetModal.go")
	public String messageGetModal(Model model, HttpServletRequest request) {

		String message_message = request.getParameter("message_message");
		String message_date = request.getParameter("message_date");
		String message_get = request.getParameter("message_get");

		model.addAttribute("msg", message_message);
		model.addAttribute("date", message_date);
		model.addAttribute("get", message_get);

		return "message/messageGetModal";
	}
	
	// 제목을 클릭하면 팝업이 나타나는데, 이 팝업에 대한 List
	@ResponseBody
	@RequestMapping("/messagePopupView.go")
	public ArrayList<MessageVO> messagePopupView (Model model, Principal pr, @RequestBody MessageVO vo ) throws Exception {
		
		MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);
		
		System.out.println("제목을 클릭하면 팝업창이 뜹니다.");
		System.out.println("시퀀스 넘버 : " + vo.getMessage_seq());

		int res = mDao.updateReadMessage(vo);
		
		System.out.println("read 컬럽 update 결과 : " + res);
		// 아이디로 하나의 컬럼 (팝업에 표시될 쪽지내용)을 가져옴
		ArrayList<MessageVO> list = mDao.selectOneBySeq(vo);
		
		return list;
		
	}
	
	// 한 아이디에 대한 전체 목록 불러오기
	@ResponseBody
	@RequestMapping("/selectAllMessageById.go")
	public List<MessageVO> selectAllMessageById (Model model, Principal pr, @RequestBody MessageVO vo ) throws Exception {
		
		/**
		 * 
		 * 받은/보낸사람 쪽지 개수 구하기
		 */
		
		MessageVO mVo = new MessageVO();
		MessageDAO mDao = sqlSession.getMapper(MessageDAO.class);

		// 해당 아이디 보낸사람 개수
		mVo.setMessage_send(pr.getName());
		mVo.setMessage_get(null);
		int messageSend_total = mDao.countMessage(mVo);

		// 해당 아이디 받은사람 개수
		mVo.setMessage_send(null);
		mVo.setMessage_get(pr.getName());
		int messageGet_total = mDao.countMessage(mVo);

		model.addAttribute("messageGet_total", messageGet_total);
		model.addAttribute("messageSend_total", messageSend_total);
		
		// 아이디로 하나의 컬럼 (팝업에 표시될 쪽지내용)을 가져옴
		
		List<MessageVO> list = mDao.selectAllMessageById(vo);
		
		return list;
		
	}
	
	

}
