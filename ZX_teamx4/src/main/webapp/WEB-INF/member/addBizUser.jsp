<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>teamx4 파트너 서비스</title>

<link rel="stylesheet"
	href="https://partner.diningcode.com/css/common.css?v=4">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="resources/images/logo.png" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<script src="https://partner.diningcode.com/js/common.js"></script>
<script>
window.onload = function(){
	let user_diningReg = document.getElementById('user_diningReg').value;
	document.getElementById('img_reg').src=user_diningReg;
}

function uploadfile(){
	document.getElementById('uploadFile').click();
}

function setReg(event){
	let reader = new FileReader();
	reader.onload = function(event){
		document.getElementById('img_reg').src=event.target.result;
	}
	reader.readAsDataURL(event.target.files[0]);
}
</script>
<style>
	.fl { float:left; }
	.clear { clear:both; }
	.header{
		width: 100%;
	    padding: 22px 0;
	    border-bottom: solid #E0E0E0 1px;
	    text-align: center;
	    background:white;
	}
	.btn{
		border:1px solid #ff7100 !important;
	}
</style>
</head>
<body>
	<div class="header">
		<a href="/ex/main.tm"><img src="resources/images/logo.png" style="width:400px;height:220px;"/></a>
	</div>
	<div class="sub-wrap pb-2" id="content">
		<form id="form-partner" action="/ex/insertBizUser.me"
			class="form-wide" method="post" enctype="multipart/form-data">
			<div class="sub mt-2 rel">
				<h1>사업자 무료체험 신청 및 회원가입 입력사항</h1>
				<div class="abs" style="right: 20px; top: 25px;">
					식당정보 입력
				</div>
				<div class="pd-2">
					무료체험 신청과 동시에 teamx4의 회원가입이 진행됩니다.
				</div>
			</div>

			<div class="sub mt-2 pb-2">
				<div class="pd-2 bb">
					<h2>내식당 정보(필수)</h2>
				</div>
				<div class="form-row">
					<label for="" class="form-label gray strong">사업자 등록증 첨부</label>
					<div class="fl" style="width:110px; height:110px; margin-left:20px; margin-top:20px;">
							<input type="hidden" name="user_diningReg" id="user_diningReg" value="https://cdn.icon-icons.com/icons2/3005/PNG/512/file_attachment_icon_188265.png">
							<img id="img_reg" src="" width="110" height="110" />
						</div>
						<div class="fl" style="height:110px; padding-top:90px;">
							<input type="file" name="uploadFile" id="uploadFile" onchange="setReg(event)" style="display:none;">
							<button id="btn_image" type="button" class="btn btn-black w150" onclick="uploadfile()" style="margin-left:12px; width:90px; background-color:#ff7100">찾아보기</button>
						</div>
						<div class="clear"></div>
						<br>
						<span id="biz_reg" style="margin-left:20px; margin-bottom:20px;">사업자등록증 이미지를 등록해 주세요.</span>
				</div>
				<div class="form-row">
					<label class="form-label gray strong">식당 상호명</label>
					<div class="form-group block">
						<input type="text" name="name" id="name" class="form-control"
							placeholder="식당이름을 입력해주세요">
					</div>
				</div>
				<div class="form-row">
					<label class="form-label gray strong">식당 주소</label>
					<div class="form-group block">
						<textarea name="addr" id="addr" class="form-control"
							placeholder="지번주소를 입력해주세요." style="height: 80px;"></textarea>
					</div>
				</div>
				<div class="form-row last">
					<label class="form-label gray strong">식당 대표 전화번호</label>
					<div class="form-group block">
						<input type="text" name="tel" id="tel" class="form-control"
							placeholder="식당 대표 전화번호를 입력해주세요">
					</div>
				</div>
			</div>

			<div class="mt-2 text-center pb-2">
				<input type="submit" value="등록" class="btn" style="width:300px; background-color:#ff7100;">
			</div>
		</form>
	</div>

	<script>
        $(function(){
            $("#form-partner").on("submit",function(){
                var error = false;

                if($("#name").val() == "") {
                    $("#name").addClass('error');
                    error = true;
                }

                if($("#addr").val() == "") {
                    $("#addr").addClass('error');
                    error = true;
                }
                
                if($("#uploadFile").val() == "") {
                	document.getElementById('img_reg').src="https://cdn.icon-icons.com/icons2/602/PNG/512/Error_icon-icons.com_55916.png";
                    error = true;
                }
                
                if($("#tel").val() == "") {
                    $("#tel").addClass('error');
                    error = true;
                }

                if(error) {
                    return false;
                }
            });
        });
    </script>
</body>
<script src="https://partner.diningcode.com/js/partner.js"></script>
</html>