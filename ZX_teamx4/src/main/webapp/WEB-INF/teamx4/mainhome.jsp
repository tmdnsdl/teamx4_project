<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!-- 메인 애니메이션 자바 스크립트 -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b139d959b37e8342e3d67bd1979272a5&libraries=services"></script>
    <script type="text/javascript">
    function scrollFooter(scrollY, heightFooter)
    {
        console.log(scrollY);
        console.log(heightFooter);

        if(scrollY >= heightFooter)
        {
            $('footer').css({
                'bottom' : '0px'
            });
        }
        else
        {
            $('footer').css({
                'bottom' : '-' + heightFooter + 'px'
            });
        }
    }

    $(window).load(function(){
        var windowHeight        = $(window).height(),
            footerHeight        = $('footer').height(),
            heightDocument      = (windowHeight) + ($('.content').height()) + ($('footer').height()) - 20;

        // Definindo o tamanho do elemento pra animar
        $('#scroll-animate, #scroll-animate-main').css({
            'height' :  heightDocument + 'px'
        });

        // Definindo o tamanho dos elementos header e conteúdo
        $('header').css({
            'height' : windowHeight + 'px',
            'line-height' : windowHeight + 'px'
        });

        $('.wrapper-parallax').css({
            'margin-top' : windowHeight + 'px'
        });

        scrollFooter(window.scrollY, footerHeight);

        // ao dar rolagem
        window.onscroll = function(){
            var scroll = window.scrollY;

            $('#scroll-animate-main').css({
                'top' : '-' + scroll + 'px'
            });
            
            $('header').css({
                'background-position-y' : 50 - (scroll * 100 / heightDocument) + '%'
            });

            scrollFooter(scroll, footerHeight);
        }
    });
    </script>
    <!-- 끝// 메인 애니메이션 자바 스크립트 -->
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order By Seoul - teamx4</title>
<link rel="shortcut icon" type="image/x-icon" href="resources/images/logo.png" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Icons"
      rel="stylesheet">
<!-- [2021-10-13] 추가 : bxslider -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.js"></script>
<!-- //[2021-10-13] 추가 : bxslider -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 카카오 로그인  -->
<script>
// Kakao
Kakao.init('50f8c205c33579235018b30cc602581b');

$(document).ready(function() {
	if(Kakao.Auth.getAccessToken()){
		let userName = localStorage.getItem('name');
		$(".navWp").append('<li><a href="/ex/userInfo.me" style="padding-right:5px;">'+userName+'님</a><a href="/ex/userInfo.me">마이페이지</a></li><li><a href="/ex/likelist.me">즐겨찾기</a></li><li><a href="/ex/reviewlist.me">마이리뷰</a></li><li><a href="/ex/logout.me">로그아웃</a></li>');
	}
	else{
		$(".navWp").append('<li><a href="/ex/login.me">로그인</a></li><li><a href="/ex/login.me">회원가입</a></li>');
	}
});
</script>
		<!-- end 카카오 로그인  -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/style.css" rel="stylesheet"/> 
<style type="text/css">
	.storeEst{
		cursor:pointer;
	}
</style>
</head>
<body onload="getLocationUser()">

