<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	div#section_total {
		width : 1400px;
		min-height: 1000px;
		/*
		border : 1px solid black; */
		/* border-top: 3px dashed rgba(0,0,0,0.6);  */
		background-color: rgba(255,255,255,0.5);
		font-family: "-윤고딕320";
	
		
		
	}
	
	div#section_left {
		width:75%;
		min-height: 1000px;
		float: left;
	}
	
	div#section_right{
		width: 24.9%;
		min-height: 1300px;
		float: left;
		background-color: rgba(200,200,200,0.4);
	}
	
	div#section_title {
		margin-top: 20px;
	}
	
	div#section_title p {
		font-size: 1.9em;
		color: black;
	}
	
	div#section_title {
		margin: 0 auto;
		width:80%;
		height: 50px;
		border-bottom: 2px solid rgba(30,30,30, 0.4);
	}
	
	div.userInfo_sub_menu {
		margin: 0 auto;
		width: 80%;
		height: 70px;
		line-height: 80px;
		border-bottom: 1px solid lightgray;
	}
	
	div.userInfo_sub_menu a {
		font-size: 1.3em;
		color: gray;
		
	}
	
	
a.my_sub_menu:link { text-decoration: none; }
a.my_sub_menu:visited { text-decoration: none; }
a.my_sub_menu:hover { text-decoration: none;  }
	

</style>

</head>
<body>

<div id="section_total">

	<div id="section_left">
		<%-- <jsp:include page="${userInfo_page_url }"/> --%>
		<%-- <jsp:include page="../user/cashCharge_page.jsp"/> --%>
		<jsp:include page="${infoInfo_page_url }"/>
		<%-- <jsp:include page="cashCharge_page.jsp"/> --%>
	</div>
	
	
	<div id="section_right">
		<div id="section_title">
		<p>&nbsp;&nbsp;게임 정보</p>
		</div>
		
		<div id="section_char_info" class="userInfo_sub_menu">
		<a href="../info/info_mean.do" class="my_sub_menu">&nbsp;&nbsp;&CenterDot;게임규칙</a>
		</div>
		
		<div id="section_user_item" class="userInfo_sub_menu">
		<a href="../info/info_controll.do"  class="my_sub_menu">&nbsp;&nbsp;&CenterDot;조작법</a>
		</div>
		
		<div id="section_cash_chung" class="userInfo_sub_menu">
		<a href="../info/info_screenset.do"  class="my_sub_menu">&nbsp;&nbsp;&CenterDot;화면 구성</a>
		</div>
		
		<div id="section_user_info" class="userInfo_sub_menu">
		<a href="../info/info_download.do"  class="my_sub_menu">&nbsp;&nbsp;&CenterDot;자료실</a>
		</div>
	</div>

</div>

</body>
</html>