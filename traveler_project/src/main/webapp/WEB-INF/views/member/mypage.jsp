<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>마이페이지</title>
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
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
        margin-top : 30px;
        float: left;
        border: 1px solid #bcbcbc;
      }
      #jb-content1-1{
      float: left;
      }
      #jb-content1-2{
      margin-top: 10px;
  	  margin-left: 220px;
      }
      #jb-content1-3{
 	   margin-top: 20px;
      } 
      
      #jb-content2 {
        width: 33%;
        height: 320px;
        padding: 10px;
        margin-top : 30px;
        margin-left: 13px;
        float: right;
        border: 1px solid #bcbcbc;
      }
      
      #jb-footer {
        float: none;
        height: 250px;
        margin-top: 375px;
        padding: 10px;
        background-color: #E3F6CE;
      }
        #jb-footer1 {
        float: left;
        width: 180px;
        margin-left: 15px;
        height: 180px;
        background-color: #D0F5A9;
      }
         #jb-footer2 {
        float: left;
        width: 180px;
        margin-left: 15px;
        height: 180px;
        background-color: #D0F5A9;
      }
         #jb-footer3 {
        float: left;
        width: 180px;
        margin-left: 15px;
        height: 180px;
        background-color: #D0F5A9;
      }
         #jb-footer4 {
        float: left;
        width: 180px;
        margin-left: 15px;
        height: 180px;
        background-color: #D0F5A9;
      }
    </style>
  </head>
  <script type="text/javascript">
  $(function(){
	  var hover1 = $('.hover1');
	  hover1.hover(function(){
	    hover1.css('background-color','#BEF781');
	  },function(){
	    hover1.css('background-color','#D0F5A9');
	  });
	  var hover2 = $('.hover2');
	  hover2.hover(function(){
	    hover2.css('background-color','#BEF781');
	  },function(){
	    hover2.css('background-color','#D0F5A9');
	  });
	  var hover3 = $('.hover3');
	  hover3.hover(function(){
	    hover3.css('background-color','#BEF781');
	  },function(){
	    hover3.css('background-color','#D0F5A9');
	  });
	  var hover4 = $('.hover4');
	  hover4.hover(function(){
	    hover4.css('background-color','#BEF781');
	  },function(){
	    hover4.css('background-color','#D0F5A9');
	  });
	});
  
  </script>
  <body>
  	<!-- header -->
	<jsp:include page="../header.jsp" />
   
   <font size="3">
    <div id="jb-container">
 
    	<h2>&nbsp;&nbsp;마이페이지</h2>
      	
      	<ul class="nav nav-tabs">
 		<li class="active"><a href="#">마이페이지</a></li>
  		<li><a href="#">구매내역</a></li>
  		<li><a href="#">상담내역</a></li>
  		<li><a href="#">회원정보</a></li>
  		<li><a href="#">비밀번호변경</a></li>
  		<li><a href="#">결제정보</a></li>
		</ul>
     
      <div id="jb-header">	
      		안녕하세요! ${ list.member_name } 님<br> 여행가를 이용해 주셔서 항상 감사합니다.
      <div>
      <div id="jb-content1">
      	회원정보<hr>
	      <div title="photo" id="jb-content1-1">
	      	<c:if test="${ list.member_profile == null }">
			<img style="width: 208px; height: 208px;" src="<c:url value='/resources/images/profile.jpg' />" alt="">
			</c:if>
			<c:if test="${ list.member_profile != null }">
			<img src="<c:url value='/resources/images/profiles/${list.member_profile}' />" class="img-rounded" alt="Cinque Terre" style="width: 208px; height: 208px;">
			</c:if>
	      </div>
	      <div title="text" id="jb-content1-2">
		     <table>
		      <tr>
		      
		      <td><input type="image" style="width: 15px; height: 15px;" src="<c:url value='/resources/images/icons/id-card.png' />" alt="">&nbsp;ID</td>
		      <td> ${ list.member_id }</td></tr>
		      <tr><td><input type="image" style="width: 15px; height: 15px;" src="<c:url value='/resources/images/icons/id-card.png' />" alt="">&nbsp;닉네임</td>
		      <td> ${ list.member_nickName }</td></tr>
		      <tr><td><input type="image" style="width: 15px; height: 15px;" src="<c:url value='/resources/images/icons/id-card.png' />" alt="">&nbsp;휴대폰번호</td>
		      <td> ${ list.member_tel }</td></tr>
		      <tr><td><input type="image" style="width: 15px; height: 15px;" src="<c:url value='/resources/images/icons/id-card.png' />" alt="">&nbsp;이메일</td>
		      <td> ${ list.member_email }</td></tr>
		      <tr><td><input type="image" style="width: 15px; height: 15px;" src="<c:url value='/resources/images/icons/id-card.png' />" alt="">&nbsp;국가</td>
		      <td> ${ list.member_nationality }</td></tr>
		      <tr><td><input type="image" style="width: 15px; height: 15px;" src="<c:url value='/resources/images/icons/id-card.png' />" alt="">&nbsp;언어</td>
		      <td>  ${ list.member_language }</td></tr>
		      </table>
		  <div title="link" id="jb-content1-3">
		  <input type="button" value="가이드신청" class="btn btn-default" onclick="location='guideForm.go'">
		 <input type="button" value="정보수정" class="btn btn-default" onclick="location='memberInsertDetail.go'">
		
		 <div align="right"><a href="/member/memberDeleteForm.go">회원탈퇴</a></div>
		  </div>
	      </div>
      </div>
      
      <div id="jb-content2">상담내역
      <hr>
   		    내용
      </div>
    	</div>
    	 <div id="jb-footer">
        	나의 상품 내역(가이드일때만)
        	
        	<div style="margin-left: 20px; margin-top: 10px;">
        	<div id="jb-footer1" class="hover1">1</div>
        	<div id="jb-footer2" class="hover2">2</div>
        	<div id="jb-footer3" class="hover3">3</div>
        	<div id="jb-footer4" class="hover4">4</div>
        	</div>
        </div>
      
        </div>
       </div>
       </font>
      
  </body>
</html>