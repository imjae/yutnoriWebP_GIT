<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../etc/css/cnewsCenter.css" />

<style type="text/css">

	div#section_total {
		width : 1400px;
		height : 1000px;/* 
		border : 1px solid black; */
		/* border-top: 3px dashed rgba(0,0,0,0.6);  */
		background-color: rgba(255,255,255,0.5);
		font-family: "-윤고딕320";
		
		
	}
	
	div#section_left {
		width:15%;
		height:100%;
		float: left;
		border: 1px solid black;
	}
	
	div#section_center {
		width: 60%;
		height:90%;
		float: left;
		margin: 100px 28px;
		/* border: 1px solid black; */
	}
	
	div#section_right{
		width: 20.85%;
		height:100%;
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
		<div style="height: 100px;border: 1px solid black;line-height: 60px;">
			<h1>공지사항</h1>
		</div>
		<div style="width: 100%;">
			<a href="#">전체</a>
			<a href="#">공지</a>
			<a href="#">점검</a>
			<a href="#">샵</a>
		</div>
	</div>
	
	<div id="section_center">
		<c:if test="${display2 != null }">
			<jsp:include page="${display2 }" />
		</c:if>
		
		<c:if test="${display2 == null }">
			<jsp:include page="cnewsCenter.jsp" />
		</c:if>
		
	</div>
	
	
	<div id="section_right">
		<br><br><br>
		<div id="section_title">
		<p>&nbsp;&nbsp;새소식</p>
		</div>
		
		<div id="section_char_info" class="userInfo_sub_menu">
		<a href="#" class="my_sub_menu">&nbsp;&nbsp;&CenterDot; 공지사항</a>
		</div>
		
		<div id="section_user_item" class="userInfo_sub_menu">
		<a href="#"  class="my_sub_menu">&nbsp;&nbsp;&CenterDot;  이벤트</a>
		</div>
	</div>

</div>

</body>
</html>