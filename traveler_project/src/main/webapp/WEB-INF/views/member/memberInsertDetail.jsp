<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head></head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>	
	 <style>
      #container {
        width: 940px;
        margin: 0px auto;
        padding: 20px;
      }
      </style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	<font size="2">
	<div id="#container" style="width: 80%;" >
		<div class="page-header" style="margin-left: 300px;">
			<h1>
				세부사항
			</h1>
			<p style="font-style: italic;">세부 사항을 입력하고 가이드가 되어보세요!</p>
		</div>
		<div class="col-md-6 col-md-offset-3" style="margin-left: 400px;">
			<form method="post" enctype="multipart/form-data" action="memberInsertDetailPro.go" role="form">
				<div class="form-group">
					<label for="profile">프로필 사진</label>
					<input type="file" name="imgFile"><br>
				</div>
				<div class="form-group">
					<label for="nation">국적</label>
					<select name="member_nationality" class="form-control">
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
				</div>
				<div class="form-group">
					<label for="language">구사 언어</label>
					<input type="checkbox" name="member_language" value="한국어"> 한국어
					<input type="checkbox" name="member_language" value="영어"> 영어
					<input type="checkbox" name="member_language" value="중국어"> 중국어
					<input type="checkbox" name="member_language" value="일본어"> 일본어
				</div>
				<div class="form-group">
					<label for="certi">자격증</label>
					<input type="text" class="form-control" name="member_certification" placeholder="자격증이 없다면 '없음'을 입력하세요">
				</div>
				<div class="form-group">
					<label for="adrress">주소</label>
					<div class="input-group">
						<input type="text" name="member_post"
							readonly="readonly" placeholder="검색버튼을 눌러주세요" class="postcodify_postcode5 form-control" />
						<span class="input-group-btn" style="height:100%;">
							<button id="postcodify_search_button" type="button" class="btn btn-success" style="height:100%;">
								검색<i class="fa fa-edit spaceLeft"></i>
							</button>
						</span>
					</div>
					<div class="form-group">
						<input type="text" id="address" name="member_adrr"
						readonly="readonly" class="postcodify_address form-control" />
						<p class="help-block">상세주소를 입력하세요</p>
						<input type="text" class="form-control" name="member_addrDetail">
					</div>
				</div>
				<input type="hidden" name="member_isGuide" value="0">
				<div class="form-group text-center">
					<button type="reset" class="btn btn-warning">
						입력취소<i class="fa fa-times spaceLeft"></i>
					</button>
					<button type="submit" class="btn btn-info" id="btn_join">
						완료<i class="fa fa-check spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
	</font>
	<!-- 주소 "검색"창  -->
	<script>
	$(function() { $("#postcodify_search_button").postcodifyPopUp(); });
	</script>
	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.min.js"/>"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
</body>
</html>