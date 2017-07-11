package com.traveler.controller;

import java.io.File;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.traveler.dao.PlanDAO;
import com.traveler.model.PlanVO;

@Controller
@RequestMapping("/plan")
public class PlanController {

	@Autowired
	SqlSession sqlSession;

	// All List Form
	@RequestMapping("/myPlanList.go")
	public String myPlanList(PlanVO planVO, Model model, Principal principal) throws Exception {
		System.out.println("[system] access myPlanList!");

		// session ID 가져오기
		String sessionID = principal.getName();
		planVO.setPlan_writer(sessionID);

		// 리스트 가져오기
		PlanDAO planDAO = sqlSession.getMapper(PlanDAO.class);
		List<PlanVO> planListAll = planDAO.getListAll(planVO);

		// 첫번째 이미지 1개만 저장 (미리보기)
		for(int i = 0; i < planListAll.size(); i++){
			StringTokenizer tokenizer_img = new StringTokenizer(planListAll.get(i).getPlan_img(), ",");
			planListAll.get(i).setPlan_img(tokenizer_img.nextToken());
		}
		
		model.addAttribute("planListAll", planListAll);
		return "/plan/myPlanList";
	}

	// Insert
	@RequestMapping("/myPlanInsertForm.go")
	public String myPlanInsertForm() throws Exception {
		System.out.println("[system] access myPlanInsertForm!");

		return "/plan/myPlanInsertForm";
	}

	@RequestMapping("/myPlanInsertPro.go")
	public String myPlanInsertPro(MultipartHttpServletRequest mhsq, PlanVO planVO_in, Principal principal) throws Exception {
		System.out.println("[system] access myPlanInsertPro!");
		
		// 넘어온 파일을 리스트로 저장
        List<MultipartFile> mf = mhsq.getFiles("imgFile");
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
             
        } else {
            for (int i = 0; i < mf.size(); i++) {
            	// 서버에 이미지 저장 경로
        		String savePath = mhsq.getRealPath("/resources/images/plan_img");
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
        		try {
	        		if(planVO_in.getPlan_img() == null || planVO_in.getPlan_img().equals("")){
	        			planVO_in.setPlan_img(rename);
	        		} else{
	        			planVO_in.setPlan_img(planVO_in.getPlan_img() + "," + rename);
	        		}
        		} catch (Exception e) {
        			planVO_in.setPlan_img(rename);
				}
            }
        }

		// session ID 가져오기
		String sessionID = principal.getName();
		planVO_in.setPlan_writer(sessionID);

		// insert
		boolean check = false;
		PlanDAO planDAO = sqlSession.getMapper(PlanDAO.class);
		if (planDAO.insertList(planVO_in) > 0) {
			check = true;
			System.out.println(" >> success Process (" + check + ")");
		}

