package com.traveler.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.traveler.commons.Commons;
import com.traveler.commons.Commons_sort;
import com.traveler.dao.HashTagDAO;
import com.traveler.dao.PackageDAO;

import com.traveler.model.FindVO;
import com.traveler.model.HashTagVO;
import com.traveler.model.PackageVO;
import com.traveler.model.PagingVO;

import com.traveler.dao.ReviewDAO;

import com.traveler.model.ReviewVO;


@Controller
@RequestMapping("/package")
public class PackageController {
	
	@Autowired
	SqlSession sqlSession;
	
	
	//패키지 전체 목록 띄워주기
	@RequestMapping("getAllPackage.go")
	public String getAllpackage(Model model, Principal principal, PagingVO pagingVO) throws Exception{
		
		System.out.println("전체 목록 띄워주는 컨트롤러 진입");
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		/*if(principal.getName() != null){
		String user = principal.getName();
		reviewUpdateInit(user);
		}*/
		//전체 패키지 목록
		
		//패키지 전체 갯수
		int countPackage = packageDAO.countTotalPackage();
		final int COUNT_PER_PAGE = 9; // 한페이지당 게시글 개수
		pagingVO.setCountBoardPerPage(COUNT_PER_PAGE);
		pagingVO.setTotalCount(countPackage);
		pagingVO = new Commons().processPaging(pagingVO); // 페이징 연산
		
		// 가이드 찾기 전체 List 가져옴
		PackageVO packageVO = new PackageVO();
		packageVO.setCountBoardPerPage(pagingVO.getCountBoardPerPage());
		packageVO.setStartBoardNum(pagingVO.getStartBoardNum());
		
		List<PackageVO> list = packageDAO.selectPackageListAllPaging(packageVO);
		for(int i=0; i<list.size(); i++){
			int checkResult = reviewDAO.checkCountReview(list.get(i).getPackage_pk());
			if(checkResult > 0){
				list.get(i).setReview_avg(reviewDAO.getAvgScore(list.get(i).getPackage_pk()));
			}
		}
		System.out.println("  >> success processing!");
		

		// 전체 게시판에서 가져옴
		pagingVO.setState("listAll");

		model.addAttribute("list", list);
		model.addAttribute("count", countPackage);
		model.addAttribute("pagingVO", pagingVO);
		
		return "/package/getListForm";
	}
	
	//패키지 등록하기 폼
	@RequestMapping("insertPackageForm.go")
	public String insertPackageForm(Model model, Principal principal) throws Exception{
		System.out.println("insertPackageForm 컨트롤러 진입");
		
		HashTagDAO hashTagDAO = sqlSession.getMapper(HashTagDAO.class);
		
		//DB에 등록되어있는 해시태그들과 해당 태그 포함된 게시글 몇 개인지 담아서 넘기기
		HashMap<String, Integer> list = new HashMap<String, Integer>();
		
		for(int i = 0 ; i <hashTagDAO.getHashTag().size(); i++){
			String tag= hashTagDAO.getHashTag().get(i).getHashTag_tag();
			
			list.put(tag, hashTagDAO.getCount(tag) );
		}
		
		model.addAttribute("tagList", list);
		//model.addAttribute(attributeValue);
		model.addAttribute("sessionId", principal.getName());
		
		
		return "/package/insertPackageForm";
	}
	
	@RequestMapping("insertPackagePro.go")
	public String insertPackage(HttpServletRequest request,PackageVO packageVO, @RequestParam("imgFile") MultipartFile imgFile, Model model) throws Exception{
		System.out.println("package 인서트 컨트롤러 진입");
		
		//이미지 rename시 붙일 업로드 날짜 정보
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
        String now = (new SimpleDateFormat("yyMMdd-HH-mm-ss").format(date));

		
		// 서버에 이미지 저장
	    String savePath = request.getRealPath("/resources/images/package_img"); // 파일이 저장될 프로젝트 안의 폴더 경로
	   System.out.println("savePath"+savePath);
	    String originalFilename = imgFile.getOriginalFilename(); // fileName.jpg
	    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
	    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
	    
	    String rename = onlyFileName +"_"+now+extension; // fileName_20150721-14-07-50.jpg
	    String fullPath = savePath + "/" + rename;
	    if (!imgFile.isEmpty()) {
	        try {
	            byte[] bytes = imgFile.getBytes();
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
	            stream.write(bytes);
	            stream.close();
	        } catch (Exception e) {
	        }
	    }
	    
	    // 이미지 복사
	    String saveLocalPath = "C:/git/traveler/traveler_project/src/main/webapp/resources/images/package_img";
	    imgCopy(fullPath, saveLocalPath, rename);
	    
	    // 이미지 이름 셋팅
	    packageVO.setPackage_image(rename);
		
		boolean check = false;
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		if(packageDAO.insertPackage(packageVO) > 0){
			check=true;
		}
		
		//해시태그
		splitHashTag(packageVO.getPackage_tag());
		
		return "redirect:getAllPackage.go";
	}
	
