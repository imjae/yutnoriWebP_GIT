<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

div#sub_menu_total {
	width: 100%;
	height: 100%;
	background-repeat: repeat;
	background-image: url("../etc/image/mainImage/sub_menu.png");
	font-family: "-윤고딕310";
	color: gray;
}



div#sub_menu_total div {
	padding-top: 100px;
	position: relative;
	margin-top: 5px;
	width: 10%;
	height: 66%;
	color: white;
	font-size: 0.6em;
	float: left;
	/* border-left: 1px solid white;  */
}

#sub_news {
 	margin-left: 12%; 

}

div div a.sub_menu_a {
	display: block;
	line-height: 40px;
	height: 20%;
	margin: 0 0;
}
a.sub_menu_a:link { text-decoration: none; color: white; }
a.sub_menu_a:visited { text-decoration: none; color: white; }
a.sub_menu_a:hover { text-decoration: none; color: white; }


</style>

</head>
<body>

	<div id="sub_menu_total">
		<div id="sub_news">
			
			<a href="#" class="sub_menu_a">공지사항</a>
			<a href="#" class="sub_menu_a">이벤트</a>
			<a href="#" class="sub_menu_a">패치노트</a>
			
			
		</div>

		<div id="sub_game_info">
			<a href="../info/info_mean.do" class="sub_menu_a">게임규칙</a>
			<a href="../info/info_controll.do" class="sub_menu_a">조작법</a>
			<a href="../info/info_screenset.do" class="sub_menu_a">화면구성</a>
			<a href="../info/info_download.do" class="sub_menu_a">자료실</a>
		</div>

		<div id="sub_ranking">
			<a href="../rank/yutnoriiiRankList.do?pg=1" class="sub_menu_a">전적랭킹</a>
			<a href="../rank/MoneyRankList.do?pg=1" class="sub_menu_a">골드 보유랭킹</a>
		</div>

		<div id="sub_comunity">
			<a href="../freeboard/freeboard_list.do?freeboard_pg=1" class="sub_menu_a">자유게시판</a>
			<a href="../imgboard/imgboard_list.do?imgboard_pg=1" class="sub_menu_a">스크린샷</a>
		</div>

		<div id="sub_itemshoa">
			
		</div>

		<div id="sub_cs">
			<a href="../helpboardc/mytestForm.do" class="sub_menu_a">FAQ</a>
			<a href="../helpboardc/helpboardNotifyForm.do" class="sub_menu_a">1:1 문의 / 신고 </a>
		</div>

	</div>

</body>
</html>