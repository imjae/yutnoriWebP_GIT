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
		height: 1000px;
		/* border-top: 3px dashed rgba(0,0,0,0.6);  */
		background-color: rgba(255,255,255,0.5);
		font-family: "-윤고딕320";
		font-size:14px; 
		color:#676767; 
		line-height:1; 
		letter-spacing:-1px; 
		-webkit-text-size-adjust: none;
	
		
		
	}
	
	div#section_left {
		width:75%;
		float: left;
		min-height: 1000px;
	}
	
	div#section_right{
		width: 24.9%;
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
	
	div.commInfo_sub_menu {
		margin: 0 auto;
		width: 80%;
		height: 70px;
		line-height: 80px;
		border-bottom: 1px solid lightgray;
		
	}
	
	div.commInfo_sub_menu a {
		font-size: 1.3em;
		color: gray;
		
	}
	
	
a.my_sub_menu:link { text-decoration: none; }

a.my_sub_menu:hover { text-decoration: none;  }
	

</style>

</head>
<body>

<div id="section_total">


	<div id="section_left">
		<jsp:include page="${imgboard_page_url}"/>
	
	</div>

	
	
	<div id="section_right">
		<div id="section_title">
		<p>&nbsp;&nbsp;커뮤니티</p>
		</div>
		
		<div id="section_char_info" class="commInfo_sub_menu">
		<a href="../freeboard/freeboard_list.do?freeboard_pg=1" class="my_sub_menu">&nbsp;&nbsp;&CenterDot; 자유 게시판</a>
		</div>
		
		<div id="section_comm_item" class="commInfo_sub_menu">
		<a href="../imgboard/imgboard_list.do?imgboard_pg=1"  class="my_sub_menu">&nbsp;&nbsp;&CenterDot; 스크린샷 게시판</a>
		</div>
		
		
	</div>
	
	

</div>

</body>
</html>