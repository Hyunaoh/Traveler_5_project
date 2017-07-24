<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 단체상품</title>
	
	<!-- Group CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/group/group.css" />" />
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("[name=groupNoticeForm]").hide();
		});
		
		function groupNoticeUpdate(data){
			$("#groupNoticeForm"+data).toggle();
			$("#noticeContent"+data).toggle();
		}
	</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- banner -->
	<div class="group-banner" style="background-image:url('<c:url value='/resources/images/group_img/group-package-banner.jpg' />');"></div>
	
	<!-- Content -->
    <div class="container group-container">
        <div class="row">
            <div class="col-lg-8">

                <!-- Title -->
                <h1>${groupVO.group_pak_title}</h1>

                <!-- Author -->
                <p class="lead">
                    by <a href="#">${groupVO.group_pak_guide}</a>
                </p>

                <hr>

                <!-- Date/Time -->
                <p><span class="glyphicon glyphicon-time"></span> 등록일 : ${groupVO.group_pak_regDate}</p>

                <hr>

                <!-- Preview Image -->
				<img src="<c:url value="/resources/images/group_img/${groupVO.group_pak_photo}" />" style="width: 100%;">
                <!-- Post Content -->
                <p class="lead">
                	${groupVO.group_pak_content}
                </p>
                <hr>
				<p>나라 : ${groupVO.group_pak_place1} </p>
				<p>도시 : ${groupVO.group_pak_place2} </p>
				<p>상세 장소 : ${groupVO.group_pak_place3}</p>
				<p>가격(인당) : ${groupVO.group_pak_cost}</p>
				<p>
					총 인원 : ${groupVO.group_pak_min} ~ ${groupVO.group_pak_max} ( 최소 인원 ~ 최대 인원 )
					<c:if test="${flag1_check == true }">
						<font color="red">예약 자리 없음</font>
					</c:if>
				</p>
				<hr>
				<p>현재 인원 : ${groupVO.group_pak_current} </p>
                
                <!-- 수정 삭제 버튼 -->
				<se:authorize access="isAuthenticated()">
					<se:authentication property="principal.username" var="sessionID" />
					<c:if test="${groupVO.group_pak_guide == sessionID}">
						<form action="groupUpdateForm.go" method="post" style="display: inline;">
							<input type="hidden" name="group_pak_pk"
								value="${groupVO.group_pak_pk}" /> <input type="submit" value="수정"
								class="btn-custom" />
						</form>
						<form action="groupDeletePro.go" method="post" style="display: inline;">
							<input type="hidden" name="group_pak_pk"
								value="${groupVO.group_pak_pk}" /> <input type="submit" value="삭제"
								class="btn-custom" />
						</form>
					</c:if>
				</se:authorize>
				<hr>
				
				 <!-- Comments Form -->
				<c:if test="${groupVO.group_pak_guide == sessionID}">
                <div class="well">
                    <h4>추가 전달 사항:</h4>
                    <form action="../group_notice/group_notice_insert.go" method="post">
                        <div class="form-group">
                        	<input type="hidden" name="group_notice_writer" value="${sessionID}"/>
                        	<input type="hidden" name="group_notice_parent_pk" value="${groupVO.group_pak_pk}"/>
                            <textarea name="group_notice_content" class="form-control" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn-custom">등록</button>
                    </form>
                </div>
                <hr>
                </c:if>
                
                <!-- Comment -->
				<p>해당 상품 가이드의 공지사항</p>
				<c:forEach items="${groupNoticeList}" var="groupNotice">
					<div class="media">
	                    <a class="pull-left" href="#">
	                        <img class="media-object" src="http://placehold.it/64x64" alt="">
	                    </a>
	                    <div class="media-body">
	                        <h4 class="media-heading">${groupNotice.group_notice_writer}
	                            <small>${groupNotice.group_notice_regDate}</small>
	                        </h4>
	                        <span id="noticeContent${groupNotice.group_notice_pk}">${groupNotice.group_notice_content}</span>
	                        <!-- 글 작성자만 볼 수 있음 -->
							<c:if test="${groupVO.group_pak_guide == sessionID}">
		                        <input type="button" value="수정" class="btn btn-default btn-sm" onclick="groupNoticeUpdate(${groupNotice.group_notice_pk})"/>
		                        <input type="button" value="삭제" class="btn btn-default btn-sm" onclick="location='../group_notice/group_notice_delete.go?group_notice_pk=${groupNotice.group_notice_pk}&group_notice_parent_pk=${groupVO.group_pak_pk}'"/>
		                        <form action="../group_notice/group_notice_update.go"  name="groupNoticeForm" id="groupNoticeForm${groupNotice.group_notice_pk}" method="post">
	                        		<input type="hidden" name="group_notice_parent_pk" value="${groupVO.group_pak_pk}"/>
		                        	<input type="hidden" name="group_notice_pk" value="${groupNotice.group_notice_pk}"/>
		                        	<textarea name="group_notice_content" class="form-control" rows="3">${groupNotice.group_notice_content}</textarea>
		                        	<input type="submit" value="등록" class="btn btn-primary btn-sm"/>
		                        </form>
	                        </c:if>
	                    </div>
	                </div>
				</c:forEach>
            </div>

            <!-- Sidebar Widgets Column -->
            <div class="col-md-4">
                <!-- Blog Search Well -->
                <div class="well">
                    <h4>여행 상품 신청 및 취소</h4>
                    <!-- 신청 -->
                    <c:if test="${flag1_check != true }">
                    <form action="../m_group/m_groupInsertForm.go" method="post" style="display:inline;">
                    	<input type="hidden" name="group_mem_package_pk" value="${groupVO.group_pak_pk}"/>
                    	<input type="hidden" name="group_mem_reserve_id" value="${sessionID}"/>
                    	<button type="submit" class="btn-custom">신청</button>
					</form>
					</c:if>
                    <c:if test="${flag1_check == true }">
                    	<font color="red">신청불가</font>
                    </c:if>
                    
                    <!-- 예약 취소 -->
					<form action="../m_group/m_groupDeleteForm.go" method="post" style="display:inline;">
                    	<input type="hidden" name="group_mem_package_pk" value="${groupVO.group_pak_pk}"/>
                    	<input type="hidden" name="group_mem_reserve_id" value="${sessionID}"/>
                    	<button type="submit" class="btn-custom">예약취소</button>
					</form>
					
					<!-- 예약한 손님 목록(글 작성자만 확인 가능) -->
					<c:if test="${groupVO.group_pak_guide == sessionID}">
					<form action="../m_group/m_groupListForm.go" method="post" style="display:inline;">
                    	<input type="hidden" name="group_mem_package_pk" value="${groupVO.group_pak_pk}"/>
                    	<button type="submit" class="btn-custom">손님 목록</button>
					</form>
					</c:if>
                    <!-- /.input-group -->
                </div>

                <!-- Blog Categories Well -->
                <div class="well">
                    <h4>이와 비슷한 상품</h4>
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>

                <!-- Side Widget Well -->
                <div class="well">
                    <h4>인기 있는 상품</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus laudantium odit aliquam repellat tempore quos aspernatur vero.</p>
                </div>

            </div>

        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
    
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
	
</body>
</html>