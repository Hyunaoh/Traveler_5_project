<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행가 - 단체상품</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	<br><br><br><br>
	
	<!-- Content -->
    <div class="container">
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
				<p>총 인원 : ${groupVO.group_pak_min} ~ ${groupVO.group_pak_max} ( 최소 인원 ~ 최대 인원 )</p>
				<hr>
				<p>현재 인원 : ${groupVO.group_pak_current} </p>
                
                <!-- 수정 삭제 버튼 -->
				<se:authorize access="isAuthenticated()">
					<se:authentication property="principal.username" var="sessionID" />
					<c:if test="${groupVO.group_pak_guide == sessionID}">
						<form action="groupUpdateForm.go" method="post" style="display: inline;">
							<input type="hidden" name="group_pak_pk"
								value="${groupVO.group_pak_pk}" /> <input type="submit" value="수정"
								class="btn btn-primary btn-md" />
						</form>
						<form action="groupDeletePro.go" method="post" style="display: inline;">
							<input type="hidden" name="group_pak_pk"
								value="${groupVO.group_pak_pk}" /> <input type="submit" value="삭제"
								class="btn btn-primary btn-md" />
						</form>
					</c:if>
				</se:authorize>
				<hr>
				
				 <!-- Comments Form -->
				<c:if test="${groupVO.group_pak_guide == sessionID}">
                <div class="well">
                    <h4>추가 전달 사항:</h4>
                    <form action="" method="post">
                        <div class="form-group">
                            <textarea class="form-control" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">등록</button>
                    </form>
                </div>
                <hr>
                </c:if>
                
                <!-- Comment -->
				<p>해당 상품 가이드의 공지사항</p>
                <div class="media">
                    <a class="pull-left" href="#">
                        <img class="media-object" src="http://placehold.it/64x64" alt="">
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading">Start Bootstrap
                            <small>August 25, 2014 at 9:30 PM</small>
                        </h4>
                        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                    </div>
                </div>

                <!-- Comment -->
                <div class="media">
                    <a class="pull-left" href="#">
                        <img class="media-object" src="http://placehold.it/64x64" alt="">
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading">Start Bootstrap
                            <small>August 25, 2014 at 9:30 PM</small>
                        </h4>
                        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                        <!-- Nested Comment -->
                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="http://placehold.it/64x64" alt="">
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">Nested Start Bootstrap
                                    <small>August 25, 2014 at 9:30 PM</small>
                                </h4>
                                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                            </div>
                        </div>
                        <!-- End Nested Comment -->
                    </div>
                </div>

            </div>

            <!-- Sidebar Widgets Column -->
            <div class="col-md-4">
                <!-- Blog Search Well -->
                <div class="well">
                    <h4>여행 상품 신청 및 취소</h4>
                    <form action="../m_group/m_groupInsertForm.go" method="post" style="display:inline;">
                    	<input type="hidden" name="group_mem_package_pk" value="${groupVO.group_pak_pk}"/>
                    	<input type="hidden" name="group_mem_reserve_id" value="${sessionID}"/>
                    	<button type="submit" class="btn btn-primary btn-md">신청</button>
					</form>
					<form action="" method="post" style="display:inline;">
                    	<input type="hidden" name="group_mem_package_pk" value="${groupVO.group_pak_pk}"/>
                    	<input type="hidden" name="group_mem_reserve_id" value="${sessionID}"/>
                    	<button type="submit" class="btn btn-primary btn-md">취소</button>
					</form>
					<c:if test="${groupVO.group_pak_guide == sessionID}">
					<form action="" method="post" style="display:inline;">
                    	<input type="hidden" name="group_mem_package_pk" value="${groupVO.group_pak_pk}"/>
                    	<input type="hidden" name="group_mem_reserve_id" value="${sessionID}"/>
                    	<button type="submit" class="btn btn-primary btn-md">손님 목록</button>
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
</body>
</html>