	/*해시태그로 검색한 리스트*/
	@RequestMapping("packageSearchListForm.go")
	public String packageSearchListForm(Model model, PackageVO packageVO, PagingVO pagingVO) throws Exception{
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		System.out.println(packageVO.getPackage_place1());
		System.out.println(packageVO.getSearch());
		
		if(packageVO.getPackage_place1()=="전체"){
			packageVO.setPackage_place1(null);
		}
		
		// 전체 게시물 개수 가져옴
		int totalCount = packageDAO.countsearchAsTag(packageVO);
		final int COUNT_PER_PAGE = 9; // 한페이지당 게시글 개수
		pagingVO.setCountBoardPerPage(COUNT_PER_PAGE);
		pagingVO.setTotalCount(totalCount);
		pagingVO = new Commons().processPaging(pagingVO); // 페이징 연산

		// 국가 별 리스트 출력할 List 가져옴
		packageVO.setCountBoardPerPage(pagingVO.getCountBoardPerPage());
		packageVO.setStartBoardNum(pagingVO.getStartBoardNum());
		List<PackageVO> searchList = packageDAO.searchAsTag(packageVO);
		
		for(int i=0; i<searchList.size(); i++){
			int checkResult = reviewDAO.checkCountReview(searchList.get(i).getPackage_pk());
			if(checkResult > 0){
				searchList.get(i).setReview_avg(reviewDAO.getAvgScore(searchList.get(i).getPackage_pk()));
			}
		}
		System.out.println("  >> success processing!");

		// 검색 게시판에서 가져옴
		pagingVO.setState("listSearchAll");
		
		model.addAttribute("list", searchList);
		model.addAttribute("count", totalCount);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("packageVO", packageVO);
		
		
		return "/package/getListForm";
		
	}
	
	
	/*나라별 패키지 리스트*/
	@RequestMapping("packageCountryListForm.go")
	public String packageCountryListForm (Model model, PackageVO packageVO, PagingVO pagingVO) throws Exception{
		
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		
		// 전체 게시물 개수 가져옴
		int totalCount = packageDAO.countContryPackage(packageVO);
		final int COUNT_PER_PAGE = 9; // 한페이지당 게시글 개수
		pagingVO.setCountBoardPerPage(COUNT_PER_PAGE);
		pagingVO.setTotalCount(totalCount);
		pagingVO = new Commons().processPaging(pagingVO); // 페이징 연산

		// 국가 별 리스트 출력할 List 가져옴
		packageVO.setCountBoardPerPage(pagingVO.getCountBoardPerPage());
		packageVO.setStartBoardNum(pagingVO.getStartBoardNum());
		List<PackageVO> searchList = packageDAO.searchPackage(packageVO);
		for(int i=0; i<searchList.size(); i++){
			int checkResult = reviewDAO.checkCountReview(searchList.get(i).getPackage_pk());
			if(checkResult > 0){
				searchList.get(i).setReview_avg(reviewDAO.getAvgScore(searchList.get(i).getPackage_pk()));
			}
		}
		System.out.println("  >> success processing!");

		// 나라 게시판에서 가져옴
		pagingVO.setState("listCountryAll");
		model.addAttribute("list", searchList);
		model.addAttribute("count", totalCount);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("packageVO", packageVO);
		
		
		return "/package/getListForm";
	}
	
