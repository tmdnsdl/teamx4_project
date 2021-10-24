<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" type="image/x-icon" href="resources/images/logo.png" />
<!-- jQuery -->
<link type="text/css" rel="stylesheet" href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/jqueryui/1.11.4/jquery-ui.min.css?201709272" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css?201709272" />
<link rel="stylesheet" href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/css/common.css?201709272" />
<link rel="stylesheet" href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/css/user_web.css?201709272" />
<style>
body {
	font-family: 'AppleSDGothicNeo-Regular', 'Nanum Gothic', Helvetica, Arial, sans-serif;
}
.td_span{
	display:block;
	margin-top:3px;
}
.btn_deletelike{
	border:none;
	background-color:white;
	cursor:pointer;
}
.like_page{
	text-align:center;
	font-size:18px;
}

.like_page a{
	text-decoration:none;
	font-size:18px;
}
</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	function deleteLikelist(num){
		 $.ajax({
	  		 url : '/ex/deleteLikelist.me',
	  		 data:({
	  			restNum : num 
	  		 }),
	  		 success : function(data){
	  			 console.log('deletelike 성공');
	  			 location.href="likelist.me";
	  		 }
		 });
	}
</script>
</head>
<body>
<div class="warp">
	<%@ include file="../common/header.jsp"%>
		<div id="div_activate" class="container">
			<div class="title" style="text-align:center;">
				<div class="row">좋아요 리스트</div>
			</div>
			<div class="row">
				<c:if test="${fn:length(lists)==0}">
					<div class="title" style="text-align:center;">
						좋아요 리스트가 없습니다 <br>좋아요를 추가해보세요
					</div>
				</c:if>
			<table id="tbl_info" class="table table-user">
				<c:forEach var="rest" items="${lists}">
				<tr>
					<td style="width:30%;">
						<a href="detail.rest?restnum=${rest.restNum}">
							<img src="${rest.restMainImg}" width="150" height="150">
						</a>
					</td>
					<td style="width:60%;"> 
						<span><b style="font-size:18px;">${rest.restName}</b></span>
						<span class="td_span">영업일 : ${rest.restTime1}</span>
						<span class="td_span">영업시간 : ${rest.restTime2}</span>
						<span class="td_span">주소 : ${rest.restAdress}</span>
					</td>
					<td style="width:10%;">
						<button type="button" class="btn_deletelike" onclick="deleteLikelist(${rest.restNum});">
							<img src="<%=request.getContextPath()%>/resources/images/delete_4219.png" style="width:30px; height:30px;">
						</button>
					</td>
				</tr>
				</c:forEach>
			</table>
			<p class="like_page">${page.pagingHtml}</p>
		</div>
	</div>
</div>
</body>
</html>