<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CSS Star Ratings with Radio Buttons</title>
<link rel="stylesheet" href="../../../resources/css/review/star_css.css">
</head>
<body>

	<h1>Star Rating</h1>
	<form>
		<fieldset>
			<span class="star-cb-group"> 
				<input type="radio" id="rating-5" name="rating" value="5" /> 
				<label for="rating-5">5</label> 
				<input type="radio" id="rating-4" name="rating" value="4" checked="checked" /> 
				<label for="rating-4">4</label> 
				<input type="radio" id="rating-3"name="rating" value="3" />
				<label for="rating-3">3</label> 
				<input type="radio" id="rating-2" name="rating" value="2" />
				<label for="rating-2">2</label>
				<input type="radio" id="rating-1" name="rating" value="1" />
				<label for="rating-1">1</label> 
				<input type="radio" id="rating-0" name="rating" value="0" class="star-cb-clear" />
				<label for="rating-0">0</label>
			</span>
		</fieldset>
	</form>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="../../../resources/js/review/star_js.js"></script>
</body>
</html>