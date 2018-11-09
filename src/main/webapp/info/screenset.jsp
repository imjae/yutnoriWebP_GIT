<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>화면구성</title>
<style type="text/css">
div#title{
	color : blue;
	text-align: center;
	background-image: ../etc/image/downImage/photo6.jpg;
}
div#am{
color:red;
text-align:center;
}
div#login{
weight:100px;
}

div#info_total {
	width: 100%;
	height: auto;
}
</style>
</head>
<body>
<div id="info_total">
	<div id="title">
	<h3>로그인 화면 구성</h3>
	</div>
		<div id="login" align="center">
			<img alt="" src="../etc/image/downImage/login.jpg">
		</div>
		<div id="am">
			회원가입을 한다. -> 가입한 아이디와 패스워드를 입력한다. -> 대기실 입장
		</div>
		<div id="title">
			<h3>대기실 화면구성</h3>
		</div>
		<div id="wait" align="center">
			<img alt="" src="../etc/image/downImage/waitroom.jpg">
		</div>
		<div id="am">
			대기실 입장 -> 방만들기(방참가)를 한다. -> 게임방 입장 
		</div>
		<div id="title">
			<h3>게임방 화면구성</h3>
		</div>
		<div id="start" align="center">
			<img alt="" src="../etc/image/downImage/gameroom.jpg">
		</div>
		<div id="am">
			게임방 입장 -> 게임시작(준비) 한다. -> 윷노리를 즐긴다.
		</div>
</div>
</body>
</html>