<div id="scroll-animate">
  <div id="scroll-animate-main">
    <div class="wrapper-parallax">
    	
      <header>
       <a href="javascript:window.scrollTo( 0, 660 );">
       	<h1><span class="vsHdn">Order by Seoul</span></h1>
       </a>
      </header>

      <section class="content">
      <!-- [2021-10-17] gnb 추가 -->
      	<script type="text/javascript">
      	$(document).ready(function() {
      		
      		/* gnbWp 상단고정 */
      		//메인페이지 content영역 viewport 사이 간격 구하기
      		function getViewportOffset($e) {
      		  var $window = $(window),
      		    scrollLeft = $window.scrollLeft(),
      		    scrollTop = $window.scrollTop(),
      		    offset = $e.offset(),
      		    rect1 = { x1: scrollLeft, y1: scrollTop, x2: scrollLeft + $window.width(), y2: scrollTop + $window.height() },
      		    rect2 = { x1: offset.left, y1: offset.top, x2: offset.left + $e.width(), y2: offset.top + $e.height() };
      		  return {
      		    left: offset.left - scrollLeft,
      		    top: offset.top - scrollTop,
      		    insideViewport: rect1.x1 < rect2.x2 && rect1.x2 > rect2.x1 && rect1.y1 < rect2.y2 && rect1.y2 > rect2.y1
      		  };
      		}
      		
      		//메인페이지 gnbWp 상단 고정
      		$(window).on("load scroll resize", function() {
      		  var viewportOffset = getViewportOffset($("section.content"));
      		  //$("#log").text("left: " + viewportOffset.left + ", top: " + viewportOffset.top + ", insideViewport: " + viewportOffset.insideViewport);
	      		if(viewportOffset.top <= 0  ){
	  				$('.gnbWp').addClass('fixed');      				
	  			} else {
	  				$('.gnbWp').removeClass('fixed');
	  			}
      		});
      		
      	});
      	</script>
      	<div class="gnbWp aft">
      		<h1 class="logo">Order by Seoul</h1>
      		<ul class="navWp aft">
      			<!-- <li><a href="javascript:window.scrollTo( 450,900 );" title="">한식</a></li>
      			<li><a href="javascript:window.scrollTo( 1000,1440 );" title="">중식</a></li>
      			<li><a href="javascript:window.scrollTo( 1440,1980 );" title="">피자/파스타</a></li>      			
      			<li><a href="javascript:window.scrollTo( 1980,2500 );" title="">까페</a></li>  -->     			
      		</ul>
      	</div>
      	<!-- //[2021-10-17] gnb 추가 -->
      	
      <a name = "content"></a>
      
      <!-- [2021-10-13] 추가 : 맵 열기/닫기 -->
      <script type="text/javascript">
      $(document).ready(function() {
    	  //btn_map 클릭시 지도영역 열기/닫기
    	  $('.btn_map').click(function(){
    		  $(this).toggleClass('on');
    		  $('.mapWp').toggleClass('open').slideToggle();
    		  if($('.btn_map').hasClass('on') == true){
    			  $('.btn_map').text('지도닫기 ▲');
    		  } else {
    			  $('.btn_map').text('지도열기 ▼');
    		  }
    	  });
      });
      </script>
      <div class="mapBtnArea aft">
      	<button class="btn_map on">지도닫기 ▲</button>
      	<div class="locDesc">
      		지금 현재 위치 : <span id="region_addr" class="addr"></span>
			<form action="goSearchByUserLocation.tm"  onsubmit="getLocationUser()" method="get" class="formStyle">
			    <input type="text" id="inputaddr" name="inputaddr" name="currentlocation" class="vsHdnI">
			 	<button class="btn_getAddr" type="submit" >위치 업데이트</button>
			</form>			 
		 </div>
      </div>
      
       
      
       <!-- //[2021-10-13] 추가 : 맵 열기/닫기 -->
       <div class="mapWp">
       	<div class="mapBox" id="map"></div>
       </div>
       
        <input type="text" id="centerAddr" hidden="">
   		
   		<!-- [2021-10-17] 주석처리 
        <input type="text" id="search_addr" >
         <input type="button" value="주소 좌표 변환" onclick="search_latlag()">
         //[2021-10-17] 주석처리 -->
         
       <!--맵 자바스크립트 -->
    <script type="text/javascript">

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  
    function getLocationUser() {
		
	
    if (navigator.geolocation) {
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            lat = position.coords.latitude, // 위도
           	lng = position.coords.longitude; // 경도
                $('#latitude').html(lat);     // 위도
                $('#longitude').html(lng);
                
            var locPosition = new kakao.maps.LatLng(lat, lng), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);
          });
        
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        
        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
            message = 'geolocation을 사용할수 없어요..'
            
        displayMarker(locPosition, message);
    }
    
    }

    //지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({  
            map: map, 
            position: locPosition
        }); 
        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;
        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });
        // 인포윈도우를 마커위에 표시합니다 
        infowindow.open(map, marker);
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition); 
    }    


    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);

    // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'idle', function() {
        searchAddrFromCoords(map.getCenter(), displayCenterInfo);
    });

    function searchAddrFromCoords(coords, callback) {
        // 좌표로 행정동 주소 정보를 요청합니다
        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
    }

    function searchDetailAddrFromCoords(coords, callback) {
        // 좌표로 법정동 상세 주소 정보를 요청합니다
        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    }

    // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
    function displayCenterInfo(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var infoDiv = document.getElementById('centerAddr');
            for(var i = 0; i < result.length; i++) {
                // 행정동의 region_type 값은 'H' 이므로
                if (result[i].region_type === 'H') {
                   infoDiv.innerHTML = result[i].address_name;
                    const regino_addr = (result[i].address_name).split(" ");
                   			
                    	 $('#region_addr').html( result[i].address_name);
                    	 if(regino_addr.length == 3){
                    		 if(regino_addr[2] == '신촌동'){
                    			 regino_addr[2] = '대현동';
                    		 };
                    		 if(regino_addr[2] == '대흥동'){
                    			 regino_addr[2] = '대현동';
                    		 };
                    	  document.getElementById("inputaddr").value = regino_addr[1];
                    	  document.getElementById("mapinputaddr").value = regino_addr[1];
                    	  document.getElementById("mapinputaddr_ch").value = regino_addr[1];
                    	  document.getElementById("mapinputaddr_it").value = regino_addr[1];
                    	  document.getElementById("mapinputaddr_cf").value = regino_addr[1];
                    	  console.log("3일떄")
                    	 }
                    	 else if (regino_addr.length !=3){
                          document.getElementById("inputaddr").value = regino_addr[2];
                          document.getElementById("mapinputaddr").value = regino_addr[2];
                       	  document.getElementById("mapinputaddr_ch").value = regino_addr[2];
                       	  document.getElementById("mapinputaddr_it").value = regino_addr[2];
                       	  document.getElementById("mapinputaddr_cf").value = regino_addr[3];
                    	 }
                  
                    break;
                }
            }
        }    
    }
    ///////////////////////////////////////////////////////////////////////////////
    /// 주소명으로 좌표값 불러오고 마커 출력 
    function search_latlag() {
    	
    	var search_addr =  document.getElementById("search_addr").value;
    	//alert("주소좌표");
    	//alert(search_addr);
    	geocoder.addressSearch(search_addr, function(result, status) {

    	    // 정상적으로 검색이 완료됐으면 
    	     if (status === kakao.maps.services.Status.OK) {
    	    	

    	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    	        var lat = result[0].y; // 위도
    	        var	lng = result[0].x; // 경도
    	            $('#latitude').html(lat);     // 위도
    	            $('#longitude').html(lng);
    	        // 결과값으로 받은 위치를 마커로 표시합니다
    	        
    	        var marker = new kakao.maps.Marker({
    	            map: map,
    	            position: coords
    	        });

    	        // 인포윈도우로 장소에 대한 설명을 표시합니다
    	        var infowindow = new kakao.maps.InfoWindow({
    	            content: '<div style="width:150px;text-align:center;padding:6px 0;">검색한 위치입니다.</div>'
    	        });
    	        infowindow.open(map, marker);
    	       
    	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    	        map.setCenter(coords);
    	      
    	    } 
    	});    
    }
    </script>
    <!--END // 맵 자바스크립트 -->
   		<!--  /////////////////한식/////////////////////// -->
   		<!-- [2021-10-16] 수정 : bxslider 영역 -->
   		<script>
   		$(document).ready(function(){
   			$(window).load(function() {
	   			var foodSlide01 = $('.fsWrap01 .foodSection01').bxSlider({
	   		        auto: true,
	   		    	touchEnabled : (navigator.maxTouchPoints > 0),
	   		     	infiniteLoop: true,
	   		        speed: 500,  // 애니메이션 속도
	   		        //pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
	   		        mode: 'horizontal',
	   		        //autoControls: true,
	   		        controls: true,
	   		        pager: false,
	   		     	minSlides: 5,
	   		     	maxSlides: 5,
	   		     	moveSlides: 1,
	   		     	slideWidth: 400,
	   		     	slideMargin: 30,
	   		     	responsive: true,
	   		     	//adaptiveHeight: true,
	   		     	onSlideAfter: function(){
	   		     		foodSlide01.stopAuto();
	   		     		foodSlide01.startAuto();
	   		     	}
	   		    });
   			});
   			
   			/*
   			$(document).on('click','.fsWrap01 .bx-next, .fsWrap01 .bx-prev',function() {
   				foodSlide01.stopAuto();
   				foodSlide01.startAuto();
   			});
			*/
   			$(window).resize( function() {
   		        setTimeout(function(){
   		        	foodSlide01.destroySlider();
   		        	foodSlide01.reloadSlider();  
   		        }, 100)
   		    }).trigger("resize");

   			
   	    });
   		</script>
		<!-- //[2021-10-16] 수정 : bxslider 영역 -->

        <div class="sectBox">
        	<div class="inner">
       			<h2 class="sectionTit">
       				내 주변 한식 추천
       				<form action="cartegorymore.tm" method="get" class="formStyle btnWpMore">
		     			<input type="text" id="mapinputaddr" name="mapinputaddr" name="currentlocation" hidden="">
					 	<button type="submit" class="btnMore">더보기</button>      
					</form>
       			</h2>
		        <c:if test="${empty korean_lists }" > 
		    	  <p>해당지역에 가게정보가 없습니다.</p> 
				</c:if>
				<!-- [D]슬라이더영역 01 -->
				<div class="fsWrap01">
		        	<ul class="foodSection01">
		        	<!--  컨텐츠영역 반복 할 대상  -->
		        	<c:forEach var="korea_food" items="${korean_lists }">
					<!-- 한식  조건문  -->
			        	<li >
				        	<a href="detail.rest?restnum=${korea_food.restNum}"><span class="img"><img src="${korea_food.restMainImg }" alt=""></span></a>
				        	<h3 class="storeName">${korea_food.restName}</h3>
				        	<p class="storeDesc">-주소-<br>${korea_food.restAdress}</p>
				        	<div class="btnArea">
				        	<a href='reviewForm.tm?restNum=${korea_food.restNum}'>
				        		<button class="storeEst">
				        			평가하기<span class="material-icons">reviews</span>
				        		</button>
				        	</a>
			        		</div>
			        	</li>
			        </c:forEach>
		         	<!--  //컨텐츠영역 반복 할 대상  -->
		        	</ul>
		        </div><!-- //fsWrap01 -->
			    <!-- //[D]슬라이더영역 01 -->
		    </div>
        </div><!-- //sectBox -->
        
        <!--  끝/////////////////한식/////////////////////// -->
        
        
        <!-- //[2021-10-16] 수정 : bxslider 영역 -->

        <div class="sectBox">
        	<div class="inner">
       			<h2 class="sectionTit">
       				내 주변 중식 추천
       				<!-- <form action="cartegorymore.tm" method="get" class="formStyle btnWpMore">
		     			<input type="text" id="mapinputaddr_ch" name="mapinputaddr_ch" name="currentlocation" class="">
					 	<button type="submit" class="btnMore">더보기</button>      
					</form> -->
       			</h2>
		        <c:if test="${empty chinese_lists }" > 
		    	  <p>해당지역에 가게정보가 없습니다.</p> 
				</c:if>
				<!-- [D]슬라이더영역 01 -->
				<div class="fsWrap01">
		        	<ul class="foodSection01">
		        	<!--  컨텐츠영역 반복 할 대상  -->
					<c:forEach var="china_food" items="${chinese_lists }">
			        	<li >
				        	<a href="detail.rest?restnum=${china_food.restNum}"><span class="img"><img src="${china_food.restMainImg }" alt=""></span></a>
				        	<h3 class="storeName">${china_food.restName}</h3>
				        	<p class="storeDesc">${china_food.restKeyword}</p>
				        	<div class="btnArea">
				        		<a href='reviewForm.tm?restNum=${china_food.restNum}'>
				        		<button class="storeEst">
				        			평가하기<span class="material-icons">reviews</span>
				        		</button>
				        		</a>
			        		</div>
			        	</li>
			        </c:forEach>
		         	<!--  //컨텐츠영역 반복 할 대상  -->
		        	</ul>
		        </div><!-- //fsWrap01 -->
			    <!-- //[D]슬라이더영역 01 -->
		    </div>
        </div><!-- //sectBox -->
        
        <!--  끝/////////////////한식/////////////////////// -->
        
        
          <!-- //[2021-10-16] 수정 : bxslider 영역 -->

        <div class="sectBox">
        	<div class="inner">
       			<h2 class="sectionTit">
       				내 주변 피자/파스타 추천
       				<!-- <form action="cartegorymore.tm" method="get" class="formStyle btnWpMore">
		     			<input type="text" id="mapinputaddr_it" name="mapinputaddr_it" name="currentlocation" class="">
					 	<button type="submit" class="btnMore">더보기</button>      
					</form> -->
       			</h2>
		        <c:if test="${empty italic_lists }" > 
		    	  <p>해당지역에 가게정보가 없습니다.</p> 
				</c:if>
				<!-- [D]슬라이더영역 01 -->
				<div class="fsWrap01">
		        	<ul class="foodSection01">
		        	<!--  컨텐츠영역 반복 할 대상  -->
					<c:forEach var="italic_food" items="${italic_lists }">
			        	<li >
				        	<a href="detail.rest?restnum=${italic_food.restNum}"><span class="img"><img src="${italic_food.restMainImg }" alt=""></span></a>
				        	<h3 class="storeName">${italic_food.restName}</h3>
				        	<p class="storeDesc">${italic_food.restKeyword}</p>
				        	<div class="btnArea">
				        	<a href='reviewForm.tm?restNum=${italic_food.restNum}'>
				        		<button class="storeEst">
				        			평가하기<span class="material-icons">reviews</span>
				        		</button>
				        		</a>
			        		</div>
			        	</li>
			        </c:forEach>
		         	<!--  //컨텐츠영역 반복 할 대상  -->
		        	</ul>
		        </div><!-- //fsWrap01 -->
			    <!-- //[D]슬라이더영역 01 -->
		    </div>
        </div><!-- //sectBox -->
        
        <!--  끝/////////////////한식/////////////////////// -->
        
     	<!-- //[2021-10-16] 수정 : bxslider 영역 -->

        <div class="sectBox">
        	<div class="inner">
       			<h2 class="sectionTit">
       				내 주변 까페 추천
       				<!-- <form action="cartegorymore.tm" method="get" class="formStyle btnWpMore">
		     			<input type="text" id="mapinputaddr_cf" name="mapinputaddr_cf" name="currentlocation" class="">
					 	<button type="submit" class="btnMore">더보기</button>      
					</form> -->
       			</h2>
		        <c:if test="${empty cafes_lists }" > 
		    	  <p>해당지역에 가게정보가 없습니다.</p> 
				</c:if>
				<!-- [D]슬라이더영역 01 -->
				<div class="fsWrap01">
		        	<ul class="foodSection01">
		        	<!--  컨텐츠영역 반복 할 대상  -->
					<c:forEach var="cafes_food" items="${cafes_lists }">
			        	<li >
				        	<a href="detail.rest?restnum=${cafes_food.restNum}"><span class="img"><img src="${cafes_food.restMainImg }" alt=""></span></a>
				        	<h3 class="storeName">${cafes_food.restName}</h3>
				        	<p class="storeDesc">${cafes_food.restKeyword}</p>
				        	<div class="btnArea">
				        	<a href='reviewForm.tm?restNum=${cafes_food.restNum}'>
				        		<button class="storeEst">
				        			평가하기<span class="material-icons">reviews</span>
				        		</button>
				        		</a>
			        		</div>
			        	</li>
			        </c:forEach>
		         	<!--  //컨텐츠영역 반복 할 대상  -->
		        	</ul>
		        </div><!-- //fsWrap01 -->
			    <!-- //[D]슬라이더영역 01 -->
		    </div>
        </div><!-- //sectBox -->
        
        <!--  끝/////////////////한식/////////////////////// -->
        
        <div class="sectBox">
        	<div class="inner">
	        	<h2 class="sectionTit">실시간 맛집 평가</h2>
		        <c:if test="${empty reviewslists }" > 
				    <p>등록된 리뷰가 없습니다.</p> 
				</c:if>
				<div class="reviewWp">
		   			<ul class="reviewList">
		     			<c:forEach var="frbw" items="${reviewslists}">
		     			<!-- [D] 리뷰 아이템 -->
		   				<li class="reviewItem">
		   					<div class="itemInner">
		   						<div class="rvAction">
			   						<div class="rightDesc">
				   						<p class="usNum">${frbw.user_name } </p><!-- [D]유저번호 -->
				   						<h3 class="rvTit">${frbw.restname }</h3><!-- [D]맛집이름 -->
				   						<div class="star"><span style="width:80%"></span></div><!-- [D]별점 -->
			   						</div>
		   						</div>
		   						<ul class="rvPoint">
		   							<li>맛<span class="num">${frbw.reviewTaste}</span></li>
		   							<li>가격<span class="num">${frbw.reviewPrice}</span></li>
		   							<li>서비스<span class="num">${frbw.reviewService}</span></li>
		   						</ul>
		   						<p class="rvText">${frbw.reviewContent }</p>
		   						<div class="rvThumbnail">
		   							<img src="<%=request.getContextPath()%>/resources/upload/file/${frbw.reviewImage}" class="button" style="width:195px;" onClick="getViewer('{|dq|info|dq|:{|dq|rn|dq|:|dq|\uc728\ub9ac\uc591\uc5b4\uc7a5\uac00\ub4e0|dq|,|dq|count|dq|:2,|dq|photo|dq|:|dq|https:\/\/s3-ap-northeast-1.amazonaws.com\/dc-user-profile-photo\/profilephoto_A_20210803061937.jpg|dq|,|dq|name|dq|:|dq|\ub9db\uc870\uc544 (64\uacf3 \ud3c9\uac00, 176\uac1c \uacf5\uac10\ubc1b\uc74c)|dq|,|dq|date|dq|:|dq|2\ubd84 \uc804|dq|},|dq|image|dq|:[|dq|https:\/\/s3-ap-northeast-1.amazonaws.com\/dcreviewsresized\/pre_20211018094559197_photo_379eb2899065.jpg|dq|,|dq|https:\/\/s3-ap-northeast-1.amazonaws.com\/dcreviewsresized\/pre_20211018094558818_photo_379eb2899065.jpg|dq|]}');" />
		   						</div>
		   						<div class="rvBtn"><a onClick="getReview();" class="">나도 평가하기</a></div>
		   					</div><!-- //itemInner -->
		   				</li>
		   				<!-- //[D] 리뷰 아이템 -->
		     			</c:forEach>
		   			</ul>
			    </div><!-- //reviewWp -->
		    </div>
        </div><!-- //sectBox -->
       
      </section>
      <footer>
        <div id="footer">
            <h2 class="f-tit">팀 레버리지!!!!</h2>
            <div class="f-box">
	            <ul class="f-gnb">
	                <li><a href="">개인정보처리방침</a></li>
	                <li><a href="">이용약관</a></li>
	                <li><a href="">위치기반 서비스 이용약관</a></li>
	            </ul>
            </div>
            <div class="f-box">
	            <ul class="f-copy">
	                <li>팀 프로젝트 레버지리 X4 입니다.</li>
	                <li>e-mail: ahrehdwls1@nate.com</li>
	            </ul>
            </div>
            <div class="f-box">
	            <ul class="f-sns">
	                <li class="insta"><a href="https://www.instagram.com/" target="_blank"><span class="blind">인스타그램</span></a></li>
	                <li class="face"><a href="http://www.facebook.com/" target="_blank"><span class="blind">페이스북</span></a></li>
	                <li class="twi"><a href="http://www.twitter.com/" target="_blank"><span class="blind">카카오스토리</span></a></li>
	            </ul>
	        </div>
            <p class="copy">ⓒ2014 - 2021 TEAM X4</p>
        </div>
      </footer>
    </div>
  </div>
</div>
</body>
</html>