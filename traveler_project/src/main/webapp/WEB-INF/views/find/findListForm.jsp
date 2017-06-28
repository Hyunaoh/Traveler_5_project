<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>여행을 더하다</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />

<section id="fh5co-counters" style="background-image: url(<c:url value='/resources/images/full_image_1.jpg' />);" data-stellar-background-ratio="0.5">
	<div class="fh5co-overlay"></div>

	<!-- Page Content -->
    <div class="container">
        <div class="row">
        	<!-- Title -->
        	<div class="col-md-12 section-heading text-center to-animate">
				<h2>가이드 찾기</h2>
			</div>
            <div class="fh5co-counter col-lg-8">
                <!-- Banner Image -->
                <img class="img-responsive to-animate" src="<c:url value='/resources/images/banner-find.jpg' />" alt="">
                <hr>
                <!-- Post Content -->
                <div class="row">
					<div class="col-md-12 col-sm-6 col-xs-12">
						<div class="fh5co-counter to-animate">
							<div class="row">
		      					<div class="col-md-3">
								Title
		      					</div>
		      					<div class="col-md-2">
								Writer
		      					</div>
		      					<div class="col-md-4">
								RegDate
		      					</div>
		      					<div class="col-md-1">
								View
		     					</div>
		     					<div class="col-md-1">
		      					</div>
							</div>
							<c:forEach items="${findList}" var="list">
	              				<div class="well row">
	              					<div class="col-md-3">
										<a href="findDetailForm.go?find_pk=${list.find_pk}">${list.find_title}</a>
	              					</div>
	              					<div class="col-md-2">
										${list.member_id}
	              					</div>
	              					<div class="col-md-4">
										${list.find_regDate}
	              					</div>
	              					<div class="col-md-1">
										100
	              					</div>
	              					<div class="col-md-1">
										<a class="btn btn-default btn-sm" href="findUpdateForm.go?find_pk=${list.find_pk}">수정</a>
	              					</div>
	              					<div class="col-md-1">
										<a class="btn btn-default btn-sm" href="findDeletePro.go?find_pk=${list.find_pk}">삭제</a>
	              					</div>
								</div>
							</c:forEach>
							<hr>
							<i class="fh5co-counter-icon icon-briefcase to-animate-2"></i>
							<span class="fh5co-counter-number js-counter" data-from="0" data-to="89" data-speed="5000" data-refresh-interval="50">89</span>
							<span class="fh5co-counter-label">게시물 개수</span>
						</div>
					</div>
				</div>
				<hr>
			</div>
            <!-- Sidebar Widgets Column -->
            <div class="fh5co-counter to-animate col-md-4">
                <!-- Write Well -->
                <div class="well">
              		<a href="findInsertForm.go">글 작성</a>
                </div>
                <!-- Search Well -->
                <div class="well">
                   	<form action="" method="post" class="input-group">
                        <input type="text" class="form-control">
                        <span class="input-group-btn" style="height:100%;">
							<button class="btn btn-default" type="button" style="height:100%;">
								<span class="glyphicon glyphicon-search"></span>
							</button>
                        </span>
					</form>
                </div>

                <!-- Blog Categories Well -->
                <div class="well">
                    <h4>Blog Categories</h4>
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
                    <h4>Side Widget Well</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus laudantium odit aliquam repellat tempore quos aspernatur vero.</p>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->
</section>
</body>
</html>