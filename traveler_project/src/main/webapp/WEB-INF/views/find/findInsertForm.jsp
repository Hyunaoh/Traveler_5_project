<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 가이드찾기 글 등록</title>
	<!-- Find  CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/find/find.css" />" />
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			// 초기 설정
			$("#area").hide();
			$("#area_text1").hide();
			$("#area_text2").hide();
			$("#detail_info").hide();
			
			// 국가/지역 설정
			$("#country").change(function(){
				$("#area").show();
				$("#area_text1").show();
				if($("#country").val() == "대한민국"){
					$("#area").html("<option value='없음'>선택</option><option value='서울'>서울</option><option value='부산'>부산</option><option value='제주'>제주</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "미국"){
					$("#area").html("<option value='없음'>선택</option><option value='워싱턴 D.C.'>워싱턴 D.C.</option><option value='뉴욕'>뉴욕</option><option value='로스엔젤레스'>로스엔젤레스</option><option value='샌프란시스코'>샌프란시스코</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "영국"){
					$("#area").html("<option value='없음'>선택</option><option value='런던'>런던</option><option value='맨체스터'>맨체스터</option><option value='옥스퍼드'>옥스퍼드</option><option value='노팅엄'>노팅엄</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "프랑스"){
					$("#area").html("<option value='없음'>선택</option><option value='파리'>파리</option><option value='마르세유'>마르세유</option><option value='아비뇽'>아비뇽</option><option value='베르사유'>베르사유</option><option value='아를'>아를</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "이탈리아"){
					$("#area").html("<option value='없음'>선택</option><option value='피렌체'>피렌체</option><option value='밀라노'>밀라노</option><option value='제노바'>제노바</option><option value='피사'>피사</option><option value='시에나'>시에나</option><option value='아말피'>아말피</option><option value='소렌토'>소렌토</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "체코"){
					$("#area").html("<option value='없음'>선택</option><option value='프라하'>프라하</option><option value='브르노'>브르노</option><option value='카를로비바리'>카를로비바리</option><option value='쿠트나호라'>쿠트나호라</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "캐나다"){
					$("#area").html("<option value='없음'>선택</option><option value='몬트리올'>몬트리올</option><option value='캘거리'>캘거리</option><option value='에드먼턴'>에드먼턴</option><option value='킹스턴'>킹스턴</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "중국"){
					$("#area").html("<option value='없음'>선택</option><option value='상하이'>상하이</option><option value='베이징'>베이징</option><option value='텐진'>텐진</option><option value='광저우'>광저우</option><option value='칭다오'>칭다오</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "일본"){
					$("#area").html("<option value='없음'>선택</option><option value='도쿄'>도쿄</option><option value='교토'>교토</option><option value='오사카'>오사카</option><option value='삿포로'>삿포로</option><option value='고베'>고베</option><option value='기타'>기타</option>");
				} else{
					$("#area").hide();
					$("#area_text1").hide();
					$("#area_text2").hide();
					$("#area").html("<option value='없음'>없음</optoin>");
				}
			});
			$("#area").change(function(){
				if($("#area").val() == '없음'){
					$("#area_text2").hide();
					$("#detail_info").hide();
				} else{
					$("#area_text2").show();
					$("#detail_info").show();
				}
			});
			
			// 기간 설정
			var date_check = 0;
			$("#date_text").hide();
			$("#end_date").hide();
			$("#start_date").change(function(){
				$("#date_text").show();
				$("#end_date").show();
				$("#end_date").change(function(){
					if($("#start_date").val() > $("#end_date").val()){
						$("#date_result_text").html("<font color='red'>마지막 날짜는 시작날짜 보다 같거나 커야합니다.</font>");
						date_check = 0;
					} else{
						$("#date_result_text").html("");
						date_check = 1;
					}
				});
			});
			
			// 등록 버튼 설정
			$("#submit_btn").prop("disabled", true);
			window.setInterval(function(){
				if($("#detail_info").val() != '' && $("#end_date").val() != '' && date_check == 1){
					$("#submit_btn").prop("disabled", false);
				}else{
					$("#submit_btn").prop("disabled", true);
				}
			}, 100);
		});
	</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- banner -->
	<div class="find-banner" style="background-image:url('<c:url value='/resources/images/find_img/find_list_banner.jpg' />');"></div>
	
	<!-- contents -->
	<div class="container find-insert-container">
		<div class="row">
			<div class="col-md-12">
				<h2 class="text-center find-insert-header">가이드 찾기</h2>
				<div class="row">
					<div class="col-md-8 col-md-offset-2 find-insert-header-subtext">
						<h3>글을 작성해서 원하는 가이드를 찾아보세요!<br>자세하게 입력 할수록 원하는 가이드를 찾기 쉬워집니다.<br>편하게 여행을 즐기세요!</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<h3 class="find-insert-content-subheader">작성 요령</h3>
				<ul>
					<li class="find-insert-content">
						<font color="green">제목</font>은 게시판에서 미리 보여지는 부분입니다.<br><br>간단하면서 임팩트있게 작성할수록 가이드를 구하기 쉬워집니다.
					</li>
					<hr>
					<li class="find-insert-content ">
						<font color="green">본문</font>에는 자신이 가이드에게 원하는 정보나<br><br>자기소개를 써주시면 자신과 맞는 가이드를 찾을 수 있습니다.
					</li>
					<hr>
					<li class="find-insert-content ">
						<font color="green">나라</font>와 <font color="green">도시</font>, 그리고 <font color="green">가고싶은 장소</font>를 입력해주세요.
					</li>
					<hr>
					<li class="find-insert-content ">
						<font color="green">여행기간</font>을 정확히 확인해서 올려주세요.
					</li>
				</ul>
			</div>

			<div class="col-md-6">
				<form action="findInsertPro.go" method="post">
					<h3 class="find-insert-content-subheader">가이드 찾기 글 작성</h3>
					<div class="form-group">
						<label>제목</label>
						<input type="text" name="find_title" class="form-control" placeholder="제목을 입력해주세요"/>
					</div>
					<div class="form-group">
						<label>본문</label>
						<textarea name="find_content" class="form-control" rows="5" cols="30" placeholder="자세한 내용을 입력해주세요"></textarea>
					</div>
					<div class="form-group">
						<label>나라 </label>
						<select name="find_place1" id="country">
							<option>선택</option>
							<option value="대한민국">대한민국</option>
							<option value="미국">미국</option>
							<option value="영국">영국</option>
							<option value="프랑스">프랑스</option>
							<option value="이탈리아">이탈리아</option>
							<option value="체코">체코</option>
							<option value="캐나다">캐나다</option>
							<option value="중국">중국</option>
							<option value="일본">일본</option>
						</select>
						<label id="area_text1"> 도시</label>
						<select name="find_place2" id="area">
						</select>
					</div>
					<div class="form-group">
						<label id="area_text2">상세정보</label>
						<textarea name="find_place3" id="detail_info" rows="5" cols="30"
						class="form-control" placeholder="가고 싶은 장소 등 상세정보를 입력해주세요"></textarea>
					</div>
					<div class="form-group">
						<label>기간</label>
					</div>
					<div class="form-group col-md-6">
						<label>출발일</label>
						<input type="date" name="find_startDate" id="start_date" class="form-control"/>
					</div>
					<div class="form-group col-md-6">
						<label id="date_text">도착일</label>
						<input type="date" name="find_endDate" id="end_date" class="form-control"/>
					</div>
					<div class="form-group col-md-12">
						<input type="hidden" name="member_id" value = "<se:authentication property='principal.username' />" class="form-control"/>
						<input class="btn-custom" value="작성완료" type="submit">
					</div>
					<div id="date_result_text"></div>
				</form>
			</div>
		</div>
	</div>
		
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>