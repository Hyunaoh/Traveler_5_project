<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>
<head>
<title>Insert title here</title>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <style type="text/css">
	 .package-insert-container{
		margin-bottom: 10rem;
	}
	.package-insert-header{
		
	}
	.package-insert-header-subtext{
		font-style:italic;
		margin-bottom: 5rem;
	}
	.package-insert-content{
		margin-bottom: 3rem;	
	}
	.package-insert-content-subheader{
		margin-bottom: 4rem;
		color: blue;
	}
	.package-banner{
	    padding: 0;
    margin: 0;
    height: 400px;
    background-size: cover;
	}
	
	.package-btn-custom {
	background-color: #2F9D27;
	color: #fff;
	border: 1px solid #2F9D27;
	padding-top: 0.7rem;
	padding-bottom: 0.7rem;
	padding-right: 0.7rem;
	padding-left: 0.7rem;
	border-radius: 12px;
	}
	
	.package-btn-custom:hover {
		background-color: #white;
		color: #white;
	}	
	  
  </style>

<script>

	$(document).ready(function() {
		
		 /* 해시태그 자동완성 */
		var availableTags = new Array();
		var taglist = document.getElementsByName("tag");
		for(var i = 0 ; i < taglist.length; i++){
			availableTags.push(taglist[i].value);
		}
	
		///*해시태그 칸 추가했을 시
		$("#add_div").click(function add_div(){
		    var div = document.createElement('div');
		    div.innerHTML = document.getElementById('tagdiv').innerHTML;
		    document.getElementById('field').appendChild(div);
		  
		});
		
		/* ///*해시태그 칸 삭제
		$("#remove_div").click(function remove_div(obj){
			var obj = this;
		    document.getElementById('field').removeChild(obj.parentNode);
		}); */
		
		
		
	    /* 국가 셀렉박스 */
		$("#place2").hide();
		$("#place1").change(function() {
			$("#place2").show();
			tform = document.insertForm;
			if (tform.package_place1.value == '대한민국') {
				tform.package_place2.length = 4;
				tform.package_place2.options[0].text = '서울';
				tform.package_place2.options[0].value = '서울';
				tform.package_place2.options[1].text = '부산';
				tform.package_place2.options[1].value = '부산';
				tform.package_place2.options[2].text = '제주';
				tform.package_place2.options[2].value = '제주';
				tform.package_place2.options[3].text = '기타';
				tform.package_place2.options[3].value = '기타';
			} else if (tform.package_place1.value == '미국') {
				tform.package_place2.length = 5;
				tform.package_place2.options[0].text = '워싱턴 D.C.';
				tform.package_place2.options[0].value = '워싱턴 D.C.';
				tform.package_place2.options[1].text = '뉴욕';
				tform.package_place2.options[1].value = '뉴욕';
				tform.package_place2.options[2].text = '로스앤젤레스';
				tform.package_place2.options[2].value = '로스앤젤레스';
				tform.package_place2.options[3].text = '샌프란시스코';
				tform.package_place2.options[3].value = '샌프란시스코';
				tform.package_place2.options[4].text = '기타';
				tform.package_place2.options[4].value = '기타';
			} else if (tform.package_place1.value == '영국') {
				tform.package_place2.length = 6;
				tform.package_place2.options[0].text = '런던';
				tform.package_place2.options[0].value = '런던';
				tform.package_place2.options[1].text = '뉴욕';
				tform.package_place2.options[1].value = '뉴욕';
				tform.package_place2.options[2].text = '맨체스터';
				tform.package_place2.options[2].value = '맨체스터';
				tform.package_place2.options[3].text = '옥스퍼드';
				tform.package_place2.options[3].value = '옥스퍼드';
				tform.package_place2.options[4].text = '노팅엄';
				tform.package_place2.options[4].value = '노팅엄';
				tform.package_place2.options[5].text = '기타';
				tform.package_place2.options[5].value = '기타';
			} else if (tform.package_place1.value == '프랑스') {
				tform.package_place2.length = 6;
				tform.package_place2.options[0].text = '파리';
				tform.package_place2.options[0].value = '파리';
				tform.package_place2.options[1].text = '마르세유';
				tform.package_place2.options[1].value = '마르세유';
				tform.package_place2.options[2].text = '아비뇽';
				tform.package_place2.options[2].value = '아비뇽';
				tform.package_place2.options[3].text = '베르사유';
				tform.package_place2.options[3].value = '베르사유';
				tform.package_place2.options[4].text = '아를';
				tform.package_place2.options[4].value = '아를';
				tform.package_place2.options[5].text = '기타';
				tform.package_place2.options[5].value = '기타';
			} else if (tform.package_place1.value == '이탈리아') {
				tform.package_place2.length = 8;
				tform.package_place2.options[0].text = '피렌체';
				tform.package_place2.options[0].value = '피렌체';
				tform.package_place2.options[1].text = '밀라노';
				tform.package_place2.options[1].value = '밀라노';
				tform.package_place2.options[2].text = '제노바';
				tform.package_place2.options[2].value = '제노바';
				tform.package_place2.options[3].text = '피사';
				tform.package_place2.options[3].value = '피사';
				tform.package_place2.options[4].text = '시에나';
				tform.package_place2.options[4].value = '시에나';
				tform.package_place2.options[5].text = '아말피';
				tform.package_place2.options[5].value = '아말피';
				tform.package_place2.options[6].text = '소렌토';
				tform.package_place2.options[6].value = '소렌토';
				tform.package_place2.options[7].text = '기타';
				tform.package_place2.options[7].value = '기타';
			} else if (tform.package_place1.value == '체코') {
				tform.package_place2.length = 5;
				tform.package_place2.options[0].text = '프라하';
				tform.package_place2.options[0].value = '프라하';
				tform.package_place2.options[1].text = '브르노';
				tform.package_place2.options[1].value = '브르노';
				tform.package_place2.options[2].text = '카를로비바리';
				tform.package_place2.options[2].value = '카를로비바리';
				tform.package_place2.options[3].text = '쿠트나호라';
				tform.package_place2.options[3].value = '쿠트나호라';
				tform.package_place2.options[4].text = '기타';
				tform.package_place2.options[4].value = '기타';
			} else if (tform.package_place1.value == '캐나다') {
				tform.package_place2.length = 5;
				tform.package_place2.options[0].text = '몬트리올';
				tform.package_place2.options[0].value = '몬트리올';
				tform.package_place2.options[1].text = '캘거리';
				tform.package_place2.options[1].value = '캘거리';
				tform.package_place2.options[2].text = '에드먼턴';
				tform.package_place2.options[2].value = '에드먼턴';
				tform.package_place2.options[3].text = '킹스턴';
				tform.package_place2.options[3].value = '킹스턴';
				tform.package_place2.options[4].text = '기타';
				tform.package_place2.options[4].value = '기타';
			} else if (tform.package_place1.value == '중국') {
				tform.package_place2.length = 6;
				tform.package_place2.options[0].text = '상하이';
				tform.package_place2.options[0].value = '상하이';
				tform.package_place2.options[1].text = '베이징';
				tform.package_place2.options[1].value = '베이징';
				tform.package_place2.options[2].text = '텐진';
				tform.package_place2.options[2].value = '텐진';
				tform.package_place2.options[3].text = '광저우';
				tform.package_place2.options[3].value = '광저우';
				tform.package_place2.options[4].text = '칭다오';
				tform.package_place2.options[4].value = '칭다오';
				tform.package_place2.options[5].text = '기타';
				tform.package_place2.options[5].value = '기타';
			} else if (tform.package_place1.value == '일본') {
				tform.package_place2.length = 6;
				tform.package_place2.options[0].text = '도쿄';
				tform.package_place2.options[0].value = '도쿄';
				tform.package_place2.options[1].text = '교토';
				tform.package_place2.options[1].value = '교토';
				tform.package_place2.options[2].text = '오사카';
				tform.package_place2.options[2].value = '오사카';
				tform.package_place2.options[3].text = '삿포로';
				tform.package_place2.options[3].value = '삿포로';
				tform.package_place2.options[4].text = '고베';
				tform.package_place2.options[4].value = '고베';
				tform.package_place2.options[5].text = '기타';
				tform.package_place2.options[5].value = '기타';
			}
		});
	});
