<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="utf-8">

<!-- jQuery -->
<link type="text/css" rel="stylesheet" href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/jqueryui/1.11.4/jquery-ui.min.css?201709272" />
<script type="text/javascript" src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/jquery/1.11.2/jquery.min.js?201709272"></script>
<script type="text/javascript" src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/jqueryui/1.11.4/jquery-ui.min.js?201709272"></script>
<link rel="shortcut icon" type="image/x-icon" href="resources/images/logo.png" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css?201709272" />
<link rel="stylesheet" href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/css/common.css?201709272" />
<link rel="stylesheet" href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/css/user_web.css?201709272" />
<style>
body {
	font-family: 'AppleSDGothicNeo-Regular', 'Nanum Gothic', Helvetica, Arial, sans-serif;
}
</style>
<script>
window.onload = function(){
	let user_image = document.getElementById('user_image').value;
	document.getElementById('img_photo').src=user_image;
}

function upload(){
	document.getElementById('uploadImage').click();
}

function setImage(event){
	let reader = new FileReader();
	reader.onload = function(event){
		document.getElementById('img_photo').src=event.target.result;
	}
	reader.readAsDataURL(event.target.files[0]);
}
</script>
</head>
<body>
<div class="warp">
	<%@ include file="../common/header.jsp"%>
	<div id="div_activate" class="container">
		<div class="title"><div class="row">회원정보 수정하기</div></div>
		<!-- 회원가입 폼 -->
		<div class="row">
			<form id="updateUser" method="POST" action="/ex/updateUser.me" enctype="multipart/form-data">
			<table id="tbl_info" class="table table-user">
				<tr id="tr_name">
					<th>이름</th>
					<td>
						<input type="hidden" name="user_num" value="${bean.user_num}">
						<input id="txt_name" name="user_name" class="input-text w400" type="text" value="${bean.user_name}" placeholder="이름" /><br /><br />
						teamx4에서 회원정보로 등록하실 이름을 입력해주세요. 영문 혹은 한글2~15자 이내로 입력해주세요.
					</td>
				</tr>
				<tr id="tr_email">
					<th>이메일</th>
					<td>
						<input id="txt_email" name="user_email" class="input-text w400" type="text" value="${bean.user_email}" placeholder="이메일" />
						<span id="lbl_email_check" style="display:none;"></span><br /><br />
						teamx4에서 이용하실 이메일을 입력해 주세요.
					</td>
				</tr>
				<tr id="tr_photo">
					<th>프로필 사진</th>
					<td>
						<div class="fl" style="width:110px; height:110px; background:url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/img-profile-default.png);">
							<input type="hidden" name="user_image" id="user_image" 
							<c:if test="${fn:startsWith(bean.user_image, 'http://k.kakaocdn.net/')}">value="${bean.user_image}"</c:if>
							<c:if test="${!fn:startsWith(bean.user_image, 'http://k.kakaocdn.net/')}">value="<%=request.getContextPath()%>/resources/images/${bean.user_image}"</c:if>>
							<img id="img_photo" src="" width="110" height="110" style="border-radius:50%;" />
						</div>
						<div class="fl" style="height:110px; padding-top:70px;">
							<input type="file" name="uploadImage" id="uploadImage" onchange="setImage(event)" style="display:none;">
							<button id="btn_image" type="button" class="btn btn-black w150" onclick="upload()" style="margin-left:12px; background-color:#ff7100">찾아보기</button>
						</div>
						<div class="clear"></div>
						<br /><br />
						teamx4의 회원 프로필 사진으로 사용될 이미지를 등록해 주세요.
					</td>
				</tr>
			</table>
			</form>
		</div> 

		<div class="row" style="padding:24px 0 0 40px;">
			<a id="btn_deactivate" href="/ex/deleteUser.me" style="color:#222222; text-decoration:none;">회원탈퇴하기</a>
		</div>
		<div class="row tc" style="padding:50px 0 55px 0;">
			<button id="btn_submit" type="button" class="btn btn-mint w400 fs-16" style="height:65px; background-color:#ff7100;" onclick="document.getElementById('updateUser').submit();">변경사항저장</button>
		</div>
	</div>
	</div>
</body>
</html>