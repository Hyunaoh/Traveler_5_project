<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>마이페이지</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
#jb-container {
	width: 940px;
	margin: 0px auto;
	padding: 20px;
}

#jb-header {
	padding: 20px;
	margin-bottom: 10px;
}

#jb-header1 {
	float: left;
	background-color: navy;
}

#jb-header2 {
	float: left;
}

#jb-content1 {
	width: 64%;
	height: 320px;
	padding: 10px;
	margin-top: 30px;
	float: left;
	border: 1px solid #bcbcbc;
	padding: 10px;
}

#jb-content1-1 {
	float: left;
}

#jb-content1-2 {
	margin-top: 10px;
	margin-left: 220px;
}

#jb-content1-3 {
	margin-top: 20px;
}

#jb-content2 {
	width: 33%;
	height: 320px;
	padding: 10px;
	margin-top: 30px;
	margin-left: 13px;
	float: right;
	border: 1px solid #bcbcbc;
}

#jb-footer {
	float: none;
	height: 270px;
	margin-top: 375px;
	padding: 10px;
	background-color: #E3F6CE;
}

#jb-footer1 {
	float: left;
	width: 180px;
	margin-top: -20px;
	margin-left: 15px;
	height: 180px;
	background-color: #D0F5A9;
}

#jb-paging {
	margin-top: -150px;
	margin-left: 150px;
}
</style>
</head>
<script type="text/javascript">
	$(function() {
		var hover1 = $('.hover1');
		hover1.hover(function() {
			hover1.css('background-color', '#BEF781');
		}, function() {
			hover1.css('background-color', '#D0F5A9');
		});
		var hover2 = $('.hover2');
		hover2.hover(function() {
			hover2.css('background-color', '#BEF781');
		}, function() {
			hover2.css('background-color', '#D0F5A9');
		});
		var hover3 = $('.hover3');
		hover3.hover(function() {
			hover3.css('background-color', '#BEF781');
		}, function() {
			hover3.css('background-color', '#D0F5A9');
		});
		var hover4 = $('.hover4');
		hover4.hover(function() {
			hover4.css('background-color', '#BEF781');
		}, function() {
			hover4.css('background-color', '#D0F5A9');
		});
	});
