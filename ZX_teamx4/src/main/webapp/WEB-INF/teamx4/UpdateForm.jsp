<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%-- <%@ include file="./../top/main.jsp"%> --%>

<!DOCTYPE html>
<html lang="ko">

<head>
<link rel="canonical" href="https://www.diningcode.com" />
<link rel="alternate" media="only screen and (max-width: 640px)" href="https://m.diningcode.com"><title>빅데이터 맛집검색, 다이닝코드</title>

<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/common.css?1.4.16" />
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/content.css?1.4.16" />
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/layout.css?1.4.16" />
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/main.css?1.4.16" />
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/styleDefault.css?1.4.16" />
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/sub.css?1.4.16" />
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/web/jquery.rateyo.min.css?1.4.16" />
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/swiper.min.css?1.4.16" />
<link rel="stylesheet" type="text/css" href="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/css/custom.css?1.4.16" />

<script type="text/javascript" src="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/lib/js/web.js"></script>

<link rel="shortcut icon" type="image/x-icon" href="resources/images/logo.png" />

<script src="https://s3-ap-northeast-1.amazonaws.com/dcicons/new/lib/js/jquery-1.12.0.min.js" charset="utf-8"></script>

<script>
    var cnt = 1;
    function fn_addFile(){
        //$("#d_file").append("<br>" + "<input type='file' name='file" + cnt + "' />");
        $("#d_file").append("<br>" + "<input type='file' name='file'>");
        //cnt++;
    }
    window.onload = function(){
		var star = document.getElementById('rate_star').value;
		if(star==5){
			document.getElementById('rating1').checked=true;
	    	document.getElementById('rating2').checked=true;
	    	document.getElementById('rating3').checked=true;
	    	document.getElementById('rating4').checked=true;
	    	document.getElementById('rating5').checked=true;
		}
		else if(star==4){
			document.getElementById('rating1').checked=true;
	    	document.getElementById('rating2').checked=true;
	    	document.getElementById('rating3').checked=true;
	    	document.getElementById('rating4').checked=true;
		}
		else if(star==3){
			document.getElementById('rating1').checked=true;
	    	document.getElementById('rating2').checked=true;
	    	document.getElementById('rating3').checked=true;
		}
		else if(star==2){
			document.getElementById('rating1').checked=true;
	    	document.getElementById('rating2').checked=true;
		}
		else if(star==1){
			document.getElementById('rating1').checked=true;
		}
	}
</script>

<script type="text/javascript">
//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    console.log('점수');
    console.log(newrate);
    document.getElementById('rate').value = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        console.log('elem');
        console.log(elem);
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});
</script>

<%
String[] s_arr = {"1", "2", "3", "4", "5"};
request.setAttribute("s_arr", s_arr);

String[] p_arr = {"1", "3", "5"};
request.setAttribute("p_arr", p_arr);
%>

</head>

<body class="sub">

