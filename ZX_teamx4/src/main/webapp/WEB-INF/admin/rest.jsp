<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/resources/css/myshop.css?ver=0.1" rel="stylesheet">

<script type="text/javascript">

	function deleterest(restnum,pageNumber){
		
		var result = confirm("정말로 삭제 하시겠습니까?");
		console.log(restnum);
		console.log(pageNumber);
		if(result){
			location.href="deleterest.admin?restnum="+restnum+"&pageNumber="+pageNumber;
		}
		else{
			alert("취소되었습니다");
		}
		
	}
function updaterest(restnum,pageNumber){
		
		var result = confirm("정말로 수정 하시겠습니까?");
		console.log(restnum);
		console.log(pageNumber);
		if(result){
			location.href="updaterest.admin?restnum="+restnum+"&pageNumber="+pageNumber;
		}
		else{
			alert("수정안한다");
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
   		 <form action="rest.admin" align="center">
    	<select name="column">
    		<option value="all">전체</option>
    		<option value="name">상호명</option>
    		<option value="addr">주소명</option>
    	</select>
    	<input type="text" name="keyword">
    	<input type="submit" value="검색">
    </form>
    
		<table class="admin_table_2" width="100%">
		 <colgroup>
		 	<col style="width: 100px"/>
		 </colgroup>
			<tr>
				<th>메인사진</th>
				<th>상호명</th>
				<th>전화번호</th>
				<th>좋아요</th>
				<th>수정</th>
				<th>삭제</th>
				
			</tr>
				<c:forEach var="user" items="${ub}">
			<tr class="admin_table_items">
				<td ><img src="${user.restmainimg }" style="width:200px; height:200px;"></td>
				<td >${user.restname }</td>
				<td >${user.resttel }</td>
				<td >${user.restlike }</td>
				<td><a href="#" onClick="updaterest('${user.restNum}','${pg.pageNumber}')">
				<img src="${pageContext.request.contextPath}/resources/css/edit.png"></a></td>
				<td><a href="#" onClick="deleterest('${user.restNum}','${pg.pageNumber}')">
				<img src="${pageContext.request.contextPath}/resources/css/delete.png"></a></td>
				
			</tr>
				</c:forEach>
		</table>
   
   
   </div>
   <footer>
      <center> ${pg.pagingHtml}</center>
      </footer>
   </body>