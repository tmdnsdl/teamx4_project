<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.request.contextPath}/resources/css/detail.css?ver=0.1" rel="stylesheet">


<head>
	<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/common.css?1.4.16">
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/content.css?1.4.16">
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/layout.css?1.4.16">
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/main.css?1.4.16">
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/styleDefault.css?1.4.16">
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/sub.css?1.4.16">
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/jquery.rateyo.min.css?1.4.16">
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/swiper.min.css?1.4.16">
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/custom.css?1.4.16">
<link rel="shortcut icon" type="image/x-icon" href="resources/images/logo.png" />

<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b139d959b37e8342e3d67bd1979272a5&libraries=services"></script>

<style>
	#heart{
		cursor:pointer;
	}
</style>

</head>
<body onload="getlocationDetail()">
    <div id="wrap">
        <header class="header-wrap">
        <%@ include file="../common/header.jsp"%>
        </header>
        <div id="main">
            <section class="index__area">
            
            <header class="als-container" id="demo1">
            	   
  					
  					<div class="als-viewport">
   						 <ul class="als-wrapper">
   						 	<c:if test="${fn:length(viewImage) >50 }">
     						 <c:forEach begin="0" end="7" items="${viewImage }" var="v_img">
                    			<li class="als-item">
                    				<img width="270" height="300" src=${v_img } class="view_Image_Item">
                    			</li>
                    		</c:forEach>
                    		</c:if>
                    		
                    		<c:if test="${fn:length(viewImage)<51 }">
     						 <c:forEach begin="0" end="7" items="${viewImage }" var="v_img">
                    			<li class="als-item">
                    				<img width="270" height="300" src="${v_img}" class="view_Image_Item"> <!-- 파일경로지정해서사용 -->
                    			</li>
                    		</c:forEach>
                    		</c:if>
   						 </ul>
  					</div>
				
				
            </header>
                <!-- s :: area01 -->
                <article class="index__area--list">
              
                    <div class="index__area--item">
                    <!--  이미지슬라이 -->
              
				
                    	<!-- 헤더시  -->
                    	<header class="Main_title clearfix">
                    		<div >
                    		<div class="Main_title_Wrap">
                    			
                    		<span class="Total_Title">${db.restname }</span> ( <span class="Total_Score"> ${res.avgStar } </span> )
                    			<input type="hidden" value="${user_num}" id="user_id">
                    		</div>
                    		<div class="Main_Stat">
                    			<span class="Review_Count">리뷰수(${reviewCount })</span>
                    			<span class="like_Count" id="u_like_count">♥${db.restlike }</span>
                    		</div>	
                    		</div>
                    		<div class="like_sector">
                    		
                    		<a href="#" onclick='chk_review( ${db.restNum})'>	
                    		<img src="${pageContext.request.contextPath}/resources/css/review.png"></a>
                    			<c:if test="${checkLikeList == 0 }"><span id="heart">♡</span></c:if>
                    			<c:if test="${checkLikeList == 1 }"><span id="heart">♥</span></c:if>
                    			
                    			
                    		</div>
                    	
                    	</header>
                        <div class="index__area--contBox">
                       	   <span class="Res_Info"> 주소</span> <span class="Res_det" id="detailaddr"> ${db.restadress } </span><br>
							<span class="Res_Info">전화번호 </span> <span class="Res_det">${db.resttel } </span><br>
							<span class="Res_Info">음식 종류</span>   <span class="Res_det"> ${db.restkeyword }</span> <br>
							<span class="Res_Info">편의시설</span>  <span class="Res_det">   ${db.resttag }</span><br>
							<span class="Res_Info">영업시간</span>  <span class="Res_det">   ${db.resttime1 }</span><br>
							<span class="Res_Info">메뉴</span>     <span class="Res_det">   ${db.restmenu } </span><br>			
							<span class="Res_Info">가격대</span>    <span class="Res_det">   ${db.restprice } </span><br>
							
			<input type="hidden" id="map_address" value="${db.restadress }">
                        
                        </div>
                        <div class="index__area--contBox">
                        	<header class="Rest_header">
                    				
                        			<h2 class="review">리뷰(${reviewCount})</h2> 
                        		
                        		<ul class="Rest_Review">
                        			<li class="Rest_Review_score">서비스( ${res.avgService } ) </li>
                        			<li class="Rest_Review_score">가격( ${res.avgPrice } ) |</li>
                        			<li class="Rest_Review_score">맛( ${res.avgTaste } ) |</li>
                        			<li class="Rest_Review_score">전체( ${res.avgStar } ) |</li>
                        		</ul>
                        	</header>
                        		<ul class="Rest_Review_TotalList">
                        			
                        				<c:if test="${empty rv}"><h2 align="center">등록된 후기가 없습니다</h2></c:if>
                        			<c:forEach items="${rv }" var="rvi">
                        			<li class="Rest_Review_Item" onMouseOver="this.style.backgroundColor='#e2e2ea'" onMouseOut="this.style.backgroundColor='white'" id="RS">
                        			 <div class="Rest_Review_Wrap" >
                        				<div class="Rest_Review_UserInfo">
                        					<div class="Rest_UserInfo_Img">
                        						
                        					    
                        					</div>
                        					<span class="Rest_UserInfo_Name">${rvi.username}</span>
                        						
                        					<ul class="Rest_UserInfo_Stat">
                        						<li class="Rest_UserInfo_StatItem">
                        						  리뷰수(${rvi.userreviewcount})  
                        						</li>
                        						
                        					</ul>
                        				</div>
                        				<div class="Rest_Review_Contents">
                        					<div class="Rest_Review_TextWrap">
                        						<span class="Rest_Review_date"> ${rvi.reviewdate }</span>
                        						<span class="Rest_Review_sccore_item">맛(${rvi.reviewtaste } )
                        								가격(${rvi.reviewprice })
                        								서비스(${rvi.reviewservice }) 
                        								
                        								<c:if test="${rvi.usernum eq sessionScope.user_num }">
                        								<a href="#" onClick="updatereview('${rvi.reviewnum}')">
														<img src="${pageContext.request.contextPath}/resources/css/edit.png"></a>
														
														<a href="#" onClick="deletereview('${rvi.reviewnum}','${db.restNum }')">
														<img src="${pageContext.request.contextPath}/resources/css/delete.png"></a>
														
                        								</c:if>
                        								
                        						</span>
                        						<p class="Rest_Review_Text">${rvi.reviewcontent }</p>
                        						<img src="resources/upload/file/${rvi.reviewimage}" width="50" height="50">  <!-- 저장되는 폴더위치 설정 -->
                        					</div>
                        				</div>
                        				</div>
                        			</li>
                        			</c:forEach>
                        		</ul>
                        	
                        </div>
                        <div class="index__area--contBox">
                        	<h2 class="blogTitle">블로그 리뷰</h2>
                        	 <ul class="blogWrap">
    							<c:forEach var="bb" items="${abb }">
    								<li class="blogItem">
									<a href="${bb.link }" target="_blank">
										<strong class="blogItem">${bb.title }</strong><br>
										<span class="stxt">${bb.description }</span>
									</a>
									<p class="person-date">
										<span class="person naver">${bb.bloggername }</span>
										<span class="date">${bb.postdate }</span>
									</p>
									</li>
    	
    
    </c:forEach>
    
    </ul>
                        
                        </div>
                    </div>
                     <div class="index__area--mapBox" id="map" style="width:100%; height:50%">
                  
                    </div>
                     <script type="text/javascript"
					 src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b139d959b37e8342e3d67bd1979272a5&libraries=services"></script>
                   <script type="text/javascript">
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 6 // 지도의 확대 레벨
		    };  
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		     	
		// 주소로 좌표를 검색합니다
		   function getlocationDetail() {
			var addr = document.getElementById('map_address').value;
		    
			geocoder.addressSearch(addr, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">맛집위치♥</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
					    
					};// if
		   	
		});   //geocoder 
		
	} // getlocationDetail
	</script>
                </article>
            </section>
        </div>
        <footer class="footer"></footer>
    </div>
