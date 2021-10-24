<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b139d959b37e8342e3d67bd1979272a5&libraries=services"></script>

  
 <div> 
 <form action="goSearchmap.tm" method="get" class="formArea"> 
 <select name = "whatColumn"> <!-- whatColumn=all,title,singer, keyword=a -->
		<option value="restadress">주소 검색(동)</option>
		<option value="restmenu">메뉴명</option>
		<option value="restname">상호명</option>
		<option value="resttag">태그</option>
</select>
 <input type="text" name="goSearchWord" value="이태원">
 <input type="submit" value="검색하기">
 </form>
 </div>
 <div id="subMapWp">
 	<div class="mapBox">
		<div id="map" style="width:100%;height:100%;"></div>
	</div>
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
		
		
		//var pos_length = $("input[name=mapinput]").length;
		/* var pos_length = ${lists.size()} // 길이 구하기 
		alert(pos_length); */
		//for (var i = 0; i < pos_length; i++) {
			//positions_[i] = $("input[name=mapinput]").eq(i).val();
			
		//}
		
		/* function getlist() {
		 const dataArr = new Array();
		            for(var i=0; i<pos_length; i++){
		                 
		                // 객체 생성
		                dataObj = new Object();
		                
		                // 객체에 input 값을 담는다.
		               dataObj.address = $("input[name=mapinput]").eq(i).val();
		                    
		                // 배열 생성된 객체 삽입
		                dataArr.push(dataObj) ;
		            }
		            var jsonData = JSON.stringify(dataArr);
		            //$("#result").html(jsonData);  
		            var jasonparseMap = JSON.parse(dataArr);
		            $("#result2").html(jasonparseMap[i].address);  
		}	
		 */
		
			const list = new Array();
		      var bounds = new kakao.maps.LatLngBounds(); 
		      <c:forEach items="${lists}" var="item">
		      list.push("${item.restAdress}");
		      
		      </c:forEach>
		         alert(list.length);
		     	
		    //for (var i = 0; i < list.length; i ++) {
		    	 <c:forEach items="${lists}" var="item">
		// 주소로 좌표를 검색합니다
		        
			//geocoder.addressSearch(positions[i].address, function(result, status) {
			geocoder.addressSearch("${item.restAdress}", function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				//var message = 'latlng: new kakao.maps.LatLng(' + result[0].y + ', ';
				//message += result[0].x + ')';
				
				//var resultDiv = document.getElementById('clickLatlng'); 
				//resultDiv.innerHTML = message;
				
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		  	     marker.setMap(map);
				 bounds.extend(coords);
				 
				// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
				//document.getElementById(testadr).innerHTML = list[i]
				//<c:forEach var="i" begin="0" end="${fn:length(lists)-1}">
				 var iwContent = '<div class="mapInnerInfoWp item">'
								 +'<ul class="storeDetail">'
								 +'<li class="stImg stLeft btn_test"><a><img src="${item.restMainImg}" width="100" height="100"></a></li>'
								 +'<li class="stRight">'
								 +'<ul class="subb">'
								 +'<li class="stName">${item.restName}</li>'
								 +'<li class="stDate">영업일<span> - ${item.restTime1}</span></li>'
								 +'<li class="stTime">영업시간<br/><span>: ${item.restTime2}</span></li>'
								 +'<li class="stAddr tagAddress">주소<span> - ${item.restAdress}</span></li>'
								 +'<li class="stCall">전화번호<span> - ${item.restTel}</span></li>'
								 +'<li class="stTag"><span> ${item.restTag}</span></li>'
								 +'</ul>'
								 +'</li>'
								 +'</ul>'
								 +'</div>',iwRemoveable = true;
							
				 //</c:forEach>
				 
				 // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		
				 // 인포윈도우를 생성합니다
				 var infowindow = new kakao.maps.InfoWindow({
					 content : iwContent,
				     removable : iwRemoveable
				 });
				 infowindow.close();
				 // 마커에 마우스오버 이벤트를 등록합니다
				 kakao.maps.event.addListener(marker, 'mouseover', function() {
				   // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
				   		infowindow.close();
				     infowindow.open(map, marker);
				 });
				 
				 kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
					    
					 infowindow.close();
					    
					});
				
				
		   	
		    } //if
		});   //geocoder 
		 
		   // }//for
		   </c:forEach>
		       //map.setCenter(bounds);
		$(document).ready(function(){
			//alert('ready');
			//하..... 이거떄문에 ....
		    setTimeout( function setlocation() {
		   	 //alert('setlocation');
		     // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		     // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		     map.setBounds(bounds);
		 },1500);
		    $('.stImg stLeft btn_test').click(function() {
		 	   var ttt = $(this).siblings('.stAddr stRight tagAddress').text();
		 	   alert(ttt);
		 	});
		});
		
		
		function panTo(SBD_ADDR) {
		  alert("panTo");
		  gettagad();
		    //이동할 위도 경도 위치를 생성합니다 
		    geocoder.addressSearch(ttt, function(result, status) {
		        // 정상적으로 검색이 완료됐으면 
		         if (status === kakao.maps.services.Status.OK) {
					alert("ok");
		            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		            var moveLatLon = coords;
		            map.panTo(moveLatLon);  
		        } //if
		    });   //geocoder 
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		             
		};        
	</script>




