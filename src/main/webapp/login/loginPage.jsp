<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>

<style type="text/css">

body {
	font-family: "-윤고딕310";
}

div#top_info {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 60px;
	border: 1px solid blue;
}

div#login_form_layout {
	width: 600px;
	height: 1200px;
	margin: 0 auto;
	font-weight: bold;
	font-size: 1.1em;
	
	/* border-left: 1px solid blue;
	border-right: 1px solid blue; */
}

div#login_title {
	width: 93%;
	height:60px;
	font-size: 2em;
	margin: 0 auto;
	margin-top: 100px;
}

div#idLogin {
	margin-left: 6px;
	width: 49%;
	height: 70px;
	border-left: 1.2px solid lightgray;
	border-top: 1.2px solid lightgray;
	border-right: 1.2px solid lightgray;
	float: left;
	line-height: 70px;
	text-align: center;
}
div#oneTimeLogin {
	width: 49%;
	height: 70px;
	float: left;
	border-top: 1.2px solid lightgray;
	border-right: 1.2px solid lightgray;
	border-bottom: 1.2px solid lightgray;
	background-color: #eaeaea;
	line-height: 70px;
	text-align: center;
	color: gray;
}

input[name=id] {
	margin: 30px 6px;
	margin-top: 30px;
	width: 95%;
	height: 64px;
	border: 1.3px solid lightgray;
	font-size: 1em;
	padding-left: 20px;
}
input[name=pw] {
	width: 95%;
	margin: 0 6px;
	height: 64px;
	border: 1.3px solid lightgray;
	font-size: 1em;
	padding-left: 20px;
}

input[type=text]::placeholder {
	font-size: 1.1em;
	color: lightgray;
}

div#loginBtn {
	width: 99%;
	height: 64px;
	margin: 0 6px;
	margin-top: 30px;
	font-size: 1.2em;
	background: rgba(166,175,255,1);
	color: white;
	line-height: 64px;
	text-align: center;
}

div#loginBtn:hover, .bot:hover, div#idLogin:hover, div#ongTimeLogin:hover {
	cursor: pointer;
}

.bot {

	margin-top: 20px;
	border-right: 1px solid lightgray;
	float:left;
	padding: 2px 10px;
	font-size: 0.9em;
	color: gray;
}
</style>

<script type="text/javascript">
$(function(){


	$("input[type=text]").focus(function(){
		$(this).css("border","1.3px solid rgba(166,175,255,1)");
	});
	$("input[type=text]").blur(function(){
		$(this).css("border","1.3px solid lightgray");
	});
	
	
	$("div#loginBtn").click(function(){
		$.ajax({
	        async: true,
	        type : 'POST',
	        data : {
	        	"id" : $("input[name=id]").val() ,
	        	"pw" : $("input[name=pw]").val()
	        },
	        url : "../user/userIdPwCheck.do",
	        success : function(data) {
	            if (data == 'X') {
	                // 로그인 실패
	                alert("아이디 or 비밀번호가 틀렸습니다.");
	                
	                return false;
	            } else {
	            	// 로그인 성공
	            	$("form#loginPage").submit();
	            }
	        },
	        error : function(error) {
	            
	            alert("error : " + error);
	        }
	    }); 
		
	});
	
});
	

</script>

</head>
<body>
<div id="top_info">
	
</div>

<div id="login_form_layout">
	<div id="login_title">
		로그인	
	</div>
	<div id="login_form">
		<div id="idLogin"> ID(E-mail) 로그인</div>
		<div id="oneTimeLogin"> 일회용 로그인 </div>
	</div>
	
	<form action="userLogin.do" method="post" id="loginPage">
		<input type="text" name="id" placeholder="&nbsp;&nbsp;&nbsp; ID ( 이메일 형식 ) 를 입력해 주세요.">
		<input type="text" name="pw" placeholder="&nbsp;&nbsp;&nbsp; 비밀번호를 입력해 주세요.">

		<div id="loginBtn">로그인</div>
	</form>
	<div id="findId" class="bot">
	ID 찾기
	</div>
	<div id="findPw" class="bot">
	비밀번호 찾기
	</div>
	<div id="signUp" class="bot">
	회원가입
	</div>
</div>


</body>
</html>