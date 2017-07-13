<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 단체상품 수정</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			// 초기 설정
			$("[name=group_pak_place1]").val($("#place1").val()).prop("selected", true);
			if($("[name=group_pak_place1]").val() == "대한민국"){
				$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='서울'>서울</option><option value='부산'>부산</option><option value='제주'>제주</option><option value='기타'>기타</option>");
			} else if ($("[name=group_pak_place1]").val() == "미국"){
				$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='워싱턴 D.C.'>워싱턴 D.C.</option><option value='뉴욕'>뉴욕</option><option value='로스엔젤레스'>로스엔젤레스</option><option value='샌프란시스코'>샌프란시스코</option><option value='기타'>기타</option>");
			} else if ($("[name=group_pak_place1]").val() == "영국"){
				$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='런던'>런던</option><option value='맨체스터'>맨체스터</option><option value='옥스퍼드'>옥스퍼드</option><option value='노팅엄'>노팅엄</option><option value='기타'>기타</option>");
			} else if ($("[name=group_pak_place1]").val() == "프랑스"){
				$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='파리'>파리</option><option value='마르세유'>마르세유</option><option value='아비뇽'>아비뇽</option><option value='베르사유'>베르사유</option><option value='아를'>아를</option><option value='기타'>기타</option>");
			} else if ($("[name=group_pak_place1]").val() == "이탈리아"){
				$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='피렌체'>피렌체</option><option value='밀라노'>밀라노</option><option value='제노바'>제노바</option><option value='피사'>피사</option><option value='시에나'>시에나</option><option value='아말피'>아말피</option><option value='소렌토'>소렌토</option><option value='기타'>기타</option>");
			} else if ($("[name=group_pak_place1]").val() == "체코"){
				$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='프라하'>프라하</option><option value='브르노'>브르노</option><option value='카를로비바리'>카를로비바리</option><option value='쿠트나호라'>쿠트나호라</option><option value='기타'>기타</option>");
			} else if ($("[name=group_pak_place1]").val() == "캐나다"){
				$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='몬트리올'>몬트리올</option><option value='캘거리'>캘거리</option><option value='에드먼턴'>에드먼턴</option><option value='킹스턴'>킹스턴</option><option value='기타'>기타</option>");
			} else if ($("[name=group_pak_place1]").val() == "중국"){
				$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='상하이'>상하이</option><option value='베이징'>베이징</option><option value='텐진'>텐진</option><option value='광저우'>광저우</option><option value='칭다오'>칭다오</option><option value='기타'>기타</option>");
			} else if ($("[name=group_pak_place1]").val() == "일본"){
				$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='도쿄'>도쿄</option><option value='교토'>교토</option><option value='오사카'>오사카</option><option value='삿포로'>삿포로</option><option value='고베'>고베</option><option value='기타'>기타</option>");
			} else{
				$("[name=group_pak_place2]").html("<option value='없음'>없음</optoin>");
			}
			$("[name=group_pak_place2]").val($("#place2").val()).prop("selected", true);
			
			// 국가/지역 설정
			$("[name=group_pak_place1]").change(function(){
				if($("[name=group_pak_place1]").val() == "대한민국"){
					$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='서울'>서울</option><option value='부산'>부산</option><option value='제주'>제주</option><option value='기타'>기타</option>");
				} else if ($("[name=group_pak_place1]").val() == "미국"){
					$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='워싱턴 D.C.'>워싱턴 D.C.</option><option value='뉴욕'>뉴욕</option><option value='로스엔젤레스'>로스엔젤레스</option><option value='샌프란시스코'>샌프란시스코</option><option value='기타'>기타</option>");
				} else if ($("[name=group_pak_place1]").val() == "영국"){
					$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='런던'>런던</option><option value='맨체스터'>맨체스터</option><option value='옥스퍼드'>옥스퍼드</option><option value='노팅엄'>노팅엄</option><option value='기타'>기타</option>");
				} else if ($("[name=group_pak_place1]").val() == "프랑스"){
					$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='파리'>파리</option><option value='마르세유'>마르세유</option><option value='아비뇽'>아비뇽</option><option value='베르사유'>베르사유</option><option value='아를'>아를</option><option value='기타'>기타</option>");
				} else if ($("[name=group_pak_place1]").val() == "이탈리아"){
					$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='피렌체'>피렌체</option><option value='밀라노'>밀라노</option><option value='제노바'>제노바</option><option value='피사'>피사</option><option value='시에나'>시에나</option><option value='아말피'>아말피</option><option value='소렌토'>소렌토</option><option value='기타'>기타</option>");
				} else if ($("[name=group_pak_place1]").val() == "체코"){
					$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='프라하'>프라하</option><option value='브르노'>브르노</option><option value='카를로비바리'>카를로비바리</option><option value='쿠트나호라'>쿠트나호라</option><option value='기타'>기타</option>");
				} else if ($("[name=group_pak_place1]").val() == "캐나다"){
					$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='몬트리올'>몬트리올</option><option value='캘거리'>캘거리</option><option value='에드먼턴'>에드먼턴</option><option value='킹스턴'>킹스턴</option><option value='기타'>기타</option>");
				} else if ($("[name=group_pak_place1]").val() == "중국"){
					$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='상하이'>상하이</option><option value='베이징'>베이징</option><option value='텐진'>텐진</option><option value='광저우'>광저우</option><option value='칭다오'>칭다오</option><option value='기타'>기타</option>");
				} else if ($("[name=group_pak_place1]").val() == "일본"){
					$("[name=group_pak_place2]").html("<option value='없음'>선택</option><option value='도쿄'>도쿄</option><option value='교토'>교토</option><option value='오사카'>오사카</option><option value='삿포로'>삿포로</option><option value='고베'>고베</option><option value='기타'>기타</option>");
				} else{
					$("[name=group_pak_place2]").html("<option value='없음'>없음</optoin>");
				}
			});
			
			$("[name=group_pak_max]").change(function(){
				if($("[name=group_pak_min]").val() > $("[name=group_pak_max]").val()){
					alert("최대인원이 최소인원보다 크거나 같아야 합니다.");
				}
			});
		});
	</script>