	//패키지 상세보기
	@RequestMapping("packageDetailForm.go")
	public String packageDetailForm (Model model, PackageVO packageVO, HttpSession session, Principal principal) throws Exception{
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		HashTagDAO hashTagDAO = sqlSession.getMapper(HashTagDAO.class);
		
		PackageVO detailPackage = packageDAO.selectPackage(packageVO);
		

		ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
		List<ReviewVO> reviewList = reviewDAO.getReviewList(packageVO.getPackage_pk());
		String user = "";
		if(principal != null){
		user = principal.getName();
		}
		//조회수 증가
		boolean check = false;
		PackageVO packageVO_hit = new PackageVO();
		packageVO_hit.setPackage_pk(packageVO.getPackage_pk());
		
		try{
			if((int)session.getAttribute("view_check") == packageVO.getPackage_pk()){
				// 새로고침 했을때는 그대로 값유지
				packageVO_hit.setPackage_hit(detailPackage.getPackage_hit());
			}/*else if(packageVO.getPackage_status()==0){
				// admin단에서 접속했을 때도 그대로 값 유지
				packageVO_hit.setPackage_hit(detailPackage.getPackage_hit());
			}*/else{
			packageVO_hit.setPackage_hit(detailPackage.getPackage_hit()+1);
			}
		} catch (Exception e) {
			packageVO_hit.setPackage_hit(detailPackage.getPackage_hit()+1);
		} finally{
			if(packageDAO.updatePackage(packageVO_hit) > 0){
				// 성공
				check = true;
				session.setAttribute("view_check", packageVO.getPackage_pk());
			}
		}

		
		///////////////유사 패키지/////////////////////////////
		//리뷰 평점 체크
		int checkResult = reviewDAO.checkCountReview(packageVO.getPackage_pk());
		//리뷰가 있다면 평점구하기
		if(checkResult > 0){
			detailPackage.setReview_avg(reviewDAO.getAvgScore(packageVO.getPackage_pk()));
		}
		//같은 해시태그인 상품들 리스트 넘겨주기
		
		//db에 저장된 태그들을 하나씩 스플릿함
		String[] tags=splitHashTag(detailPackage.getPackage_tag());
		//ArrayList에 태그 적용된 상품pk를 저장(중복 허용해서 저장.. 그래야 나중에 몇 개 겹치는지 알 수 있으니까)
		ArrayList<Integer> pk = new ArrayList<Integer>();

		for(int i = 0 ; i <tags.length; i++){
			for(int j = 0 ; j <hashTagDAO.getCount(tags[i]); j++){
				int get_pk = packageDAO.getSimillar(tags[i]).get(j).getPackage_pk();
				pk.add(get_pk);
			}//in for
		}//out for
		
		//오름차순으로 정렬하고
		Commons_sort ascending = new Commons_sort();
        Collections.sort(pk, ascending);
        
        //바로 뒤 값이랑 비교해서 중복되면 count++해주고, 그걸 다시 map에 담는다
        //key 값이 package_pk 고, value값이 겹치는 해시태그 갯수
        HashMap<Integer, Integer> map = new HashMap<>();
    
        int pknum=(int) pk.get(0);
        int count=1;
        
        
        for(int i=0; i<pk.size(); i++){
        	if(pk.size()==1){//겹치는 애가 없는 것(자기 자신은 무조건 있어서 사이즈 1)
        		map.put(pknum, 1);
        	}else if(i!=pk.size()-1){
	        	if(pk.get(i).equals(pk.get(i+1))){
	        		count++;
	        	}else if(!pk.get(i).equals(pk.get(i+1))){
	        		map.put(pknum, count);
	        		count=1;
	        		pknum=(int)pk.get(i+1);
	        	}
        	}else{//마지막요소일때
        		if(pk.get(i).equals(pk.get(i-1))){
        			map.put(pknum, count);
        		} else{
        			pknum=(int)pk.get(i);
        			map.put(pknum, 1);
        		}
        	}//else end
        }//for end
	       
	        //view페이지에 넘겨주기 위해..
	        PackageVO sim_pack1=new PackageVO();
	        PackageVO sim_pack2=new PackageVO();
	        PackageVO sim_pack3=new PackageVO();
	       
	        //map의 value값으로 내림차순 정렬해서 list에 담기(가장 많이 겹치는 애부터 뽑아야하니까..)
	        Iterator it = Commons_sort.sortByValue(map).iterator();
	        List list = new ArrayList<>();
	        
	        while(it.hasNext()){
	        	int temp = (int) it.next();
	        	list.add(temp);
	        }
	        
	        //자기 자신 지우기
	        if(list.size()==1){
	        	list.remove(0);
	        }
	        
	        if(list.size()==0){
	        	sim_pack1=null;
	        	sim_pack2=null;
	        	sim_pack3=null;
	        	
	        }else if(list.size()==1){
	        	sim_pack1.setPackage_pk((int) list.get(0));
	        	sim_pack1=packageDAO.selectPackage(sim_pack1);
	        	sim_pack2=null;
	        	sim_pack3=null;
	        }else if(list.size()==2){
	        	sim_pack1.setPackage_pk((int) list.get(0));
	        	sim_pack1=packageDAO.selectPackage(sim_pack1);
	        	sim_pack2.setPackage_pk((int) list.get(1));
	        	sim_pack2=packageDAO.selectPackage(sim_pack2);
	        	sim_pack3=null;
	        
	        }else{
	        	sim_pack1.setPackage_pk((int) list.get(0));
	        	sim_pack1=packageDAO.selectPackage(sim_pack1);
	        	sim_pack2.setPackage_pk((int) list.get(1));
	        	sim_pack2=packageDAO.selectPackage(sim_pack2);
	        	sim_pack3.setPackage_pk((int) list.get(2));
	        	sim_pack3=packageDAO.selectPackage(sim_pack3);
	        	
	        }
		
			model.addAttribute("sim_pack1", sim_pack1);
			model.addAttribute("sim_pack2", sim_pack2);
			model.addAttribute("sim_pack3", sim_pack3);
			model.addAttribute("packageVO", detailPackage);
			model.addAttribute("rlist", reviewList);
			model.addAttribute("user", user);
		
		return "/package/packageDetailForm";
	}
	
