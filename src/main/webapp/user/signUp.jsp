<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

div#signUp_total {
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	margin: 0 auto;
	width: 1150px;
	height: 1500px;
}

div#signUp_step {
	width: 24.5%;
	height: 100%;
	float: left;
	
	
}

div#signUp_main {
	width: 75.1%;
	height: 100%;
	border-left: 3px solid black;
	border-right: 1px solid black;
	float: left;
}

div#signUp_main:after {
	content: "";
	clear: both;
	
}

div#signUp_step div {
	margin-left: 3px;
	width: 100%;
	height: 172px;
}

</style>

</head>
<body>
	
	<div id="signUp_total">
		<div id="signUp_step">
			
			<c:if test="${param.step eq 'signUp_step01'}">
				<div id="sign_step01">
					<img src="../etc/image/signUpImage/step01_selected.png"/>
				</div>
				<div id="sign_step02">
					<img src="../etc/image/signUpImage/step02_based.png"/>
				</div>
				<div id="sign_step03">
					<img src="../etc/image/signUpImage/step03_based.png"/>
				</div>
				<div id="sign_step04">
					<img src="../etc/image/signUpImage/step04_based.png"/>
				</div>
			</c:if>
			<c:if test="${param.step eq 'signUp_step02'}">
				<div id="sign_step01">
					<img src="../etc/image/signUpImage/step01_based.png"/>
				</div>
				<div id="sign_step02">
					<img src="../etc/image/signUpImage/step02_selected.png"/>
				</div>
				<div id="sign_step03">
					<img src="../etc/image/signUpImage/step03_based.png"/>
				</div>
				<div id="sign_step04">
					<img src="../etc/image/signUpImage/step04_based.png"/>
				</div>
			</c:if>
			<c:if test="${param.step eq 'signUp_step03'}">
				<div id="sign_step01">
					<img src="../etc/image/signUpImage/step01_based.png"/>
				</div>
				<div id="sign_step02">
					<img src="../etc/image/signUpImage/step02_based.png"/>
				</div>
				<div id="sign_step03">
					<img src="../etc/image/signUpImage/step03_selected.png"/>
				</div>
				<div id="sign_step04">
					<img src="../etc/image/signUpImage/step04_based.png"/>
				</div>
			</c:if>
			<c:if test="${param.step eq 'signUp_step04'}">
				<div id="sign_step01">
					<img src="../etc/image/signUpImage/step01_based.png"/>
				</div>
				<div id="sign_step02">
					<img src="../etc/image/signUpImage/step02_based.png"/>
				</div>
				<div id="sign_step03">
					<img src="../etc/image/signUpImage/step03_based.png"/>
				</div>
				<div id="sign_step04">
					<img src="../etc/image/signUpImage/step04_selected.png"/>
				</div>
			</c:if>
		</div>
		
		<div id="signUp_main">
			<!-- stignUp 메인 페이지 include!! -->
			<%-- <c:import url="signUp_step03.jsp"></c:import> --%>
			<c:import url="${param.step }.jsp"></c:import>
		</div> 
	
	
	</div>

</body>
</html>