		return "redirect:myPlanList.go";
	}

	// Update
	@RequestMapping("/myPlanUpdateForm.go")
	public String myPlanUpdateForm(PlanVO planVO_in, Principal principal, Model model) throws Exception {
		System.out.println("[system] access myPlanUpdateForm!");

		// session ID 가져오기
		String sessionID = principal.getName();
		planVO_in.setPlan_writer(sessionID);
		
		// 특정한 정보 가져오기
		PlanDAO planDAO = sqlSession.getMapper(PlanDAO.class);
		PlanVO planVO = planDAO.getDetailInfo(planVO_in);
		
		PlanVO planVO_result; // 리스트에 담을 VO
		List<PlanVO> planList = new ArrayList<PlanVO>(); // 전체 리스트 VO
		StringTokenizer tokenizer_subTitle = new StringTokenizer(planVO.getPlan_subTitle(), ",");
		StringTokenizer tokenizer_img = new StringTokenizer(planVO.getPlan_img(), ",");
		StringTokenizer tokenizer_content = new StringTokenizer(planVO.getPlan_content(), ",");
		StringTokenizer tokenizer_place = new StringTokenizer(planVO.getPlan_place(), ",");
		StringTokenizer tokenizer_date = new StringTokenizer(planVO.getPlan_date(), ",");
		
		for(int i =0; i < planVO.getPlan_count(); i++){
			System.out.println(planVO.toString());
			String subTitle = tokenizer_subTitle.nextToken();
			String img = tokenizer_img.nextToken();
			String content = tokenizer_content.nextToken();
			String place = tokenizer_place.nextToken();
			String date = tokenizer_date.nextToken();
			
			planVO_result = new PlanVO();
			planVO_result.setPlan_subTitle(subTitle);
			planVO_result.setPlan_img(img);
			planVO_result.setPlan_content(content);
			planVO_result.setPlan_place(place);
			planVO_result.setPlan_date(date);
			
			planList.add(planVO_result);
		}
		
		model.addAttribute("planList", planList);
		model.addAttribute("planVO", planVO);
		return "/plan/myPlanUpdateForm";
	}

	@RequestMapping("/myPlanUpdatePro.go")
	public String myPlanUpdatePro(MultipartHttpServletRequest mhsq, PlanVO planVO_in, Principal principal) throws Exception {
		System.out.println("[system] access myPlanUpdatePro!");

		// 넘어온 파일을 리스트로 저장
        List<MultipartFile> mf = mhsq.getFiles("imgFile");
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
             
        } else {
            for (int i = 0; i < mf.size(); i++) {
            	// 서버에 이미지 저장 경로
        		String savePath = mhsq.getRealPath("/resources/images/plan_img");
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
        		try {
	        		if(planVO_in.getPlan_img() == null || planVO_in.getPlan_img().equals("")){
	        			planVO_in.setPlan_img(rename);
	        		} else{
	        			planVO_in.setPlan_img(planVO_in.getPlan_img() + "," + rename);
	        		}
        		} catch (Exception e) {
        			planVO_in.setPlan_img(rename);
				}
            }
        }

		// session ID 가져오기
		String sessionID = principal.getName();
		planVO_in.setPlan_writer(sessionID);

		// update
		boolean check = false;
		PlanDAO planDAO = sqlSession.getMapper(PlanDAO.class);
		if (planDAO.updateList(planVO_in) > 0) {
			check = true;
			System.out.println(" >> success Process (" + check + ")");
		}

		return "redirect:myPlanList.go";
	}

	// Delete
	@RequestMapping("/myPlanDeletePro.go")
	public String myPlanDeletePro(PlanVO planVO_in, Principal principal) throws Exception {
		System.out.println("[system] access myPlanDeletePro!");

		// session ID 가져오기
		String sessionID = principal.getName();
		planVO_in.setPlan_writer(sessionID);

		// delete
		boolean check = false;
		PlanDAO planDAO = sqlSession.getMapper(PlanDAO.class);
		if (planDAO.deleteList(planVO_in) > 0) {
			check = true;
			System.out.println(" >> success Process (" + check + ")");
		}

		return "redirect:myPlanList.go";
	}

	// Detail Form
	@RequestMapping("/myPlanDetailForm.go")
	public String myPlanDetailForm(PlanVO planVO_in, Model model, Principal principal) throws Exception {
		System.out.println("[system] access myPlanDetailForm!");

		// session ID 가져오기
		String sessionID = principal.getName();
		planVO_in.setPlan_writer(sessionID);
		
		// 특정한 정보 가져오기
		PlanDAO planDAO = sqlSession.getMapper(PlanDAO.class);
		PlanVO planVO = planDAO.getDetailInfo(planVO_in);
		
		PlanVO planVO_result; // 리스트에 담을 VO
		List<PlanVO> planList = new ArrayList<PlanVO>(); // 전체 리스트 VO
		StringTokenizer tokenizer_subTitle = new StringTokenizer(planVO.getPlan_subTitle(), ",");
		StringTokenizer tokenizer_img = new StringTokenizer(planVO.getPlan_img(), ",");
		StringTokenizer tokenizer_content = new StringTokenizer(planVO.getPlan_content(), ",");
		StringTokenizer tokenizer_place = new StringTokenizer(planVO.getPlan_place(), ",");
		StringTokenizer tokenizer_date = new StringTokenizer(planVO.getPlan_date(), ",");
		
		for(int i =0; i < planVO.getPlan_count(); i++){
			System.out.println(planVO.toString());
			String subTitle = tokenizer_subTitle.nextToken();
			String img = tokenizer_img.nextToken();
			String content = tokenizer_content.nextToken();
			String place = tokenizer_place.nextToken();
			String date = tokenizer_date.nextToken();
			
			planVO_result = new PlanVO();
			planVO_result.setPlan_subTitle(subTitle);
			planVO_result.setPlan_img(img);
			planVO_result.setPlan_content(content);
			planVO_result.setPlan_place(place);
			planVO_result.setPlan_date(date);
			
			planList.add(planVO_result);
		}
		
		model.addAttribute("planList", planList);
		model.addAttribute("planVO", planVO);
		return "/plan/myPlanDetailForm";
	}
	
}
