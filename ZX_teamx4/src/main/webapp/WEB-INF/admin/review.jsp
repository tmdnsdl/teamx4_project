<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/resources/css/myshop.css?ver=0.1" rel="stylesheet">
<script type="text/javascript">

	function deleteReview(reviewnum,pageNumber){
		
		var result = confirm("정말로 삭제 하시겠습니까?");
		console.log(reviewnum);
		console.log(pageNumber);
		if(result){
			location.href="deletereview.admin?reviewnum="+reviewnum+"&pageNumber="+pageNumber;
		}
		else{
			alert("취소되었습니다");
		}
		
	}
</script>
<header class="header-wrap"><a href="/ex/main.admin"><img src="resources/images/logo.png" style="width:400px;height:220px;"/></a></header>
    <title>관리자 페이지</title>
<body >
    <div class="menu" >
      <nav class="clearfix">
        <ul class="clearfix">
          <li><a href="main.admin">Home</a></li> 
          <li><a href="user.admin">user Info</a></li>
          <li><a href="business.admin">Business Info</a></li>
          <li><a href="rest.admin">Restaurant Info</a></li>
          <li><a href="review.admin">Review Info</a></li>
          
      </ul>
      <a id="pull" href="#"></a>
    </nav>
    </div>
   <div class="info_admin">
   		 <form action="review.admin" align="center">
    	<select name="column">
    		<option value="all">전체</option>
    		<option value="name">회원이름</option>
    		<option value="business">가게이름</option>
    	</select>
    	<input type="text" name="keyword">
    	<input type="submit" value="검색">
    </form>
    
		<table class="admin_table_2" width="100%">
		 <colgroup>
		 	<col style="width: 80px"/>
		 </colgroup>
			<tr>
				<th>회원아이디</th>
				<th>가게이름</th>
				<th>평가총점</th>
				<th>맛평가</th>
				<th>가격평가</th>
				<th>서비스평가</th>
				<th>리뷰내용</th>
				<th>리뷰쓴날짜</th>
				<th>리뷰삭제</th>
			</tr>
				<c:forEach var="user" items="${ub}">
			<tr class="admin_table_items">
				<td >${user.usernum }</td>
				<td >${user.restname }</td>
				<td >${user.reviewstar}</td>
				<td >${user.reviewtaste}</td>
				<td >${user.reviewprice }</td>
				<td >${user.reviewservice }</td>
				<td >${user.reviewcontent}</td>
				<td >${user.reviewdate }</td>
				<td><a href="#" onClick="deleteReview('${user.reviewnum}','${pg.pageNumber}')">
				<img src="${pageContext.request.contextPath}/resources/css/delete.png"></a></td>
			</tr>
				</c:forEach>
		</table>
   
   
   </div>
     <footer>
      <center> ${pg.pagingHtml}</center>
      </footer>
   </body>