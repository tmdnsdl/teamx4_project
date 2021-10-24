<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<html>
<head>
<meta charset="utf-8">
<!-- jQuery -->
<link type="text/css" rel="stylesheet" href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/jqueryui/1.11.4/jquery-ui.min.css?201709272" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css?201709272" />
<link rel="stylesheet" href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/css/common.css?201709272" />
<link rel="stylesheet" href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/css/user_web.css?201709272" />
<link rel="shortcut icon" type="image/x-icon" href="resources/images/logo.png" />
<style>
body {
	font-family: 'AppleSDGothicNeo-Regular', 'Nanum Gothic', Helvetica, Arial, sans-serif;
}
.td_span{
	display:block;
	margin-top:3px;
}
.btn_deleteReview{
	border:none;
	background-color:white;
	cursor:pointer;
}
.btn_updateReview{
	border:none;
	background-color:white;
	cursor:pointer;
	margin-bottom:16px;
}
.review_page{
	text-align:center;
	font-size:18px;
}

.review_page a{
	text-decoration:none;
	font-size:18px;
}
.Rest_header{
		display:flex;
   		align-items: center;
  		justify-content: space-between;
  		width: 100%;
  		margin-bottom: 10px;
       }
.Rest_Review{
         	list-style: none;	
        }
.Rest_Review_score{
	float : right;
	margin-right:8px;
	font-family : bold;
	color :gray;
}
.button_tooltip{
	width:30px;
	height:30px;
	display: inline-block;
}
.tooltip_button{
	width:30px;
	height:30px;
}
.button_tooltip_text {
  display: none;
  position: absolute;
  max-width: 200px;
  border: 1px solid;
  border-radius: 5px;
  padding: 5px;
  font-size: 1em;
  color: white;
  background:gray;
}
.button_tooltip:hover .button_tooltip_text {
  display: block;
}
</style>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	function deleteReviewlist(num){
		 $.ajax({
	  		 url : '/ex/deleteReviewlist.me',
	  		 data:({
	  			reviewNum : num 
	  		 }),
	  		 success : function(data){
	  			 console.log('deleteReview 성공');
	  			 location.href="reviewlist.me";
	  		 }
		 });
	}
	function updateReviewForm(num){
		 location.href="reviewUpdate.tm?reviewNum="+num;
	}
</script>
</head>
<body>
<div class="warp">
	<%@ include file="../common/header.jsp"%>
		<div id="div_activate" class="container">
			<div class="title" style="text-align:center;">
				<div class="row">내 리뷰 보기</div>
			</div>
			<div class="row">
				<c:if test="${fn:length(lists)==0}">
					<div class="title" style="text-align:center;">
						작성한 리뷰가 없습니다 <br>리뷰를 작성해주세요
					</div>
				</c:if>
			<table id="tbl_info" class="table table-user">
				<c:forEach var="review" items="${lists}">
				<tr>
					<td style="width:30%;">
						<a href="detail.rest?restnum=${review.restNum}">
							<img src="<%=request.getContextPath()%>/resources/upload/file/${review.reviewImage}" width="150" height="150">
						</a>
					</td>
					<td style="width:60%;"> 
						<div class="Rest_header">
							<b style="font-size:16px;">${review.restName}</b>
							<ul class="Rest_Review">
	                    		<li class="Rest_Review_score">서비스(${review.reviewService }) </li>
	                    		<li class="Rest_Review_score">가격(${review.reviewPrice }) |</li>
	                    		<li class="Rest_Review_score">맛(${review.reviewTaste }) |</li>
	                   			<li class="Rest_Review_score">전체(${review.reviewStar }) |</li>
	                        </ul>
                        </div>
						<span class="td_span">${review.reviewContent}</span>
					</td>
					<td style="width:10%;">
						<button type="button" class="btn_updateReview" onclick="updateReviewForm(${review.reviewNum});">
							<span class="button_tooltip">
								<img class="tooltip_button" src="<%=request.getContextPath()%>/resources/images/edit_modify_icon_149488.png">
								<span class="button_tooltip_text">수정</span>
							</span>
						</button>
						<button type="button" class="btn_deleteReview" onclick="deleteReviewlist(${review.reviewNum});">
							<span class="button_tooltip">
								<img class="tooltip_button" src="<%=request.getContextPath()%>/resources/images/delete_4219.png">
								<span class="button_tooltip_text">삭제</span>
							</span>
						</button>
					</td>
				</tr>
				</c:forEach>
			</table>
			<p class="review_page">${page.pagingHtml}</p>
		</div>
	</div>
</div>
</body>
</html>