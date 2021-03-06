<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/review/star.css">
<script src="../../../resources/js/review/jquery-1.11.3.min.js"></script>
</head>
<body>
	<form action="reviewWritePro.go" method="post">
		<span class="star-input">
			<span class="input">
		    	<input type="radio" name="review_score" value="1" id="p1">
		    	<label for="p1">1</label>
		    	<input type="radio" name="review_score" value="2" id="p2">
		    	<label for="p2">2</label>
		    	<input type="radio" name="review_score" value="3" id="p3">
		    	<label for="p3">3</label>
		    	<input type="radio" name="review_score" value="4" id="p4">
		    	<label for="p4">4</label>
		    	<input type="radio" name="review_score" value="5" id="p5">
		    	<label for="p5">5</label>
		    	<input type="radio" name="review_score" value="6" id="p6">
		    	<label for="p6">6</label>
		    	<input type="radio" name="review_score" value="7" id="p7">
		    	<label for="p7">7</label>
		    	<input type="radio" name="review_score" value="8" id="p8">
		    	<label for="p8">8</label>
		    	<input type="radio" name="review_score" value="9" id="p9">
		    	<label for="p9">9</label>
		    	<input type="radio" name="review_score" value="10" id="p10">
		    	<label for="p10">10</label>
		 	</span>
		  	<output for="review_score"><b>0</b>점</output>						
		</span>
		<script src="../../../resources/js/review/star.js"></script>
		<!-- test1 은 나중에 전부 세션으로 대체 -->
		<input type="text" name="member_id" value="${user }" readonly="readonly"><br>
		<input type="hidden" name="package_pk" value="${package_pk }"> <br>
		<input type="text" name="review_comment"> <br>
		<!-- 보안상 CSRF 값 넘겨줌 --> 
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>