	//패키지 삭제
	@RequestMapping("packageDeletePro.go")
	public String packageDeletePro (PackageVO packageVO) throws Exception{
		System.out.println("패키지 삭제 PRO 컨트롤러");
		System.out.println(packageVO.getPackage_pk());
		System.out.println("-------------");
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		
		packageDAO.deletePackage(packageVO);
		
		
		return "redirect:getAllPackage.go";
	}
	
	//패키지 수정 폼
	@RequestMapping("updatePackageForm.go")
	public String updatePackageForm (Model model, PackageVO packageVO) throws Exception{
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		HashTagDAO hashTagDAO = sqlSession.getMapper(HashTagDAO.class);
		
		PackageVO detailPackage = packageDAO.selectPackage(packageVO);
		
		//DB에 등록되어있는 해시태그들과 해당 태그 포함된 게시글 몇 개인지 담아서 넘기기
		HashMap<String, Integer> list = new HashMap<String, Integer>();
		
		for(int i = 0 ; i <hashTagDAO.getHashTag().size(); i++){
			String tag= hashTagDAO.getHashTag().get(i).getHashTag_tag();
			
			list.put(tag, hashTagDAO.getCount(tag) );
		}
		
		model.addAttribute("tagList", list);
		model.addAttribute("packageVO", detailPackage);
		
		
		return "/package/updatePackageForm";
	}
	
	//패키지 수정 프로
	@RequestMapping("updatePackagePro.go")
	public String updatePackagePro (PackageVO packageVO) throws Exception{
		PackageDAO packageDAO = sqlSession.getMapper(PackageDAO.class);
		packageDAO.updatePackage(packageVO);
		
		return "redirect:packageDetailForm.go?package_pk="+packageVO.getPackage_pk();
	}
	
	
	// 이미지 복사
		public void imgCopy(String inputFullPath ,String outputImgPath, String img_name) throws Exception{
			
			String fullPath = outputImgPath + "/" + img_name;
			
			FileInputStream fis = null;
			FileOutputStream fos = null;

			try {
				fis = new FileInputStream(inputFullPath); // 원본파일
				fos = new FileOutputStream(fullPath); // 복사위치

				byte[] buffer = new byte[1024];
				int readcount = 0;

				while ((readcount = fis.read(buffer)) != -1) {
					fos.write(buffer, 0, readcount); // 파일 복사
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				fis.close();
				fos.close();
			}
		}
		
		//해시태그 토크나이저 해서 리스트로 정리해서 나누기
		public String[] splitHashTag(String in_hashTag) throws Exception{
			HashTagDAO hashTagDAO = sqlSession.getMapper(HashTagDAO.class);
			
			//스플릿로 끊어서 배열로 담기
			String[] tagList ;
			
			tagList = in_hashTag.split(",");
			
			
			//이미 있는 해시태그인지 비교
			HashTagVO vo = new HashTagVO();
			
			for(int i =0 ; i <tagList.length ; i++){
				vo.setHashTag_tag(tagList[i]);
				int result = hashTagDAO.getSpecificHashTag(vo);
				if(result==0){//db에 없는 값이라면
					System.out.println("없는 값="+tagList[i]);
					hashTagDAO.insertHashTag(tagList[i]);
				}
			}//for end
			
			return tagList;
					
			
		}
		
		//udate_check를 매번 초기화 해줌.
		public void reviewUpdateInit(String user)throws Exception{
			ReviewDAO reviewDAO = sqlSession.getMapper(ReviewDAO.class);
			int result = 0;
			result = reviewDAO.checkReview(user);
			if(result == 1){
				reviewDAO.reviewUpdateInit(user);
			}
			
		}
	
}
		