</script>

<script type="text/javascript">
	
	function remove_div(obj){
	document.getElementById('field').removeChild(obj.parentNode);
	}

</script>


</head>
<body>

	<!-- header -->
	<jsp:include page="../header.jsp" />   
	
	<!-- banner -->
	<div class="package-banner" style="background-image:url('<c:url value='/resources/images/campingcar.jpg' />');"></div>
	
	
	
	<!-- contents -->
	<div class="container package-insert-container">
		<h1>상품 등록하기</h1>
		<div class="row">
			<div class="col-md-6">
				<form name="insertForm" action="insertPackagePro.go" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label>제목</label>
						<input type="text" class="form-control" name="package_title" placeholder="제목을 입력해주세요" required="required"/><br>
					</div>
					
					<div class="form-group">
						<label>내용</label>
						<textarea name="package_place3" class="form-control" id="detail_info" rows="5" cols="50" class="form-control" required="required"></textarea><br>
					</div>
					<hr>
					<div class="form-group">
						<label>사진<font size="1px" color="gray">-다른 이용자들을 위해 사진을 꼭 등록해주세요:)</font></label>
						<input type ="file" name="imgFile" required="required">
					</div>
					<hr>
					<div class="form-group">
						<div class="row">
							<label>여행지 선택</label>
						</div>
						<div class="row">
							<div class="col-md-6">
								<select class = "form-control"name="package_place1" id="place1" required="required" >
										<option>나라 선택</option>
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
							<div class="col-md-6">
								<select class="form-control" name="package_place2"  id="place2" required="required">
								</select>
							</div>
						</div>
					</div>
					
					<hr>
					<div class="form-group">
						<label>해시태그(1개 이상 등록해주세요 :)</label>
						<input class="package-btn-custom" type="button" id="add_div" value="해시태그 추가"><br/>
						<div id="tagdiv">
							<div class="col-md-9">
							<input width="100" class="form-control" type="text" name="package_tag" list="info_list" placeholder="#해시태그" required="required" autocomplete="on">
							</div>
							
							<div class="col-md-3">
							<input type="button" class="package-btn-custom" value="삭제" onclick="remove_div(this);" id="remove_div">
							</div>
						</div>
						<div id="field">
						</div>
					</div>
					<font size="1px" color="grey">예> #로맨틱 #성공적 #올빼미여행 </font><br><br>
					<hr>
					
					<div class="form-group">
						<label>상세 내용</label>
					<textarea class="form-control" name="package_content" rows="5" cols="50" placeholder="상세 내용을 입력해주세요" required="required"></textarea><br>
					</div>
					
					<div class="form-group">
						<div class = "row">
							<div class="col-md-6">
								<input type="number" class ="form-control" name="package_leadTime" placeholder="소요시간을 입력해주세요" required="required">
							</div>
							<div class="col-md-6">
								<input type="number" class ="form-control" name="package_cost" placeholder="1인 가격을 입력해주세요" required="required">
							</div>
						</div>
					</div>
					<input type="hidden" name="member_id"  value="${sessionId}">
					
					<br/>
					<br/>
					<input type = "button" class = "package-btn-custom" value="등록" onclick="submit()">
				
				</form>
			</div>
		<!-- datalist -->
		<datalist id ="info_list">
			<c:forEach items="${tagList}" var="list">
				<option value="${list.key }"> 관련 상품 ${list.value}개</option>
			</c:forEach>
		</datalist>
			<!-- side bar -->
			<div class="col-md-6" style="background-color: rgba(255,255,255,0.9);">
				<ul>
					<li class="group-insert-list-content">
						<font color="green">제목</font>은 게시판에서 미리 보여지는 부분입니다.<br>고객들이 쉽게 알 수 있게 적을수록 상품의 인기가 높아집니다.
					</li>
					<hr>
					<li class="group-insert-list-content">
						<font color="green">내용</font>에는 자신의 상품의 자세한 정보를<br>써주시면 고객들에게 더욱 도움이 될 겁니다.
					</li>
					<hr>
					<li class="group-insert-list-content">
						<font color="green">나라</font>와 <font color="green">도시</font>, 그리고 <font color="green">상세한 장소</font>를 작성해서 상품의 여행코스를 알려주세요.
					</li>
					<hr>
					<li class="group-insert-list-content">
						<font color="green">최소인원</font>및 <font color="green">최대인원</font> 을 정확히 확인해서 올려주세요.
					</li>
					<hr>
					<li class="group-insert-list-content">
						<font color="green">가격</font>을 적당한 수준에 맞게 올려주시길 바랍니다.
					</li>
				</ul>
			</div>
		</div>
			
	</div><!-- container end -->
	
		<!-- 해시태그 리스트 Jquery로 전달하기 위한.. -->
		<c:forEach items="${tagList}" var="list">
			<input type="hidden" name="tag" value="${list.key}">	
				
		</c:forEach>
		

		

