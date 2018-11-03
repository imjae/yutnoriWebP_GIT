<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>


<style type="text/css">

	#login_label {
		position: relative;
		left: -7px;
		top: 10px;
	}
	
	div#loginForm {
		left: 3px;
		margin: 10px;
		width: 99.5%;
		height: 100%;
		font-size: 0.8em;
		color: white;
		top: -8px;
		left: -10px;
		position: relative;
		background-color: rgba(0,0,0,0.7);
	}
	
	
	#input_id input[type=text] {
		margin-top: 30px;
		margin-left: 25px;
		border: 1px solid white;
		float: left;
		width: 60%;
		height: 35px;
	}
	
	#login_btn {
		margin-top: 29px;
		margin-left: 12px;
		width: 80px;
		height: 95px;
		float: left;
		background-color: #ffe220;
		color: black;
		line-height: 95px;
		font-family: "-윤고딕320";
		font-size: 0.7em;
	}
	
	#login_btn:hover {
		cursor: pointer;
	}
	#input_pw input[type=password] {
		clear: both;
		float: left;
		margin-top: -40px;
		margin-left: 25px;
		border: 1px solid white;
		width: 60%;
		height: 35px;
	}
	

</style>

<script type="text/javascript">

	$(function(){
		$("div#login_btn").click(function(){
			
			$("form#loginForm").submit();
		});
	});

</script>

</head>
<body id = "zxcv">
<div id="loginForm">
<div id="login_title">
<div id="login_label">MEMBER LOGIN</div>
</div>

<form id="loginForm" method="post" action="../login/userLogin.do">
<div id="input_id">
	<input type="text" name="id" placeholder="아이디">
</div>

<div id="login_btn">
	로그인
</div>

<div id="input_pw">
	<input type="password" name="pw" placeholder="비밀번호">
</div>

</form>

</div>

</body>
</html>