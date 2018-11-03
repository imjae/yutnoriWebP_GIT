<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#title_menu_total {
	width: 100%;
	height: 100%;
	background-image: url("../etc/image/mainImage/title_menu.png");
	font-family: "-윤고딕320";
	/* border-bottom: 1px solid white; */
}

#title_logo {
	width : 250px;
	height: 91px;
}

div#title_logo img {
	position: relative;
	left: 10px;
	padding: 3px;
}

div#title_menu_total div {
	
	width: 100px;
	height: 90%;
	color: white;
	font-size: 0.8em;
	line-height: 125px;
	
	
	margin-left: 80px;
	margin-right: 22px;
	float: left;
/* 	 border-left: 1px solid white; 
	border-right: 1px solid white;  
	 border-bottom: 1px solid white;  */
}

div#title_menu_total div:last-child:after {
	clear: both;
}

a.over_mouse_title:link { text-decoration: none; color: white; }
a.over_mouse_title:visited { text-decoration: none; color: white; }
a.over_mouse_title:hover { text-decoration: none; color: white; }

</style>

</head>

<script type="text/javascript">

	$(function(){
		$("a#a_logo").click(function(){
			location.href="../main/index.jsp";
		});
	});

</script>

<body>

	<div id="title_menu_total">
		<div id="title_logo">
			<a href="#" class="over_mouse_title" id="a_logo"><img src="../etc/image/mainImage/logo.png"></a>
		</div>
		
		<div id="title_news">
			<a href="#" class="over_mouse_title">새소식</a>
		</div>
		
		<div id="title_game_info">
			<a href="#" class="over_mouse_title">게임정보</a>
		</div>
	
		<div id="title_ranking">
			<a href="#" class="over_mouse_title">랭킹</a>
		</div>

		<div id="title_comunity">
			<a href="#" class="over_mouse_title">커뮤니티</a>
		</div>

		<div id="title_itemshop">
			<a href="#" class="over_mouse_title">상점</a>
		</div>

		<div id="title_cs">
			<a href="../main/index.jsp?display=../helpboardc/myTestttt.jsp" class="over_mouse_title">고객지원</a>
		</div>

	</div>
</body>
</html>