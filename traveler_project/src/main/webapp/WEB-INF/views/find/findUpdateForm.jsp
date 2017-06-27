<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 가이드찾기 글 수정</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			// 초기값 설정
			$("#country").val($("#find_place1").val()).attr("selected", "selected");
			init_place();
			
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
					$("#detail_info").hide();
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
			var date_check = 1;
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
		function init_place(){
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
			}
			$("#area").val($("#find_place2").val()).attr("selected", "selected");
		}
	</script>
</head>
<body>
	<!-- Test용 (나중에 지울것!) -->
	<% session.setAttribute("member_id", "8518");%>
	
	<form action="findUpdatePro.go" method="post">
		제목 : <input type="text" name="find_title" value="${findVO.find_title}" class="form-control"/><br>
		
		본문 : <input type="text" name="find_content" value="${findVO.find_content}" class="form-control"/><br>
		
		국가 :
		<input type="hidden" id="find_place1" value="${findVO.find_place1}"/>
		<input type="hidden" id="find_place2" value="${findVO.find_place2}"/>
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
		
		<span id="area_text1">도시 : </span>
		<select name="find_place2" id="area">
		</select>
		
		<p id="area_text2">상세사항 : </p>
		<textarea name="find_place3" id="detail_info" rows="10" cols="50" class="form-control">${findVO.find_place3}</textarea><br>
		<br>
		
		기간 : <input type="date" name="find_startDate" value="${findVO.find_startDate}" id="start_date" class="form-control"/>
		<span id="date_text"> ~ </span>
		<input type="date" name="find_endDate" id="end_date" value="${findVO.find_endDate}" class="form-control"/><br>
		
		<input type="hidden" name="member_id" value = "${sessionScope.member_id}" class="form-control"/>
		<input type="hidden" name="find_pk" value = "${findVO.find_pk}" class="form-control"/>
		<!-- 보안상 CSRF 값 넘겨줌 -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<button type="submit" id="submit_btn" class="btn btn-md btn-default">등록하기</button><div id="date_result_text"></div>
	</form>
</body>
</html>