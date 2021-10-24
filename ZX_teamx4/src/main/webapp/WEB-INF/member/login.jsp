<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>로그인 페이지</title>
<link type="text/css" rel="stylesheet" href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/jqueryui/1.11.4/jquery-ui.min.css?201709272" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css?201709272" />
<link rel="stylesheet" href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/css/common.css?201709272" />
<link rel="stylesheet" href="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/css/user_web.css?201709272" />
<style>
body {
	font-family: 'AppleSDGothicNeo-Regular', 'Nanum Gothic', Helvetica, Arial, sans-serif;
}
</style>
<!-- 카카오 스크립트 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script>
	Kakao.init('50f8c205c33579235018b30cc602581b'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단 true가 되면 활성화 성공
	//카카오로그인
	function kakaoLogin() {
	    Kakao.Auth.login({
	    	persistRefreshToken: false,
	      	success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (res) {
	        	  var kakaoId = '@k'+res.id;
	        	  
	        	  $.ajax({
	        		  url : '/ex/checkId.me',
	        		  headers : {
	        			  "Accept" : "application/json",
	                      "Content-Type" : "application/json"
	        		  },
	        		  data:({
	        			 user_num : kakaoId 
	        		  }),
	        		  success : function(checkId){
	        			  if($.trim(checkId)=='false'){
	        				  console.log('회원가입중');
	        				  $.ajax({
	        					  url : '/ex/addUser.me',
	        					  headers : {
	        						  "Accept" : "application/json",
	        	                      "Content-Type" : "application/json"
	        					  },
	        					  data :({
	        						 user_num : kakaoId,
	        						 user_name : res.properties.nickname,
	        						 user_image : res.properties.profile_image,
	        						 user_email : res.kakao_account.email,
	        						 user_gender : res.kakao_account.gender
	        					  }),
	        					  success : function(data){
	        						  console.log('회원가입 완료-로그인');
	        						  localStorage.setItem('name', res.properties.nickname);
	        						  location.href='/ex/main.tm';
	        					  },
	        				  })
	        			  }
	        			  if($.trim(checkId)=='true'){
	        				  console.log('로그인');
	        				  localStorage.setItem('name', res.properties.nickname);
	        				  location.href='/ex/main.tm';
	        			  }
	        			  
	        		  },
	        		  fail : function(error){
	        			  console.log(error)
	        		  }
	        		  
	        	  });
	        	  // alert(res.properties.nickname+'님 환영합니다');
	        	  
	          },// res
	          
	          fail: function (error) {
	            console.log(error)
	          },
	          
	        }) // request
	      
	      	},//response
	      
	      fail: function (error) {
	        console.log(error)
	      },
	      
	    })//auth
	    
	  }//로그인
	  
	  function kakaoBiz() {
		    Kakao.Auth.login({
		      	success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (res) {
		        	  var kakaoId = '@k'+res.id;
		        	  
		        	  $.ajax({
		        		  url : '/ex/checkId.me',
		        		  headers : {
		        			  "Accept" : "application/json",
		                      "Content-Type" : "application/json"
		        		  },
		        		  data:({
		        			 user_num : kakaoId 
		        		  }),
		        		  success : function(checkId){
		        			  if($.trim(checkId)=='false'){
		        				  console.log('회원가입중');
		        				  $.ajax({
		        					  url : '/ex/addUser.me',
		        					  headers : {
		        						  "Accept" : "application/json",
		        	                      "Content-Type" : "application/json"
		        					  },
		        					  data :({
		        						 user_num : kakaoId,
		        						 user_name : res.properties.nickname,
		        						 user_image : res.properties.profile_image,
		        						 user_email : res.kakao_account.email,
		        						 user_gender : res.kakao_account.gender
		        					  }),
		        					  success : function(data){
		        						  console.log('회원가입 완료');
		        						  localStorage.setItem('name', res.properties.nickname);
		        						  location.href='/ex/addBizUser.me';
		        					  },
		        				  })
		        			  }
		        			  if($.trim(checkId)=='true'){
		        				  console.log('로그인');
		        				  localStorage.setItem('name', res.properties.nickname);
		        				  location.href='/ex/addBizUser.me';
		        			  }
		        			  
		        		  },
		        		  fail : function(error){
		        			  console.log(error)
		        		  }
		        		  
		        	  });
		        	  // alert(res.properties.nickname+'님 환영합니다');
		        	  
		          },// res
		          
		          fail: function (error) {
		            console.log(error)
		          },
		          
		        }) // request
		      
		      	},//response
		      
		      fail: function (error) {
		        console.log(error)
		      },
		      
		    })//auth
		    
		  }//로그인
		  
	</script>
</head>
<body>
	<div class="warp">
		<div class="header"><a href="/ex/main.tm"><img src="resources/images/logo.png" style="width:400px;height:220px;"/></a></div>
		<div class="container">
			<div class="row">
				<form id="frm_login" method="POST">
				<div class="login">
					<div class="title bb-gray">로그인 및 회원가입</div>
						<div class="fs-15 fw-b" style="padding:24px 0;">
						로그인을 통해 teamx4의 다양한 혜택을 누리세요.
					</div>
					<button type="button" class="btn btn-yellow" style="background-color:yellow" onclick="kakaoLogin();">카카오계정으로 로그인</button>
					<!-- https://kauth.kakao.com/public/widget/login/kr/kr_02_medium.png --> 
					<div style="padding:14px 0;"> 
						<div class="fl" style="border-bottom:solid #E0E0E0 1px; width:400px; height:7px;"></div>
						<div class="clear"></div>
					</div>
					<div style="margin:24px 0 100px 0; padding:24px 0; border:solid #E0E0E0 1px; line-height:24px;">
						<span class="fs-15 fw-b">teamx4 사업자 회원가입</span><br>
						<span>카카오계정으로 사업자 회원가입이 가능합니다</span><br>
                    	<button id="btn_intro" type="button" class="btn btn-white w200" style="margin-top:12px; background-color:#ff7100" onclick="kakaoBiz();">사업자 회원가입</button>
                    </div>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>