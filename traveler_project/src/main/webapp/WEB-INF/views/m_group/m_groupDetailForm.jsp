<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 예약 현황</title>
	
	<!-- Group CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/group/group.css" />" />
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    	google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
	
		function drawChart() {
			var data1 = Number(0);
			var data2 = Number(0);
			var data3 = Number(0);
			var data4 = Number(0);
			var data5 = Number(0);
			var data6 = Number(0);
			var data7 = Number(0);
			var data8 = Number(0);
			
			var count = Number($("[name=member_age]").size());
			
    		for(var i=0; i< count; i++) {
    			if($("[name=member_age]").eq(i).val() <= 10){
    				data1 = data1 + 1;
    			} else if($("[name=member_age]").eq(i).val() > 10 && $("[name=member_age]").eq(i).val() <= 20){
    				data2 = data2 + 1;
    			} else if($("[name=member_age]").eq(i).val() > 20 && $("[name=member_age]").eq(i).val() <= 25){
    				data3 = data3 + 1;
    			} else if($("[name=member_age]").eq(i).val() > 25 && $("[name=member_age]").eq(i).val() <= 30){
    				data4 = data4 + 1;
    			} else if($("[name=member_age]").eq(i).val() > 30 && $("[name=member_age]").eq(i).val() <= 35){
    				data5 = data5 + 1;
    			} else if($("[name=member_age]").eq(i).val() > 35 && $("[name=member_age]").eq(i).val() <= 40){
    				data6 = data6 + 1;
    			} else if($("[name=member_age]").eq(i).val() > 40 && $("[name=member_age]").eq(i).val() <= 50){
    				data7 = data7 + 1;
    			} else {
    				data8 = data8 + 1;
    			}
    		}
			
			var data = google.visualization.arrayToDataTable([
				['연령', '인원 수'],
				['~10살',     data1],
				['10대',      data2],
				['21살~25살',  data3],
				['26살~30살', data4],
				['31살~35살',    data5],
				['36살~40살',    data6],
				['40대',    data7],
				['50대 이상',    data8],
			]);
	
	        var options = {
	          title: '연령',
	          is3D: true
	        };
	
	        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
	
	        chart.draw(data, options);
		}
    </script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- banner -->
	<div class="group-banner" style="background-image:url('<c:url value='/resources/images/group_img/group-package-banner.jpg' />');"></div>
	
	<!-- content -->
	<div class="container m_gorup-container">
		<div class="row">
			<div class="col-md-6">
				<c:forEach items="${m_groupList}" var="list">
					<div class="row">
						<div class="col-md-12 bg-color">
							<!-- 예약자 대표 ID -->
							<c:if test="${list.group_mem_id != '없음'}">
								<h3>회원</h3><br>
								<label>ID</label><br>
								${list.group_mem_id}
							</c:if>
							<c:if test="${list.group_mem_id == '없음'}">
								<h3>비회원</h3><br>
							</c:if>
							
							<!-- 이름 -->
							<label>이름</label><br>
							${list.group_mem_name} 님 <br>
							
							<!-- 연령 -->
							<label>연령</label><br>
							${list.group_mem_age}
							<input type="hidden" name="member_age" value="${list.group_mem_age}" /><br>
							
							<!-- 성별 -->
							<label>성별</label>
							<c:if test="${list.group_mem_gender == 'man'}">
								남성
							</c:if>
							<c:if test="${list.group_mem_gender == 'woman'}">
								여성
							</c:if>
							<hr>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<!-- side chart -->
			<div class="col-md-6">
				<div id="piechart_3d" style="width: 100%; height: 350px;"></div>
			</div>
			
		</div>
	</div>
	
    <!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>