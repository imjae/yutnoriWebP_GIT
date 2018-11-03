<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>

<style type="text/css">
	
	div#step02_total {
		padding: 0px 40px;
		font-family: "-윤고딕320";
		
	}
	
	div#top_title1 {
		width: 95%;
		height: 120px;
		border-bottom: 2px solid lightgray;
		padding-left: 30px;
	}
	
	div#top_title1 div.top_title1 {
		font-size: 2.4em;
		float: left;
		line-height: 120px;
	}
	
	div#top_title1 div.top_title2 {
		font-size: 0.95em;
		float: left;
		line-height: 140px;
		color: gray;
	}
	div#top_title2 {
		border-bottom: 0.7px solid lightgray;
		clear: both;
		font-size: 1.6em;
		left: 0;
		line-height: 60px;
		height: 80px;
	}

	
	div#signUp_btn {
		width: 100%;
		height: 100px;
		margin-top: 0px;
		position: relative;
		text-align: center;
	}
	
	div#align_div {
		display: inline-block;
	}
	
	div#okBtn {
		display: inline-block;
		width: 200px;
		height: 50px;
		border: 1px solid #dadada;
		float: left;
		margin-left: 70px;
		margin-top: 25px;
		border-radius: 3px;
		background-color: #dadada;
		color: #5f5f5f;
		line-height: 50px;
		font: "-윤고딕330";
		text-align: center;
		font-size: 1.3em;
		
	}
	div#okBtn:hover { cursor: pointer; }

	
	div#mid_layout {
		margin-left: -30px;
		width: 100%;
		height: 420px;
		border-bottom: 1px solid lightgray;
	}
	
	div#mid_left_img {
		width: 370px;
		height: 100%;
		background-image: url("../etc/image/signUpImage/sign_success.png");
		float: left;
		
	}
	div#mid_right {
		margin-top: 100px;
		float: left;
		width: 400px;
		height: 50%;
		border-left: 1px dotted lightgray;
	}
	
	div#mid_right label:nth-child(1) {
		font-size: 2em;
		margin-top: 30px;
	}
	div#mid_right label:nth-child(2) {
		font-size: 1em;
	}
	
	div#input_authNum input[type="text"] {
		margin-top: 25px;
		width: 210px;
		height: 50px;
		border-radius: 5px;
		background-color: #efefef;
		border: 2px solid rgba(00,a5,ff,0.7);
		font-size: 1.5em;
		float: left;
	}
	
	div#bottom_msg {
		margin: 20px auto;
		
		width: 70%;
		height: 100px;
		border: 1px solic gray;
		color: gray;
		font-size: 1.1em;
	}
	
	div#auth_time {
		margin: 0 auto;
		margin-top: -58px;
		width: 90%;
		height: 70px;
		background-color: #efefef;
		text-align: center;
		line-height: 70px;
		font-size: 1.1em;
	}
	
	label#auth_check {
		clear: both;
		width: 200px;
		height: 30px;
		margin-top: 20px;
		font-size: 1.5em;
	}	
	
	div#auth_check_div {
		margin-left: 10px;
		margin-top: 100px;
		width: 300px;
		height: 90px;
	}
	
	span#email_link {
		font-weight: bold;
		font-size: 1.2em;
		color: #3366cc;
	}
	span#email_link:hover {
		cursor: pointer;
	}
	
</style>

<script type="text/javascript">

	$(function(){
		
		
		$("div#okBtn").click(function(){
			
			location.href="../main/index.jsp";
			
		});
	});

</script>

</head>
<body>
<div id="step02_total">
	<div id="top_title1">
		<div class="top_title1">가입 완료</div>
		<div class="top_title2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일 인증을 통한 회원가입이 완료되었습니다.</div>
	</div>
	
	<div id="mid_layout">
		<div id="mid_left_img">
		
		</div>
		
		<div id="mid_right">
			<label id="1">회원 가입을 환영합니다!</label><br><br>
			<label id="2">회원님의 ID 는
			<span id="email_link">${dto.user_id }</span> 입니다.
			
			</label>
			
			<div id="okBtn">
				로그인 하러가기
			</div>
			
			<div id="auth_check_div">
				<label id="auth_check"> &nbsp;&nbsp; </label>
			</div>
		</div>
		
	</div>
	
	
</div>
</body>
</html>