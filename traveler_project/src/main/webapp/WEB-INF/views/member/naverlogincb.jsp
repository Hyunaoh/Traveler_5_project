<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("DqftzUBEom_HWFvpmKTh");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    /* alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age'));
    alert(naver_id_login.getProfileData('name'));
    alert(naver_id_login.getProfileData('gender')); */
    
    document.getElementById('nemail').value = naver_id_login.getProfileData('email');
    document.getElementById('nnickname').value = naver_id_login.getProfileData('nickname');
    document.getElementById('nage').value = naver_id_login.getProfileData('age');
    document.getElementById('nname').value = naver_id_login.getProfileData('name');
    document.getElementById('ntoken').value = naver_id_login.oauthParams.access_token;
    document.getElementById('ngender').value = naver_id_login.getProfileData('gender');
    
    document.naverlogin.submit();
  }
</script>

<form action="loginvalue.go" method="post" name="naverlogin">
	<input type="hidden" id="ntoken" name="n_token" value="">
	<input type="hidden" id="nemail" name="n_email" value="">
	<input type="hidden" id="nnickname" name="n_nickname" value="">
	<input type="hidden" id="nage" name="n_age" value="">
	<input type="hidden" id="ngender" name="n_gender" value="">
	<input type="hidden" id="nname" name="n_name" value="">
</form>

</body>
</html>