<style>
button {box-sizing:border-box; border:1px solid #ff7100; background:none; color:#ff7100; font-size:18px; line-height:28px; height:30px; padding:0 10px; border-radius:4px;}
input {border:1px solid #ff7100; border-radius:4px; font-size:18px; line-height:18px; height:30px; padding:6px 10px; outline:none; box-shadow:none; }
input[type="button"] {border:1px solid #ff7100; color:#ff7100; border-radius:4px;font-size:18px; line-height:28px; height:30px; padding:0 10px; outline:none; box-shadow:none; background:none; }
input[type="submit"] {border:0; color:#fff; border-radius:4px;font-size:18px; line-height:28px; height:30px; padding:0 10px; outline:none; box-shadow:none; background:#ff7100; }

/* 더보기 페이지 */
.formArea:after {content:''; clear:both; display:block;}
.formArea input {float:left; margin-left:7px;}
.formArea select {float:left; border:1px solid #ff7100; border-radius:4px; font-size:18px; line-height:18px; height:30px; padding:0px 10px; outline:none; box-shadow:none; }
#subMapWp {position:relative; width:100%; height:80vh;}
#subMapWp:after {content:''; clear:both; display:block;}
#subMapWp .mapBox {width:calc(75% - 30px); height:75vh; margin:0 15px; float:right; }
#subMapWp .storeListWp {width:25%; height:75vh; float:left; background-color:rgba(255,213,213,0.2); z-index:9; overflow-x:hidden; overflow-y:auto; }
#subMapWp .storeListWp ul {list-style:none; padding:0; margin:0;}

.storeList {width:100%;}
.storeList .item {width:calc(100% - 30px); padding:15px 0; margin:0 15px; border-top:1px solid #ffcba1;}
#subMapWp .item:first-of-type {border-top:0;}
#subMapWp .item .storeDetail {width:100%; list-style:none;}
#subMapWp .item .storeDetail:after {content:''; clear:both; display:block;}
#subMapWp .item .storeDetail li {float:left;}
#subMapWp .item .storeDetail .stImg {width:100px; height:100px;}
#subMapWp .item .storeDetail .stLeft {width:100px; }
#subMapWp .item .storeDetail .stRight {width:calc(100% - 110px);margin-left:10px; font-size:12px; color:#222;} 
#subMapWp .item .storeDetail .stName {font-weight:bold;font-size:14px;}
#subMapWp .item .storeDetail .stName > a {color:#222;}
#subMapWp .item .storeDetail .stDate {}
#subMapWp .item .storeDetail .stTime {}
#subMapWp .item .storeDetail .stAddr {}
#subMapWp .item .storeDetail .stCall {}

/* 맵 안 가게 정보 */
#subMapWp #map > div > div > div > div {width:450px !important;}
#subMapWp #map .item .storeDetail {padding:0 15px; box-sizing:border-box;} 
#subMapWp #map .item .storeDetail li.stRight{width:calc(100% - 130px);margin-left:10px;}
#subMapWp #map .item .storeDetail li.stRight li:before {content:'-'; display:inline-block; text-indent:-10px; padding-left:10px; }
#subMapWp #map .item .storeDetail li.stRight li.stName:before {display:none;}
#subMapWp #map .item .storeDetail .stRight ul {list-style:none; padding:0;}
#subMapWp #map .item .storeDetail .stRight li {font-weight:bold; width:100%;}
#subMapWp #map .item .storeDetail .stRight li > span {font-weight:normal;}
#subMapWp #map .item .storeDetail .stTime li > span {padding-left:5px;}
#subMapWp #map .item .storeDetail .stTag {}

</style>
	<div class="storeListWp">
		<ul class="storeList">
			<c:forEach var="sdb" items="${lists}">
			<li class="item">
				<ul class="storeDetail">
					<li class="stImg stLeft btn_test"><a><img src="${sdb.restMainImg}" width="100" height="100"></a></li>
					<li class="stName stRight"><a href="detail.rest?restnum=${sdb.restNum }">${sdb.restName }</a></li>
					<!-- <li class="stType">${sdb.restKeyword }</li> -->
					<li class="stDate stRight">${sdb.restTime1 }</li>
					<li class="stTime stRight">${sdb.restTime2 }</li>
					<li class="stAddr stRight tagAddress">${sdb.restAdress }</li>
					<li class="stCall stRight">${sdb.restTel }</li>
					<!-- <li class="stExt">${sdb.restTag }</li> -->
				</ul>
			</li>
			</c:forEach>
		</ul>
	</div><!-- //storeListWp -->
</div><!-- //subMapWp -->