<style>
    /*리뷰 작성*/
    #review-form{padding: 20px;background: #fff;box-shadow: 1px 1px 3px #d8d8d8;}
    #review-form .section{border-bottom:solid #E0E0E0 1px;padding:20px 0px;}
    #review-form .section:after{content:'';clear:both;display:block;width:0px;height:0px;}
    #review-form .review-title > p{color:#999999;margin-top:5px;font-size:12px;}

    #review-form .rating-title{float:left;width:290px;}
    #review-form .rating-title i{color:#EE4949}
    #review-form .score_box {float:right;width:300px;padding:18px 15px 15px 24px;border:solid #E0E0E0 1px;line-height:25px;}
    #review-form .score_box > div{}
    #review-form .score_box > div:after{content:'';clear:both;display:block;width:0px;height:0px;}
    #review-form .score_star {float:right;width:140px;padding-top:5px;}
    #review-form .score_title {float:right;width:65px;height:25px;border-radius:2px;color:#FFFFFF;text-align:center;padding-top:2px;}
    #review-form .star{margin-top:-5px;cursor:pointer;}
    #review-form .star_on {background:url('https://s3-ap-northeast-1.amazonaws.com/dcicons/2018/images/mobile/appraisal/review-rating-top-on@2x.png');background-size:25px 25px;display:inline-block;width:25px;height:25px;}
    #review-form .star_off {background:url('https://s3-ap-northeast-1.amazonaws.com/dcicons/2018/images/mobile/appraisal/review-rating-top-off@2x.png');background-size:25px 25px;display:inline-block;width:25px;height:25px;}
    .score_text {border:none;display:inline-block;width:55px;height:25px;text-align:center;}
    .score {border:none;display:inline-block;width:55px;height:15px;}
    #review-form .radio_score {float:right;width:180px;padding-top:5px;}

    #review-form .list-keyword{padding-bottom:20px;}
    #review-form .clear{clear:both;width:0px;height:0px;}
    #review-form .title{font-weight:bold;}
    #review-form .title > span {font-weight:normal}
    #review-form .title i{color:#EE4949}
    #review-form .list-keyword .input-text{width:400px;height:40px;border:solid #D5D5D5 1px;font-size:inherit;line-height:inherit}

    #review-form textarea{font-size:inherit;line-height:inherit;margin-top:10px;}
    .bc-gray-review {background-color:#D5D5D5;}
    .bc-blue{background-color:#2483FF;}

    .keyword_normal {float:left;border:solid #999999 1px;border-radius:2px;text-align:center;padding:2px 8px 0 18px;margin:8px 8px 0 0;background: url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-review-tag-nor.png) no-repeat -1px;cursor:pointer;}

    .keyword_check {float:left;border:solid #2483FF 1px;border-radius:2px;text-align:center;padding:2px 8px 0 18px;margin:8px 8px 0 0;background: #2483FF url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-review-tag-sel.png) no-repeat -1px;color:#FFFFFF;cursor:pointer;}

    .keyword_etc {float:left;border:solid #09D2E5 1px;border-radius:2px;text-align:center;padding:2px 8px 0 18px;margin:8px 8px 0 0;background: #09D2E5 url(https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/common/ic-review-tag-added.png) no-repeat -1px;color:#FFFFFF;cursor:pointer;}

    .btn {
        border:none;
        -webkit-border-radius:2px;
        -moz-border-radius:2px;
        border-radius:2px;
        width:100%;
        cursor:pointer;
        height:40px;
        font-size:13px;
    }

    .btn-black {
        background-color:#222222;
        color:#FFFFFF;
    }

    .btn.w100{width:100px;}
    .fc-blue{color:#2483FF}
    .fc-red{color:#EE4949}
    .fc-gray{color:#999}
    .w90{width:90px;}
    .w240{width:240px;}


    .image {float:left;margin-right:8px;margin-bottom:8px;}
    .image .image_wrap{width:100px;height:100px;overflow:hidden;position:relative}
    .image .image_wrap img{position:absolute;width:100%;height:100%;top:0px;left:0px;}
    .image .image_wrap img.wl{top:50%;left:50%;height:100%;width:auto;-webkit-transform: translate(-50%,-50%);  -ms-transform: translate(-50%,-50%);  transform: translate(-50%,-50%);}
    .image .image_wrap img.hl{height:auto;width:100%;top:50%;left:50%;-webkit-transform: translate(-50%,-50%);  -ms-transform: translate(-50%,-50%);  transform: translate(-50%,-50%);}
    .image_txt {text-align:right;font-size:10px;color:#999999;cursor:pointer;}
    
    .rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
	}
    
    .rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: 12px;
    z-index: 10;
    width: 50px;
    height: 50px;
    background-image: url('resources/css/starrate.png');
    
    background-size: 50px 50px;
    cursor: pointer;
    background-color: #f0f0f0;
	}
	.rating .rate_radio:checked + label {
    background-color: #0064FF;
	}

</style>

	<%@ include file="../common/header.jsp"%>
<div id="container-wrap" class="div-cont" >
    <div id="contents">
        <%-- <div id="subleft-cont">
            <div class="category-menu">
                <p class="title" align="center">'${cb.restName}' <br>평가하기</p>
                                    <div class="img" style="text-align:center;">
                        <img src="${cb.restMainImg}" alt="" style="width:180px;">
                    </div>
                                <div style="padding:20px;">
                    <div>${cb.restAdress}</div>
                    <div>${cb.restTel}</div>
                </div>
            </div>
        </div> --%>
        <div id="subright-cont">

            <div id="review-form">

                <!-- form -->
                <form id="frm_action" method="POST" action="reviewUpdate.tm?reviewNum=${rb.reviewnum}" enctype="multipart/form-data">

                <div class="section">
                    <div class="rating-title">
                        <strong>전체평점<i>*</i></strong><br/>
                        <span>이 음식점에 대한 전반적인 평가를 해주세요.</span>
                    </div>
                    <input type="hidden" name="rate" id="rate" value="0"/>
                    <input type="hidden" name="rate_star" id="rate_star" value="${rb.reviewstar}"/>
                    <div class="rating">
                		<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                		<input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                		<label for="rating1"></label>
                		<input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                		<label for="rating2"></label>
                		<input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                		<label for="rating3"></label>
                		<input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                		<label for="rating4"></label>
                		<input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                		<label for="rating5"></label>
            		</div>
                </div>
                <div class="section">
                    <div class="rating-title">
                        <strong>항목별 평점<i>*</i></strong><br/>
                        <span>이 음식점의 맛, 가격, 서비스를 항목별로 나누어 평가해주세요.</span>
                    </div>
                    <div class="score_box">
                        <div>
                            <div class="fl">맛 평가</div>
                            <div class="score_star radio_score" data-type="taste">
                            <c:forEach var="i" begin="0" end="${fn:length(p_arr)-1}" step="1">
								<input type="radio" name="reviewTaste" class="score" value="${p_arr[i]}" 
								<c:if test="${p_arr[i] == rb.reviewtaste}">checked</c:if>>
							</c:forEach>
                            <label for='taste1' class='score_text'>맛없음</label><label for='taste2' class='score_text'>보통</label><label for='taste3' class='score_text'>맛있음</label></div>
                            <div class="clear"></div>
                        </div>
                        <div style="margin:32px 0;">
                            <div class="fl">가격 평가</div>
                            <div class="score_star radio_score" data-type="price">
                            <c:forEach var="i" begin="0" end="${fn:length(p_arr)-1}" step="1">
								<input type="radio" name="reviewPrice" class="score" value="${p_arr[i]}" 
								<c:if test="${p_arr[i] == rb.reviewprice}">checked</c:if>>
							</c:forEach>
                            <label for='price1' class='score_text'>가격불만</label><label for='price2' class='score_text'>보통</label><label for='price3' class='score_text'>가격만족</label></div>
                            <div class="clear"></div>
                        </div>
                        <div>
                            <div class="fl">서비스 평가</div>
                            <div class="score_star radio_score" data-type="service">
                            <c:forEach var="i" begin="0" end="${fn:length(p_arr)-1}" step="1">
								<input type="radio" name="reviewService" class="score" value="${p_arr[i]}" 
								<c:if test="${p_arr[i] == rb.reviewservice}">checked</c:if>>
							</c:forEach>
                            <label for='service1' class='score_text'>불친절</label><label for='service2' class='score_text'>보통</label><label for='service3' class='score_text'>친절함</label></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
                
                <div class="section">
                                        <!-- 방문후기 -->
                    <input id="hid_contents_deny" type="hidden" value="" />
                    <div style="position:relative">
                        <div class="title"><strong>방문후기</strong> <span class="deny fc-red"></span></div>
                        <div style="position:absolute;right:0px;top:0px;"></div>
                        <div class="clear"></div>
                    </div>

                    <textarea id="txt_contents" name="reviewContent" class="fs-13" placeholder="음식, 서비스, 분위기, 위생상태 등의 방문 경험을 적어주세요." style="border:solid 1px #D5D5D5; width:100%; height:120px;">${rb.reviewcontent}</textarea>
                    <div style="padding-top:5px;">
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="section">
                                        <!-- 사진 -->
                    <div>
                        <div class="title fl">
                            음식・실내외 사진 <span class="fs-11 fc-red"></span><br />
                            <span class="fc-gray" style="line-height:1.0;">- 본인이 직접 촬영하지 않은 사진<br/>- 1000 * 1000미만 해상도의 사진은 통보없이 삭제될 수 있습니다.</span>
                        </div>
                        <div class="fr">
                            <br />
                            <button type="button" class="btn btn-black w90 fr" style="background-color:#ff7100;" onClick="fn_addFile()">사진첨부</button>
                        </div>
                        <div class="clear"></div>
                        <div id="d_file"></div>
                    </div>
                    
                </div>
                
                    <div style="padding:20px 0px;text-align:center;">
                    <button id="btn_save" type="submit" class="btn btn-black w240" style="background-color:#ff7100;">평가제출</button>
               		</div>
                                    </form>

                
            </div>
        </div>
    </div>
</div>

</body>
</html>