</head>
<body style="background-image: url('<c:url value="/resources/images/group-package-bg.jpg" />');">
	<!-- header -->
	<jsp:include page="../header.jsp" />
	<br><br><br><br><br><br>
	
	<!-- content -->
	<div class="container">
		<div class="row">
			<h1 style="color: rgba(255, 255, 255, 0.8); font-style:italic; border-bottom: 1px dotted rgba(255, 255, 255, 0.5);">단체 상품 수정</h1>
		</div>
		<div class="row">
			<!-- 왼쪽 -->
			<div class="col-md-8">
				<div class="well" style="background-color: rgba(255,255,255,0.9); margin-right:1rem;">
				<form action="groupUpdatePro.go" method="post" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-6">
							<label>제목</label>
							<input type="text" name="group_pak_title" value="${groupVO.group_pak_title}" class="form-control"/><br>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label>내용</label>
							<textarea name="group_pak_content" class="form-control" rows="12">${groupVO.group_pak_content}</textarea><br>
						</div>
					</div>
					
					<hr>
					<div class="row">
						<div class="col-md-6">
							<label>사진</label>
							<input type="file" name="imgFile"/>
							<br><img style="width:100%" src="<c:url value="/resources/images/group_img/${groupVO.group_pak_photo}" />">
						</div>
					</div>
					
					<hr>
					<div class="row">
						<div class="col-md-6">
							<label>나라</label>
							<select name="group_pak_place1" class="form-control">
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
							<input type="hidden" id="place1" value="${groupVO.group_pak_place1}"/><br>	
						</div>
						<div class="col-md-6">
							<label>도시</label>
							<select name="group_pak_place2" class="form-control">
							</select>
							<input type="hidden" id="place2" value="${groupVO.group_pak_place2}" class="form-control"/><br>
						</div>
						<div class="col-md-12">
							<label>상세장소</label>
							<input type="text" name="group_pak_place3" value="${groupVO.group_pak_place3}" class="form-control"/><br>
						</div>
					</div>
					
					<hr>
					<div class="row">
						<div class="col-md-6">
							<label>최소 인원</label>
							<input type="number" min="1" value="${groupVO.group_pak_min}" name="group_pak_min" class="form-control"/><br>
						</div>
						<div class="col-md-6">
							<label>최대 인원</label>
							<input type="number" min="1" value="${groupVO.group_pak_max}" name="group_pak_max" class="form-control"/><br>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6">
							<label>가격(인당)</label>
							<input type="number" name="group_pak_cost" min="0" value="${groupVO.group_pak_cost}" class="form-control"/>
						</div>
					</div>
					
					<div id="result_text"></div>
					<input type="hidden" name="group_pak_status" value="0" class="form-control"/>
					<input type="hidden" name="group_pak_pk" value="${groupVO.group_pak_pk}"/>
					<input type="hidden" name="group_pak_flag1" value="${groupVO.group_pak_flag1}"/>
					<input type="hidden" name="group_pak_flag2" value="${groupVO.group_pak_flag2}"/>
					
					<hr>
					<div class="row">
						<div class="col-md-6">
							<input type="submit" value="등록" class="btn btn-primary btn-md"/>
						</div>
					</div>
				</form>
				</div>
			</div>
			<!-- side bar -->
			<div class="col-md-4 well" style="background-color: rgba(255,255,255,0.9);">
				뭘 넣을까..
			</div>
		</div>
	</div>
</body>
</html>