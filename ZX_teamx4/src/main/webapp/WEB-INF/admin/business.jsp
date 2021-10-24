<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.request.contextPath}/resources/css/myshop.css?ver=0.1" rel="stylesheet">
<script type="text/javascript">

	function deletebusi(usernum,pageNumber){
		
		var result = confirm("정말로 삭제 하시겠습니까?");
		console.log(usernum);
		console.log(pageNumber);
		if(result){
			location.href="deletebusi.admin?usernum="+usernum+"&pageNumber="+pageNumber;
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
   		 <form action="business.admin" align="center">
    	<select name="column">
    		<option value="all">전체</option>
    		<option value="diningname">사업자이름</option>
    		<option value="diningreg">사업자번호</option>
    		<option value="addr">지역</option>
    	</select>
    	<input type="text" name="keyword">
    	<input type="submit" value="검색">
    </form>
    
		<table class="admin_table_2" width="100%">
		 <colgroup>
		 	<col style="width: 80px"/>
		 </colgroup>
			<tr>
				<th>회원번호</th>
				<th>회원등급</th>
				<th>회원사진</th>
				<th>회원이름</th>
				<th>이메일</th>
				<th>가게이름</th>
				<th>가게주소</th>
				<th>사업자번호</th>
				<th>사업자HP</th>
				<th>성별</th>
				<th>사업자탈퇴</th>
			</tr>
				<c:forEach var="user" items="${ub}">
			<tr class="admin_table_items">
				<td >${user.user_num }</td>
				<td >${user.user_type }</td>
				<td ><img
				<c:if test="${fn:startsWith(user.user_image, 'http://k.kakaocdn.net/')}">src="${user.user_image}"</c:if>
				<c:if test="${!fn:startsWith(user.user_image, 'http://k.kakaocdn.net/')}">src="<%=request.getContextPath()%>/resources/images/${user.user_image}"</c:if> style="width:100px; height:100px;"></td>
				<td >${user.user_name }</td>
				<td >${user.user_email }</td>
				<td >${user.user_diningName }</td>
				<td >${user.user_diningAddr }</td>
				<td> ${user.user_diningReg }</td>
				<td> ${user.user_diningHp }</td>
				<td >${user.user_gender }</td>
				<td><a href="#" onClick="deletebusi('${user.user_num}','${pg.pageNumber}')">
				<img src="${pageContext.request.contextPath}/resources/css/delete.png"></a></td>
			</tr>
				</c:forEach>
		</table>
   
   
   </div>
   <footer class="admin_footer">
      <center> ${pg.pagingHtml}</center>
      </footer>
   </body>