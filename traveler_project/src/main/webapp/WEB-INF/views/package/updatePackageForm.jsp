<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>
<head>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
	function remove_div(obj){
	document.getElementById('field').removeChild(obj.parentNode);
	}

</script>
	<script type="text/javascript">
		$(function(){
			
			///*해시태그 칸 추가
			$("#add_div").click(function add_div(){
			    var div = document.createElement('div');
			    div.innerHTML = document.getElementById('tagdiv').innerHTML;
			    document.getElementById('field').appendChild(div);
			  
			});
			
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
	<form action="updatePackagePro.go" method="post">
		제목 : <input type="text" name="package_title" value="${packageVO.package_title}" class="form-control"/><br>
		
		본문 : <input type="text" name="package_content" value="${packageVO.package_content}" class="form-control"/><br>
		
		국가 :
		<input type="hidden" id="package_place1" value="${packageVO.package_place1}"/>
		<input type="hidden" id="package_place2" value="${packageVO.package_place2}"/>
		<select name="package_place1" id="country">
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
		<select name="package_place2" id="area">
		</select>
		
		<p id="area_text2">상세사항 : </p>
		<textarea name="package_place3" id="detail_info" rows="10" cols="50" class="form-control">${packageVO.package_place3}</textarea><br>
		<br>
		
		소요시간 : <input type="number" name="package_leadTime" value="${packageVO.package_leadTime}" id="leadTime" class="form-control"/>
		
		<p id="area_text3">해시태그 : </p>
			<input type="button" id="add_div" value="해시태그 추가"><br/>
			<div id="tagdiv">
				<font color="pink" font-weight="bold">#</font>
				<input type="text" name="package_tag" list="info_list" placeholder="해시태그" required="required" autocomplete="on">
				<input type="button" value="삭제" onclick="remove_div(this)">
			</div>
			
			<!-- datalist -->
			<datalist id ="info_list">
				<c:forEach items="${tagList}" var="list">
					<option value="${list.key }"> 관련 상품 ${list.value}개</option>
				</c:forEach>
			</datalist>
			

			<div id="field">
			</div>
			<font size="1px" color="grey">예> #로맨틱 #성공적 #올빼미여행 </font><br><br>
			
		<input type="hidden" name="member_id" value = "${sessionScope.member_id}" class="form-control"/>
		<input type="hidden" name="package_pk" value = "${packageVO.package_pk}" class="form-control"/>
		
		<button type="submit" id="submit_btn" class="btn btn-md btn-default">등록하기</button><div id="date_result_text"></div>
	</form>

</body>
</html>