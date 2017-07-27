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
			
			var dataForm = {
				group_mem_package_pk : $("[name=group_mem_package_pk]").eq(0).val()
			};
			
			$.ajax({
				url : "m_groupGetInfoAjax.go",
				method : 'POST',
				type : 'json',
				data : JSON.stringify(dataForm),
				contentType : "application/json",
				success : function(data) {
					for(var i=0; i< data.length; i++) {
						if(data[i].group_mem_age <= 10){
							data1 = data1 + 1;
						} else if(data[i].group_mem_age > 10 && data[i].group_mem_age <= 20){
							data2 = data2 + 1;
						} else if(data[i].group_mem_age > 20 && data[i].group_mem_age <= 25){
							data3 = data3 + 1;
						} else if(data[i].group_mem_age > 25 && data[i].group_mem_age <= 30){
							data4 = data4 + 1;
						} else if(data[i].group_mem_age > 30 && data[i].group_mem_age <= 35){
							data5 = data5 + 1;
						} else if(data[i].group_mem_age > 35 && data[i].group_mem_age <= 40){
							data6 = data6 + 1;
						} else if(data[i].group_mem_age > 40 && data[i].group_mem_age <= 50){
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
			          title: '평균 연령',
			          is3D: true
			        };
			
			        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
			
			        chart.draw(data, options);
				},
				error : function(result, status, er) {
					alert("2");
				}
			});
			
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
		<h1 class="m_group-header">예약한 손님</h1>
		<div class="col-md-6">
			<c:forEach items="${m_groupList}" var="list">
				<div class="row">
					<div class="col-md-12">
						<!-- 예약자 대표 ID -->
						<label>예약자 ID</label><br>
						${list.group_mem_reserve_id}
						<br>
						
						<!-- 이름 -->
						<label>이름</label><br>
						<c:if test="${list.group_mem_count == 1}">
							${list.group_mem_name} 님 (${list.group_mem_count}명)
						</c:if>
						<c:if test="${list.group_mem_count != 1}">
							${list.group_mem_name} 님 외 ${list.group_mem_count-1} 명 (총: ${list.group_mem_count}명)
						</c:if>
						<br>
						
						<!-- 연령 -->
						<c:if test="${list.group_mem_count == 1}">
							<label>연령</label>
						</c:if>
						<c:if test="${list.group_mem_count != 1}">
							<label>평균 연령</label>
						</c:if>
						<br>${list.avg_age}
						<br>
						
						<!-- 입급 여부 -->
						<label>입급 여부</label><br>
						<c:if test="${list.group_mem_status == 0}">
							미입금
						</c:if>
						<c:if test="${list.group_mem_status == 1}">
							입금
						</c:if>
						<c:if test="${list.group_mem_status != 1 and list.group_mem_status != 0 }">
							Error!
						</c:if>
						<br>
						
						<!-- 상세정보 보기 -->
						<form action="m_groupDetailForm.go" method="post">
							<input type="hidden" value="${list.group_mem_package_pk}" name="group_mem_package_pk" />
							<input type="hidden" value="${list.group_mem_reserve_id}" name="group_mem_reserve_id" />
							<input type="submit" value="자세한 내용 보기" class="btn-custom btn-sm"/>
						</form>
						
						<hr>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<!-- chart -->
		<div class="col-md-6">
			<div id="piechart_3d" style="width: 100%; height: 350px;"></div>
		</div>
		
	</div>
	
    <!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>