</script>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	<font size="3">
		<div id="jb-container">

			<h2>&nbsp;&nbsp;마이페이지</h2>

			<div role="tabpanel">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#myPage"
						role="tab" data-toggle="tab">마이페이지</a></li>
					<li role="presentation"><a href="#purchase" role="tab"
						data-toggle="tab">구매내역</a></li>
					<li role="presentation"><a href="#QnA" role="tab"
						data-toggle="tab">고객센터</a></li>
					<li role="presentation"><a href="#change" role="tab"
						data-toggle="tab">비밀번호변경</a></li>
					<li role="presentation"><a href="#pay" role="tab"
						data-toggle="tab">결제정보</a></li>
				</ul>

				<!-- 탭내용 -->
				<div class="tab-content">

					<!-- 마이페이지 -->
					<div role="tabpanel" class="tab-pane fade in active" id="myPage">
						<div id="jb-header">
							안녕하세요! ${ list.member_name } 님<br> 여행가를 이용해 주셔서 항상 감사합니다!
							<div>
								<div id="jb-content1">
									회원정보
									<hr>
									<div title="photo" id="jb-content1-1">
										<c:if test="${ list.member_profile == null }">
											<img style="width: 208px; height: 208px;"
												src="<c:url value='/resources/images/profile.jpg' />" alt="">
										</c:if>
										<c:if test="${ list.member_profile != null }">
											<img
												src="<c:url value='/resources/images/profiles/${list.member_profile}' />"
												class="img-rounded" alt="Cinque Terre"
												style="width: 208px; height: 208px;">
										</c:if>
									</div>
									<div title="text" id="jb-content1-2">
										<table>
											<tr>

												<td><input type="image"
													style="width: 15px; height: 15px;"
													src="<c:url value='/resources/images/icons/id-card.png' />"
													alt="">&nbsp;ID</td>
												<td>${ list.member_id }</td>
											</tr>
											<tr>
												<td><input type="image"
													style="width: 15px; height: 15px;"
													src="<c:url value='/resources/images/icons/id-card.png' />"
													alt="">&nbsp;닉네임</td>
												<td>${ list.member_nickName }</td>
											</tr>
											<tr>
												<td><input type="image"
													style="width: 15px; height: 15px;"
													src="<c:url value='/resources/images/icons/id-card.png' />"
													alt="">&nbsp;휴대폰번호</td>
												<td>${ list.member_tel }</td>
											</tr>
											<tr>
												<td><input type="image"
													style="width: 15px; height: 15px;"
													src="<c:url value='/resources/images/icons/id-card.png' />"
													alt="">&nbsp;이메일</td>
												<td>${ list.member_email }</td>
											</tr>
											<tr>
												<td><input type="image"
													style="width: 15px; height: 15px;"
													src="<c:url value='/resources/images/icons/id-card.png' />"
													alt="">&nbsp;국가</td>
												<td>${ list.member_nationality }</td>
											</tr>
											<tr>
												<td><input type="image"
													style="width: 15px; height: 15px;"
													src="<c:url value='/resources/images/icons/id-card.png' />"
													alt="">&nbsp;언어</td>
												<td>${ list.member_language }</td>
											</tr>
										</table>
										<div title="link" id="jb-content1-3">
											<input type="button" value="가이드신청" class="btn btn-default"
												onclick="location='guideForm.go'"> <input
												type="button" value="정보수정" class="btn btn-default"
												onclick="location='memberInsertDetail.go'">

											<div align="right">
												<a href="/member/memberDeleteForm.go">회원탈퇴</a>
											</div>
										</div>
									</div>
								</div>

								<div id="jb-content2">
									상담내역
									<hr>
									<c:forEach var="list3" items="${ list3 }" begin="0" end="3">
										<ul>
											<li>${ list3.counsel_title }${ list3.counsel_date }<c:if
													test="${ list3.counsel_flag == 0 }">
													<font color="#FF0000">답변대기중</font>
												</c:if> <c:if test="${ list3.counsel_flag == 1 }">
													<font color="#0000FF">답변완료</font>
												</c:if>
											</li>
										</ul>
									</c:forEach>

									<a href="/member/memberDeleteForm.go">자세히</a>
								</div>
							</div>


							<!-- 탭 기능 -->
							<div id="jb-footer">
								<div role="tabpanel">
									<ul class="nav nav-pills" role="tablist">
										<li role="presentation" class="active"><a href="#private"
											role="tab" data-toggle="tab">개인패키지</a></li>
										<li role="presentation"><a href="#group" role="tab"
											data-toggle="tab">그룹패키지</a></li>
									</ul>
									<!--  탭 내용  -->
									<div class="tab-content">
										<!-- 개인패키지 -->
										<div role="tabpanel" class="tab-pane fade in active"
											id="private">
											<div style="margin-left: 20px; margin-top: 10px;">
												<c:forEach items="${ list2 }" var="list2">
													<div id="jb-footer1" class="hover1">
														<img style="width: 180px; height: 180px;"
															src="<c:url value='/resources/images/package_img/${ list2.package_image }' />"
															alt="">
													</div>
												</c:forEach>
											</div>
											<div class="row">
												<div class="col-lg-7"></div>
												<div class="form-inline col-lg-5">
													<ul class="pagination" id="jb-paging">
														<c:if test="${currentPageNum > '1'}">
															<li><a
																href="mypageForm.go?pageNum=${currentPageNum-1}"><span
																	class="glyphicon glyphicon-chevron-left"></span></a></li>
														</c:if>
														<c:forEach begin="1" end="${page.pageTotalNum}"
															var="pageNum">
															<li><a href="mypageForm.go?pageNum=${pageNum}">${pageNum}</a></li>
														</c:forEach>
														<c:if test="${page.pageTotalNum > currentPageNum}">
															<li><a
																href="mypageForm.go?pageNum=${currentPageNum+1}"><span
																	class="glyphicon glyphicon-chevron-right"></span></a></li>
														</c:if>
													</ul>
												</div>
											</div>
										</div>


										<!-- 단체패키지 -->
										<div role="tabpanel" class="tab-pane fade in" id="group">
											되나?</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- <div role="tabpanel" class="tab-pane fade in active" id="myPage"> -->
					<!-- 마이페이지 끝 -->


					<!-- 구매내역 -->
					<div role="tabpanel" class="tab-pane fade in active" id="purchase">
						<div id="jb-header">냥냥냥??</div>
					</div>



					<!-- Q&A -->
					<div role="tabpanel" class="tab-pane fade in active" id="QnA">
						<form action="/member/searchKeyword.go" method="get">
							<font size="4">FAQ</font><input type="text" name="search">
							<input type="submit" value="검색">
						</form>
						<button onclick="location='inquireMember.go'">1:1문의하기</button>

						<body data-spy="scroll" data-target="#myScrollspy"
							data-offset="20">
							<div class="container">
								<div class="row">
									<nav class="col-sm-3" id="myScrollspy">
										<ul class="nav nav-pills nav-stacked">
											<li><a href="#section1">자주 묻는 질문</a></li>
											<li><a href="#section2">예약 관련</a></li>
											<li><a href="#section3">여행 관련</a></li>
											<li><a href="#section4">서비스 관련</a></li>
											<li><a href="#section5">파트너 관련</a></li>
										</ul>
									</nav>
									<div class="col-sm-9">
										<div id="section1">
											<h2>자주 묻는 질문</h2>
											<p>
											<ul>
												<li><a data-toggle="collapse" data-parent="#accordion"
													href="#collapse3"> 1. 여행가를 통해 여행을 가고싶어요. 예약은 어떻게 해야
														하나요?</a></li>
												<div id="collapse3" class="panel-collapse collapse">
													<div class="panel-body">마이리얼트립은 여행지에서 즐길 수 있는 투어, 관광지
														입장권, 교통패스, 액티비티는 물론 현지 문화 체험까지 내가 원하는 여행을 쉽고 빠르게 검색하고 예약할
														수 있는 여행 플랫폼 서비스입니다. 마이리얼트립 회원가입 후 여행하실 지역을 검색하신 다음 상품 상세
														페이지를 살펴보신 후 예약해 주시면 됩니다.</div>
												</div>
											</ul>
											</p>
										</div>

										<div id="section2">
											<h2>예약 관련</h2>
											<p>
											<ul>
												<li>1. 가이드와의 문의 후 답변은 어떻게 받나요?</li>
												<li>2. 견적서 요청은 어떻게 하나요?</li>
												<li>3. 가이드님께 항공, 호텔, 교통편 예매 대행을 문의할 수 있나요?</li>
												<li>4. 아동 티켓만 따로 구매할 수 있나요?</li>
												<li>5. 티켓은 지정한 날에만 이용할 수 있나요?</li>
												<li>6. 제가 예약한 내역건은 어디서 볼 수 있나요?</li>
												<li>7. 가이드에게 문의를 했는데 답변이 없어요. 어떻게 하죠?</li>
												<li>8. 현지에서 결제 할 수 없나요?</li>
												<li>9. 결제수단 변경 가능한가요?</li>
												<li>10. 결제 중 오류가 발생했어요, 결제가 된 건가요?</li>
												<li>11. 현금영수증은 어떻게 받나요?</li>
												<li>12. 환불은 어떻게 받나요?</li>

											</ul>
											</p>
										</div>

										<div id="section3">
											<h2>여행 관련</h2>
											<p>
											<ul>
												<li>1. 여행가를 통해 여행을 가고싶어요. 예약은 어떻게 해야 하나요?</li>
												<li>2. 결제는 어떻게 해야하나요?</li>
												<li>3. 미팅장소에서 (여행자&가이드) 지각하는 경우 어떻게 해야하나요?</li>
												<li>4. 여행가에서 결제했는데 현지에서도 비용이 발생하나요?</li>
												<li>5. 예약 취소는 어떻게 하나요?</li>
												<li>6. 예약 취소 수수료는 어떻게 되나요?</li>
												<li>7. 가이드님의 소속이 궁금해요</li>
												<li>8. 마이리얼트립 가이드로 활동하고 싶습니다. 가이드 등록은 어떻게 하나요?</li>
											</ul>
											</p>
										</div>

										<div id="section4">
											<h2>서비스 관련</h2>
											<p>
											<ul>
												<li>1. 여행가를 통해 여행을 가고싶어요. 예약은 어떻게 해야 하나요?</li>
												<li>2. 결제는 어떻게 해야하나요?</li>
												<li>3. 미팅장소에서 (여행자&가이드) 지각하는 경우 어떻게 해야하나요?</li>
												<li>4. 여행가에서 결제했는데 현지에서도 비용이 발생하나요?</li>
												<li>5. 예약 취소는 어떻게 하나요?</li>
												<li>6. 예약 취소 수수료는 어떻게 되나요?</li>
												<li>7. 가이드님의 소속이 궁금해요</li>
												<li>8. 마이리얼트립 가이드로 활동하고 싶습니다. 가이드 등록은 어떻게 하나요?</li>
											</ul>
											</p>
										</div>

										<div id="section5">
											<h2>파트너 관련</h2>
											<p>
											<ul>
												<li>1. 가이드(파트너) 등록은 어떻게 하나요?</li>
												<li>2. 가이드가 되려면 어떠한 자격이 필요한가요?</li>
												<li>3. 가이드(파트너) 신청부터 가이드(파트너)로 활동하기까지 어느정도의 시간이 걸리나요?</li>
												<li>4. 가이드(파트너) 인터뷰는 어떻게 진행되며, 인터뷰를 해야하는 특별한 이유가 무엇인가요?</li>
												<li>5. 가이드가 되려면 실제 얼굴의 프로필 사진과 이름을 공개해야 하나요?</li>
												<li>6. 가이드로 활동하면 좋은 점이 무엇인가요?</li>
												<li>7. 더 이상 가이드로 활동하기를 희망하지 않아요. 탈퇴 절차는 어떻게 해야되나요?</li>
												<li>8. 여행가에서 수수료를 받는 이유는 무엇인가요?</li>
											</ul>
											</p>
										</div>

									</div>
								</div>
							</div>

						</body>

					</div>




					<!-- 비밀번호변경 -->
					<div role="tabpanel" class="tab-pane fade in active" id="change"></div>




					<!-- 결제 -->
					<div role="tabpanel" class="tab-pane fade in active" id="pay"></div>



				</div>
			</div>
			<!-- <div role="tabpanel"> -->
		</div> <!-- <div id="jb-container"> -->
	</font>
</body>
</html>