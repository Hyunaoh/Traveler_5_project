<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행가 - 단체상품 수정</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	<br><br><br><br><br><br>
	<!-- content -->
	<form action="groupUpdatePro.go" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="group_pak_title" value="${groupVO.group_pak_title}" class="form-control"/><br>
		내용 : <textarea name="group_pak_content" class="form-control">${groupVO.group_pak_content}</textarea><br>
		사진 : <img src="<c:url value="/resources/images/group_img/${groupVO.group_pak_photo}" />">
		<br><input type="file" name="imgFile"/><br>
		나라 : <input type="text" name="group_pak_place1" value="${groupVO.group_pak_place1}" class="form-control"/><br>
		도시 : <input type="text" name="group_pak_place2" value="${groupVO.group_pak_place2}" class="form-control"/><br>
		상세장소 : <input type="text" name="group_pak_place3" value="${groupVO.group_pak_place3}" class="form-control"/><br>
		가격(인당) : <input type="number" name="group_pak_cost" min="0" value="${groupVO.group_pak_cost}" class="form-control"/><br>
		최소 인원 : <input type="number" min="1" value="${groupVO.group_pak_min}" name="group_pak_min" class="form-control"/><br>
		최대 인원 : <input type="number" min="1" value="${groupVO.group_pak_max}" name="group_pak_max" class="form-control"/><br>
		<div id="result_text"></div>
		<input type="hidden" name="group_pak_status" value="0" class="form-control"/><br>
		<input type="hidden" name="group_pak_pk" value="${groupVO.group_pak_pk}"/><br>
		<input type="hidden" name="group_pak_flag1" value="${groupVO.group_pak_flag1}"/><br>
		<input type="hidden" name="group_pak_flag2" value="${groupVO.group_pak_flag2}"/><br>
		<input type="submit" value="등록" class="btn btn-default btn-md"/>
	</form>
</body>
</html>