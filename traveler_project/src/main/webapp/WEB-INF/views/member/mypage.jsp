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
        height: 270px;
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
      	
      	<div role="tabpanel">
      	<ul class="nav nav-tabs" role="tablist">
 		<li role="presentation" class="active"><a href="#myPage" role="tab" data-toggle="tab">마이페이지</a></li>
  		<li role="presentation"><a href="#purchase" role="tab" data-toggle="tab">구매내역</a></li>
  		<li role="presentation"><a href="#QnA" role="tab" data-toggle="tab" >Q&A</a></li>
  		<li role="presentation"><a href="#change" role="tab" data-toggle="tab" >비밀번호변경</a></li>
  		<li role="presentation" ><a href="#pay" role="tab" data-toggle="tab" >결제정보</a></li>
		</ul>
     
     <!-- 탭내용 -->
     <div class="tab-content">
     
     <!-- 마이페이지 -->
     <div role="tabpanel" class="tab-pane fade in active" id="myPage">
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
    	
    	
    	<!-- 탭 기능 -->
    	<div id="jb-footer">
    	<div role="tabpanel">
    	 <ul class="nav nav-pills" role="tablist">
			  <li role="presentation" class="active"><a href="#private" role="tab" data-toggle="tab">개인패키지</a></li>
			  <li role="presentation"><a href="#group" role="tab" data-toggle="tab">그룹패키지</a></li>
		</ul>
			<!--  탭 내용  -->
			<div class="tab-content">
			
			<!-- 개인패키지 -->
			<div role="tabpanel" class="tab-pane fade in active" id="private">
        	<div style="margin-left: 20px; margin-top: 10px;">
        	<c:forEach items="${ list2 }" var="list2">
        	<div id="jb-footer1" class="hover1">
        	<img style="width: 180px; height: 180px;" src="<c:url value='/resources/images/package_img/123.jpg' />" alt=""></div>
        	</c:forEach>
        	</div>
        	</div>
        	
        	
        	<!-- 단체패키지 -->
        	<div role="tabpanel" class="tab-pane fade in" id="group">
        	되나?
        	</div>
        	
        	</div>
        </div>
      	</div>
      	</div>
      	
      	</div>
      	<!-- 구매내역 -->
      	<div role="tabpanel" class="tab-pane fade in active" id="purchase"></div>
      	
      	<!-- Q&A -->
      	<div role="tabpanel" class="tab-pane fade in active" id="QnA"></div>
      	
      	<!-- 비밀번호변경 -->
      	<div role="tabpanel" class="tab-pane fade in active" id="change"></div>
      	
      	<!-- 결제 -->
      	<div role="tabpanel" class="tab-pane fade in active" id="pay"></div>
    
    
    
    
       
       </div>
      
       </div> 
       </font>   
  </body>
</html>