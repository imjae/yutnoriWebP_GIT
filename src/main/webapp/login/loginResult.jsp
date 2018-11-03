<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	#login_label {
		position: relative;
		top: 10px;
	}
	
	#loginForm {
		left: 0;
		margin: 10px;
		width: 99.5%;
		height: 100%;
		font-size: 0.8em;
		color: white;
		top: -10px;
		left: -10px;
		position: relative;
		background-image: url("../etc/image/mainImage/loginForm_back.png");
	}
	
	div#char_img {
		border: 1px solid white;
		width: 110px;
		height: 140px;
		margin-top: 15px;
		margin-left: 23px;
		float: left;
	}
	div#char_info {
		border: 1px solid white;
		margin-top: 15px;
		margin-left: 20px;
		width: 185px;
		height: 140px;
		float: left;
	}
	
	div#char_info div {
		height: 25%;
		width: 100%;
		font-size: 0.7em;
		border-bottom: 1px solid white;
		
	}

</style>

</head>
<body id = "zxcv">
<div id="loginForm">


<div id="login_label">- MY  INFO -</div>


	<div id="charcter">

		<div id="char_img"></div>
		<div id="char_info">
			<div id="user_id">${dto.user_id }</div>
			<div id="user_money">${dto.user_money }</div>
			<div id="user_tear"> ${dto.user_tear }</div>
			<div id="user_id"></div>
		</div>

	</div>

</div>
</body>
</html>