</body>
</html>


<%-- 
<script type="text/javascript">
	
	function remove_div(obj){
	document.getElementById('field').removeChild(obj.parentNode);
	}

</script>


</head>
<body>
	
			<br>
			<br>
			<br>
	
	<h1>상품 등록하기</h1>
	<form name="insertForm" action="insertPackagePro.go" method="post" enctype="multipart/form-data">
		<input type="text" name="package_title" placeholder="제목을 입력해주세요" required="required">
		<select name="package_place1" id="place1" required="required" >
			<option>나라 선택</option>
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
		
		<select name="package_place2"  id="place2" required="required">
		</select>
		
		<p id="area_text2">상세사항 : </p>
		<textarea name="package_place3" id="detail_info" rows="5" cols="50" class="form-control" required="required"></textarea><br>
		<br>
		
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
		
		<textarea name="package_content" rows="5" cols="50" placeholder="내용을 입력해주세요" required="required"></textarea><br>
		<input type="number" name="package_leadTime" placeholder="소요시간을 입력해주세요" required="required">
		<input type ="file" name="imgFile" required="required">
		
		<input type="hidden" name="member_id"  value="test">
		
		
		<input type = "submit" value="등록" >
	
	</form>
	
		<!-- 해시태그 리스트 Jquery로 전달하기 위한.. -->
		<c:forEach items="${tagList}" var="list">
			<input type="hidden" name="tag" value="${list.key}">	
				
		</c:forEach>
		
		

</body>
</html> --%>