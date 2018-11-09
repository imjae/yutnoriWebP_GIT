<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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

input[name=name] {
	margin: 30px 6px;
	margin-top: 30px;
	width: 95%;
	height: 64px;
	border: 1.3px solid lightgray;
	font-size: 1em;
	padding-left: 20px;
}
input[name=jumin1],input[name=jumin2] {
	width: 42%;
	margin: 10px 6px;
	height: 64px;
	border: 1.3px solid lightgray;
	font-size: 1em;
	padding-left: 20px;
}

	input[name=user_phone1] {
		width: 60px;
		height: 40px;
		border: 1.3px solid lightgray;
	font-size: 1em;
	}
	input[name=user_phone2] {
		width: 80px;
		height: 40px;
		border: 1.3px solid lightgray;
	font-size: 1em;
	}
	input[name=user_phone3] {
		width: 80px;
		height: 40px;
		border: 1.3px solid lightgray;
	font-size: 1em;
	}
	
	select {
		margin: 30px 10px;
		margin-right: 30px;
		margin-left: 30px;
		width: 80px;
		height: 45px;
		font-size: 1em;
		border: 1.3px solid lightgray;
	}

input[type=text]::placeholder {
	font-size: 1.1em;
	color: lightgray;
}
input[type=password]::placeholder {
	font-size: 1.1em;
	color: lightgray;
}

div#phoneDiv {
	width: 600px;
	height: 100px;
	border: 1px solid black;
	margin: 0 auto;
}

div#authBtn_to {
	display: inline-block;
	width: 100px;
	height: 45px;
	margin: 0 6px;
	margin-left: 20px;
	margin-top: 30px;
	background: rgba(166,175,255,1);
	color: white;
	line-height: 45px;
	text-align: center;
}
div#authBtn_to:hover {
	cursor: pointer;
}
div#authBtn_from {
	display: inline-block;
	width: 100px;
	height: 45px;
	margin: 0 6px;
	margin-left: 20px;
	margin-top: 30px;
	background: rgba(166,175,255,1);
	color: white;
	line-height: 45px;
	text-align: center;
}
div#authBtn_from:hover {
	cursor: pointer;
}

input[name=authNum] {
	margin-left: 150px;
	width: 200px;
	height: 45px;
	border: 1.3px solid lightgray;
	font-size: 1em;
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

label {
	display: inline-block;
	margin-left: 80px;
	margin-top: 60px;
	margin: 0 auto;
}

div#idPwFind_end {
	margin: 20px auto;
	
	width: 250px;
	height: 60px;
	border-radius: 4px;
	text-align: center;
	line-height: 60px;
	background: rgba(166,175,255,1);
	color: white;
	font-weight: normal;
	font-size: 1.3em;
}

div#idPwFind_end:hover {
	cursor: pointer;
}

label#result {
	margin: 10px auto;
	line-height: 50px;
	margin-left: 140px;
	font-weight: lighter;
	text-align: center;
}

div#countTime {
	width: 300px;
	height: 100px;
	margin: 30px auto;
	font-size: 1.3em;
	color: gray;
	

}

</style>

