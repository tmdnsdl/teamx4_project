<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>Order By Seoul - teamx4</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- Kakao -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
// Kakao
Kakao.init('50f8c205c33579235018b30cc602581b');

$(document).ready(function() {
	if(Kakao.Auth.getAccessToken()){
		let userName = localStorage.getItem('name');
		$(".navWp").append('<li><a href="/ex/userInfo.me" style="padding-right:5px;">'+userName+'님</a> <a href="/ex/userInfo.me">마이페이지</a></li><li><a href="/ex/likelist.me">즐겨찾기</a></li><li><a href="/ex/reviewlist.me">마이리뷰</a></li><li><a href="/ex/logout.me">로그아웃</a></li>');
	}
	else{
		$(".navWp").append('<li><a href="/ex/login.me">로그인</a></li><li><a href="/ex/login.me">회원가입</a></li>');
	}
});

</script>
<style>
	.gnbWp {width:100%; height:60px; background:#fff; border-bottom:1px solid #ff7100; z-index:10;
	font-family:'Gowun Dodum', 'Malgun Gothic', Dotum, sans-serif; font-size:18px; letter-spacing:-1px; line-height:1;
	}
	.gnbWp.fixed {position:fixed; top:0; left:0;}
	.gnbWp h1.logo {float:left; font-size:36px; font-weight:bold; color:#ff7100; font-family:'Gowun Dodum', sans-serif; line-height:60px; text-align:left; width:auto; margin-left:15px; margin-top:0px; margin-bottom:0px; text-transform:uppercase;}
	.gnbWp ul.navWp {float:right; margin-right:15px; margin-top:0px; margin-bottom:0px;}
	.gnbWp ul.navWp li {float:left; height:60px; list-style: none;}
	.gnbWp ul.navWp li a {color:#555; font-size:18px; height:60px; line-height:60px; padding:0 15px; text-decoration:none;}
</style>
</head>
<header class="main_yang">
	<div class="gnbWp aft">
   		<a href="/ex/main.tm"><h1 class="logo">Order by Seoul</h1></a>
   		<ul class="navWp aft">
   		</ul>
    </div>
</header>
</html>

