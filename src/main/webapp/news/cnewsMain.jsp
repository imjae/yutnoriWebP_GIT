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
	
	div#section_top_left_center {
		width: 80%;
		height: 100%;
		float: left;
	}
	
	div#section_left {
		width:20%;
		height:100%;
		float: left;
		/* border: 1px solid black; */
	}
	
	div#section_center {
		width: 850px;
		height:100%;
		float: left;
		padding-right: 45px;
		/* border: 1px solid black; */
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
	

</style>

</head>
<body>

<div id="section_total">
	
	<div id="section_top_left_center">
		<h1 id="section_top" style="margin: 30px">공지사항</h1>
		
		<div id="section_left_center">
			<c:if test="${newsView != null }">
				<jsp:include page="${newsView }"></jsp:include>
			</c:if>
			
			<c:if test="${newsView == null }">
				<div id="section_left">
				
				<div id="inform_nav">
					<a href="../news/newsMainAll.do?pg=1" class="${newsdto.sort == null ? 'navClass' : 'inav' }">전체</a>
					<a href="../news/newsMainSortInform.do?pg=1&sort=inform" class="${newsdto.sort == 'inform' ? 'navClass' : 'inav' }">공지</a>
					<a href="../news/newsMainSortInform.do?pg=1&sort=patch" class="${newsdto.sort == 'patch' ? 'navClass' : 'inav' }">점검</a>
					<a href="../news/newsMainSortInform.do?pg=1&sort=shop" class="${newsdto.sort == 'shop' ? 'navClass' : 'inav' }">샵</a>
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
			</c:if>
			
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
		<a href="#"  class="my_sub_menu">&nbsp;&nbsp;&CenterDot;  이벤트</a>
		</div>
	</div>
</div>

</body>
</html>