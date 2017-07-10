<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행가 - 관리자 (가이드 상품)</title>

<style type="text/css">
		.cursor-point:hover{
			cursor: pointer;
			background-color: rgba(0,0,0,0.3);
		}
		#adminPackage-home {
		  background-color: transparent;
		  background-size: cover;
		  background-attachment: fixed;
		  background-image: url(/resources/images/bg.jpg);
		  position: relative;
		  width: 100%;
		 /*  background-color: #52d3aa; */
		  color: #fff;
		  overflow: hidden;
		}
		#adminPackage-home .gradient {
	 	 position: absolute;
		  top: 0;
		  bottom: 0;
		  left: 0;
		  right: 0;
		  z-index: 2;
		  opacity: .9;
		  -webkit-backface-visibility: hidden;
		}
</style>

<script type="text/javascript">
	$(document).ready(function(){
	
		/* 받은 메세지함 */
		$("#blackList").click(function() { 
	
				var dataForm = {
					member_id: $("#username").val()
				};
				
				$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
					url : "messageViewAjax.go",
					method : 'POST',
					type : 'json',
					data : JSON.stringify(dataForm),
					contentType : "application/json",
					success : function(result) 



</script>

</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<section id="fh5co-testimonials" data-section="testimonials">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">Testimonials</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<table>
								<button id="blackList" onclick="blackList()">블랙리스트만 보기</button>								
							
							</table>
						</div>
						
					
					</div>
				</div>
			</div>
			<div class=" fh5co-intro container">
			<div class="row row-bottom-padded-lg">
				<c:forEach items="${upapprovedlist}" var="list">
					<div class="fh5co-blockJIHO">
						<div class="overlay-darker"></div>
						<div class="overlay"></div>
						<div class="fh5co-text text-left" >
							<h3>${list.package_title}</h3>
							<div class="col-xs-4">
							작성자 : ${list.member_id}
							</div>
							<div class="col-xs-4">
							대상 국가 : ${list.package_place1}
							</div>
							<div class="col-xs-4 text-right">
								<p><a href="#" onclick="location='<c:url value="/package/packageDetailForm.go?package_pk=${list.package_pk}" />'" class="btn btn-primary">상세보기</a></p>
							</div>
							
							
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
			<%-- <div class="row">
				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2">
							<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.&rdquo;</p>
						</blockquote>
						<div class="author to-animate">
							<figure><img src="<c:url value="/resources/images/person1.jpg" />" alt="Person"></figure>
							<p>
							Jean Doe, CEO <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a> <span class="subtext">Creative Director</span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="box-testimony">
					
						<blockquote class="to-animate-2">
							<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.&rdquo;</p>
						</blockquote>
						<div class="author to-animate">
							<figure><img src=<c:url value="/resources/images/person2.jpg" /> alt="Person"></figure>
							<p>
							John Doe, Senior UI <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a> <span class="subtext">Creative Director</span>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2">
							<p>&ldquo;Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. &rdquo;</p>
						</blockquote>
						<div class="author to-animate">
							<figure><img src="<c:url value="/resources/images/person3.jpg" />" alt="Person"></figure>
							<p>
							Chris Nash, Director <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a> <span class="subtext">Creative Director</span>
							</p>
						</div>
					</div>
				</div>
				
				
			</div> --%>
		</div>
	</section>
	
	<!-- contents -->
	
	<section id="fh5co-intro" style="background-image: url(<c:url value='/resources/images/JIHO (1).jpg' />);">
		<div class="container">
			<div class="row row-bottom-padded-lg">
				<c:forEach items="${upapprovedlist}" var="list">
					<div class="fh5co-blockJIHO">
						<div class="overlay-darker"></div>
						<div class="overlay"></div>
						<div class="fh5co-text text-left" >
							<h3>${list.package_title}</h3>
							<div class="col-xs-4">
							작성자 : ${list.member_id}
							</div>
							<div class="col-xs-4">
							대상 국가 : ${list.package_place1}
							</div>
							<div class="col-xs-4 text-right">
								<p><a href="#" onclick="location='<c:url value="/package/packageDetailForm.go?package_pk=${list.package_pk}" />'" class="btn btn-primary">상세보기</a></p>
							</div>
							
							
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
						
	
</body>
</html>