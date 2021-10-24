<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('50f8c205c33579235018b30cc602581b'); //발급받은 키 중 javascript키를 사용해준다.
window.onload = function(){
	//카카오 회원 탈퇴  
	if (Kakao.Auth.getAccessToken()) {
		  Kakao.API.request({
		    url: '/v1/user/unlink',
		    success: function (response) {
		    	console.log(response);
		    	localStorage.clear();
		    	location.href='/ex/main.tm';
		    },
		    fail: function (error) {
		      console.log(error);
		    },
		  })
		  Kakao.Auth.setAccessToken(undefined);
	}  
}
</script>
</head>
<body>

</body>
</html>