</body>
<script type="text/javascript">

	function chk_review(restnum){
		
	   var usernum = document.getElementById('user_id').value;
	   console.log(usernum);
		
		console.log(restnum);
		if(usernum == 'null' ){
			alert("로그인이 필요합니다");
		}
		else{
			
			location.href="reviewForm.tm?restNum="+restnum+"&usernum="+usernum;
		}
		
	}
	
	function updatereview(reviewnum){
		
		console.log(reviewnum);
		
		
		location.href="reviewUpdate.tm?reviewNum="+reviewnum;
	}
	
	function deletereview(reviewnum,restnum){
		
		console.log(restnum);
		location.href="reviewDelete.tm?reviewNum="+reviewnum+"&restnum="+restnum;
	}
</script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"> </script>
	<script type="text/javascript" src="resources/js/jquery.als-2.1.min 2.js" ></script>
  <script type="text/javascript">
	$(document).ready(function(){
		
		
		
		$("#demo1").als({
			visible_items: 5,
			scrolling_items: 2,
			orientation: "horizontal",
			circular: "yes",
			autoscroll: "yes",
			interval: 4000
		});
		
		var user_id = $('#user_id').val();
		
	$("#heart").on("click", function () {
		
			console.log(user_id);
        	if(user_id != "null") {
        		$.ajax({
            		url : 'like.rest',
            		type : 'get',
            		data : ({
            			usernum : user_id,
            			restnum : ${db.restNum}
            		}),
            		success : function(data){
            			if(data.flag==0){
            			 $('#heart').empty();
                   	 	 $('#heart').text("♥");
                         $('#heart').css("color","red");
                         $('#u_like_count').empty();
                         $('#u_like_count').css("color","red");
                         $('#u_like_count').css("font-size","20px");
                         $('#u_like_count').text("♥"+data.cnt);
            			}
            			else{
            				$('#heart').empty();
                      	 	$('#heart').text("♡");
                            $('#heart').css("color","red");
                            $('#u_like_count').empty();
                            $('#u_like_count').css("color","red");
                            $('#u_like_count').css("font-size","20px");
                            $('#u_like_count').text("♥"+data.cnt);
            			}
            		},
            		fail: function(error){
	        			  console.log(error)
	        		  }
            	});
        		
        	}
        	else{
        		alert("로그인이필요합니다");
        	}
        });
	
	
	});	
	</script>
	


</html>