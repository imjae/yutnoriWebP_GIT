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
		height : 1000px;/* 
		border : 1px solid black; */
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
		height:100%;
		float: left;
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

a.my_sub_menu:hover { text-decoration: none;  }
	

</style>

</head>
<body>

<div id="section_total">



	<div id="section_left">
		<c:if test="${rank_page_url == null }">
			<p>rank_page_url 가 null 입니다.</p>
		</c:if>
		<c:if test="${rank_page_url != null }">
			<jsp:include page="${rank_page_url }"/>	
		</c:if>
	</div>

	
	
	<div id="section_right">
		<div id="section_title">
		<p>&nbsp;&nbsp;랭킹</p>
		</div>
		
		<div id="section_char_info" class="userInfo_sub_menu">
		<a href="../rank/yutnoriiiRankList.do?pg=1" class="my_sub_menu">&nbsp;&nbsp;&CenterDot;전적랭킹</a>
		</div>
		
		<div id="section_user_item" class="userInfo_sub_menu">
		<a href="../rank/MoneyRankList.do?pg=1"  class="my_sub_menu">&nbsp;&nbsp;&CenterDot;골드보유 랭킹</a>
		</div>
		
		
	</div>
	
	

</div>

</body>
</html>