<script type="text/javascript">
$(function(){
	
	var cnt = 180;
	var counter = setInterval(function(){
		if(cnt>=0){
			$("label#time").html(cnt);
			cnt--;
		}else {
			clearInterval(counter);
			$("label#time").html("유효시간이 지났습니다.");
		}
	},1000);


	$("input[type=text]").focus(function(){
		$(this).css("border","1.3px solid rgba(166,175,255,1)");
	});
	$("input[type=text]").blur(function(){
		$(this).css("border","1.3px solid lightgray");
	});
	
	
	$("div#authBtn_to").click(function(){
		// 이름, 주민등록번호, 핸드폰 번호 DB로 검색하는 ajax 구현
		$.ajax({
	        async: true,
	        type : 'POST',
	        data : {
	        	"name" : $("input[name=name]").val() ,
	        	"jumin1" : $("input[name=jumin1]").val(),
	        	"jumin2" : $("input[name=jumin2]").val(),
	        	"phone1" : $("input[name=user_phone1]").val(),
	        	"phone2" : $("input[name=user_phone2]").val(),
	        	"phone3" : $("input[name=user_phone3]").val(),
	        },
	        url : "userNameJuminCheck.do",
	        success : function(data) {
	            if (data == 'X') {
	                // 로그인 실패
	                $("label").css("color", "red");
				    $("label").html(" 개인정보를 정확히 입력해 주세요 !!");
	                $("label").effect("shake");
	                return false;
	            } else {
	            	// 로그인 성공
	            	 //ajax 결과에 따라 인증 버튼이 바뀜.
					$("div#phoneDiv1").css("display","none");
	    			$("div#phoneDiv2").css("display","block");
	    			
	    			$("form#smsAuth_send").submit();
	    			
	    			
	    			
	            }
	        },
	        error : function(error) {
	            alert("error : " + error);
	        }
	    });  
	});
	
	
	$("div#authBtn_from").click(function(){
		var authNum = $("input[name=authNum]").val();
		var session = "<%=session.getAttribute("smsAuth_num") %>";
		
		if(authNum.length != 8){
			$("label").css("color","red");
			$("label").css("font-size","1.2em");
			$("label").html(" X 인증번호가 유효하지 않습니다. [ex)문자+숫자 8글자]");
			 $("label").effect("shake");
			return false;
		}else if(authNum != session){
			
			$("label").css("color","red");
			$("label").css("font-size","1.2em");
			$("label").html(" X 인증번호가 일치하지 않습니다.");
			 $("label").effect("shake");
			return false;
			
		}else {
			
			//인증 번호 일치함, 아래쪽이 아이디 리스트 띄운다.
			
			$("form#idPwFind_final").submit();
			alert("인증 성공!");
			
			$("label").css("color","green");
			$("label").css("font-size","1.2em");
			$("label").html(" X 인증번호가 일치하지 않습니다.");
			
		}
	});
	
	$("div#idPwFind_end").click(function(){
		window.opener.location.href="../login/loginPage.jsp";
		window.close();
	});
	
	
	
});
	

</script>

</head>
<body>

<div id="login_form_layout">
	<div id="login_title">
		ID/PW 찾기	
	</div>
	<div id="login_form">
		<div id="idLogin"> 휴대폰 인증 방식 </div>
		<div id="oneTimeLogin"> OTP 인증 방식 </div>
	</div>
	<c:if test="${param.step==01 }">
	<form action="smsAuth_send.do" method="post" id="smsAuth_send">
		<input type="text" name="name" placeholder="&nbsp;&nbsp;&nbsp; 이름을 입력해주세요.">
		<input type="text" name="jumin1" placeholder="&nbsp;&nbsp;&nbsp; 주민등록번호(앞 6자리)"> - 
		<input type="password" name="jumin2" placeholder="&nbsp;&nbsp;&nbsp; 주민등록번호(뒤 7자리)">
		
		<div id="phoneDiv1">
		
		<select name="agency">
				<option value="SKT">SKT</option>
				<option value="KT">KT</option>
				<option value="LG">LG</option>
			</select>
			
		
			<input type="text" name="user_phone1"> &nbsp;-&nbsp; 
			<input type="text" name="user_phone2">&nbsp;-&nbsp; <input type="text" name="user_phone3">
		<div id="authBtn_to">인 증</div>
		
		
		
		</div>
	</form>
		</c:if>
		<c:if test="${param.step==02 }">
			
			<form action="../user/idPwFind_final.do" id="idPwFind_final" method="post">
				<div id="phoneDiv2">		
					<input type="hidden" value="${dto.user_name}" name="name">
					<input type="hidden" value="${dto.user_phone}" name="phone">
					<input type="text" name="authNum" placeholder="&nbsp;&nbsp;&nbsp;인증번호 입력">
					<div id="authBtn_from">인증하기</div><br>
					
					<div id="countTime">인증번호 유효시간: <label id="time"></label> 초</div>
				</div>
			</form>
		</c:if>
		
		
		<label></label>
		<c:if test="${param.step==03 }">
		<label id="result">
		회원님의 아이디는<strong> ${id } </strong><br>
		패스워드는 <strong>${pw }</strong>
		입니다.
		</label>
		
		<div id="idPwFind_end">
			로그인하러 가기
		</div>
		</c:if>
	

</div>


</body>
</html>