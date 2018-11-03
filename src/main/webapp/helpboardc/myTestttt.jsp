<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index(client)</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../etc/css/helpBody.css" />
<style type="text/css">
.m_body, .m_header, .subm, .subm p {
	margin: 0px 0px;
	padding: 0px 0px;
}
#menu_cs .m_header .header_a {
	float: left;
	width: 179px;
	height: 48px;
	color: #5e5e5e;
	display: block;
	font-size: larger;
	/* text-decoration: underline; */
}

#menu_cs a {
	display: block;	
	width: 179px;
	height: 48px;
	line-height: 48px;
	text-align: center;
	font-weight: bold;
	color: gray;
	text-decoration: none;
	float: left;
	/* border: 1px solid black; */
}

.m_header{
	color: black;
	height: 48px;
}

#menu_cs .m_header a:hover {
	/* margin-bottom: -7px;
	border-bottom: 7px solid #c03; */
	color: black;
	font-size: large;
	text-shadow: 4px 2px 2px gray; 
}
.m_header_btn {
	margin-bottom: -7px;
	border-bottom: 7px solid #c03;
	color: black;
	font-size: large;
}

#menu_cs .m_body a:hover {
	/* margin-bottom: -7px;
	border-bottom: 7px solid #fcf0f3; */
	color: black;
	font-size: large;
}

.m_body {
	width: 716px;
	height: 144px;
	/* border: 1px solid black; */
}

#menu:after {
	content: "";
	display: block;
	clear: both;
	float: none;
}
.subm {
	width: 179px;
	float: left;
	margin: 0px 0px;
	padding: 0px 0px;
	/* border: 1px solid black; */
}
</style>

<script type="text/javascript">
	$(function() {
		$(".m_body").hide();
		
		$(".m_header a").click(function() {
			$(".m_body").slideDown(300);
			
			$(this).addClass("m_header_btn");
			$(".m_header a").not(this).removeClass("m_header_btn");
		});
		
	});
</script>

</head>
<body>
	<div id="helpSection">
		<div id="helpMenu">
		
		
			<div id="menu_cs">
				<br>
				<div class="m_header">
					<a href="#" class="header_a">게임 관련</a>
					<a href="#" class="header_a">아이디 관련</a>
					<a href="#" class="header_a">캐시(결제) 관련</a>
					<a href="../helpboardc/helpboardNotifyForm.do" class="header_a">신고/1:1 문의</a>
				</div>
				
				<div class="m_body">
					<div class="subm">
						<p><a href="../helpboardc/helpboardListAll.do?sort1=game&sort2=installnaccess">설치 /접속 오류</a></p>
						<p><a href="../helpboardc/helpboardListAll.do?sort1=game&sort2=home_error">홈페이지 오류</a></p>
					</div>
					<div class="subm">
						<p><a href="../helpboardc/helpboardListAll.do?sort1=id&sort2=innout">회원가입 / 탈퇴</a></p>
						<p><a href="../helpboardc/helpboardListAll.do?sort1=id&sort2=search_idnpwd">아이디/비밀번호 찾기</a></p>
					</div>
					<div class="subm">
						<p><a href="../helpboardc/helpboardListAll.do?sort1=cash&sort2=charge">캐시 충전</a></p>
						<p><a href="../helpboardc/helpboardListAll.do?sort1=cash&sort2=refund">환불</a></p>
						<p><a href="../helpboardc/helpboardListAll.do?sort1=cash&sort2=item_buyngift">캐시아이템 구매/선물</a></p>
					</div>
				</div>

			</div>
			
			
		</div>
		
		<div style="height: 50px;"></div>
		<!-- <hr> -->
		<br>
		<div id="helpContent">
		
			<c:if test="${display2 == null }">
				<jsp:include page="helpBody.jsp" />
			</c:if>
			<c:if test="${display2 != null }">
				<jsp:include page="${display2 }" />
			</c:if>
			
			<!-- 신고하기 글 등록 -->
			<c:if test="${su == 1 }">
				<script type="text/javascript">
					alert("신고글이 등록되었습니다");
					location.href = "../helpboardc/helpboardNotifyForm.do";
				</script>
			</c:if>
			
		</div>
	</div>
</body>
</html>