<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user logout</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	Kakao.init('50f8c205c33579235018b30cc602581b');
	console.log(Kakao.isInitialized());
	window.onload = function(){
		//카카오 로그아웃  
	    if (Kakao.Auth.getAccessToken()) {
	      	Kakao.Auth.logout(function(response){
      			console.log(response);	
      			localStorage.clear();
      			location.href='/ex/main.tm';
	      	});
	    }
	}  
</script>
</head>
<body>
</body>
</html>