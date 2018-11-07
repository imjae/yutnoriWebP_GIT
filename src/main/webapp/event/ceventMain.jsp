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
		height: 1000px;
		/*
		border : 1px solid black; */
		/* border-top: 3px dashed rgba(0,0,0,0.6);  */
		background-color: rgba(255,255,255,0.5);
		font-family: "-윤고딕320";	
	}
	
	div#section_left {
		width:80%;
		height:100%;
		float: left;
		/* border: 1px solid black; */
	}
	
	div#section_left_top {
		border: 1px solid black;
		margin: 0px 30px;
		height: 4%;
	}
	
	div#section_left_center {
		border: 1px solid black;
		margin: 0px 30px;
	}
	
	div#section_right{
		width: 20%;
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
	
	.inav {
		margin-left: 20%;
		margin-right: 20%;
		margin-bottom: 1.5px;
		width: 60%;
		height: 60px;
		line-height: 60px;
		text-align: center;
		display: block;
		/* border: 1px solid black; */
		background-color: rgba(200,200,200,0.4);	
		text-decoration: none;
		color: black;
		font-size: 1.2em;
	}
	
	.navClass {
		margin-left: 20%;
		margin-right: 20%;
		margin-bottom: 1.5px;
		width: 60%;
		height: 60px;
		line-height: 60px;
		text-align: center;
		display: block;
		/* border: 1px solid black; */
		background-color: black;	
		text-decoration: none;
		color: white;
		font-size: 1.2em;
	}
	
a.my_sub_menu:link { text-decoration: none; }
a.my_sub_menu:visited { text-decoration: none; }
a.my_sub_menu:hover { text-decoration: none;  }

#selected {
	color: black;
	font-weight: bold;
}	

</style>

</head>
<body>

<div id="section_total">
	
	<div id="section_left">
		<h1 id="section_top" style="margin: 0 30px; height: 8%; line-height: 80px; border: 1px solid black;">이벤트</h1>
		
		<div id="section_left_top">
			<a href="../event/eventMainOn.do">진행중</a>
			<a href="../event/eventMainOff.do">종료</a>
		</div>
		
		<div id="section_left_center">
			
		</div>
		
	</div>
	
	<div id="section_right">
		
		<div id="section_title">
		<p>&nbsp;&nbsp;새소식</p>
		</div>
		
		<div id="section_char_info" class="userInfo_sub_menu">
		<a href="../news/newsMainAll.do" class="my_sub_menu">&nbsp;&nbsp;&CenterDot; 공지사항</a>
		</div>
		
		<div id="section_user_item" class="userInfo_sub_menu">
		<a href="../event/eventMainOn.do"  class="my_sub_menu" id="selected">&nbsp;&nbsp;&CenterDot;  이벤트</a>
		</div>
	</div>
</div>

</body>
</html>