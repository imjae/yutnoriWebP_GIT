<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<style type="text/css">

div#user_info_total {
	width: 100%;
	height: 100%;
	font-family: "-윤고딕320";
}

div#user_info_total > div#title {
	margin: 0 auto;
	margin-top: 100px;
	width: 87%;
	height: 100px;
	border-bottom: 1px solid gray;
}

label#user_info_title{
	margin-left: 2%;
	font-size: 2.1em;
	line-height: 110px;
	
}

div#char_info_div {
	margin: 0 auto;
	width: 85%;
	height: 400px;
	/* border-top: 1px solid gray; */
	padding-top: 5px;
	border-bottom: 1px solid gray;
	/* border: 1.5px solid lightgray; */
}

div#char_img_div {
	width:37%;
	height: 90%;
	/* border: 1px solid black; */
	float: left;
	
	background-color:pink;
}

div#item_list_div {
	width: 58%;
	height: 90%;
	/*  border: 1px solid black;  */
	float: right;
	margin-left: 10px;
}

div.item_list_element_1, div.item_list_element_2{
	width: 17%;
	height: 23%;
	border: 1px solid lightgray;;
	border-radius: 5px;
	float: left;
	margin-right: 7px;
	margin-bottom: 8px;
}

div#item_list_nextBtn {
	width: 25px;
	height: 90%;
	background-color: lightgray;
	color: black;
	float: right;
	border-radius: 4px;
	font-weight: bold;
	text-align: center;
	line-height: 360px

}
div#item_list_nextBtn:hover {cursor: pointer;}
img.item_list_img {
	width: 95%;
	height: 100%;
}

img#char_img {
	width: 100%;
	height: 100%; 
}

div#item_category_total {
	margin: 0 auto;
	width:85%;
	height:37px;
	/* border: 1px solid green; */
	margin-top: 100px;
}



div#item_category_total div {
	width: 95px;
	height: 95%;
	float: left;
	border-left: 0px;
	border-top: 1.5px solid black;
	border-right: 1.5px solid black; 
	border-bottom: 1.5px solid black;
	text-align: center;
	line-height: 40px;
	border-radius: 3px;
	background: lightgray;
}
div#item_category_total div:first-child {
	width: 95px;
	height: 95%;
	float: left;
	border-left: 1.5px solid black;
	border-top: 1.5px solid black;
	border-right: 1.5px solid black; 
	border-bottom: 0px;
	text-align: center;
	line-height: 40px;
	border-radius: 3px;
	background-color: white;
}
div#category_total {
	margin-left: 38.8%;
}
</style>

<script type="text/javascript">

	$(function(){
		
		var pg = 1;
		
		$("div#category_total").click(function(){
			
			$(this).css("background-color", "white");
			
			location.href="../user/have_itemList.do?category=total&pg="+pg;
			
		});
		
		$("div#item_list_nextBtn").click(function(){
			pg = 2;
			$("div.item_list_element_2").show("slide",{direction:"right"},500);
		});
	});

</script>

</head>
<body>

<div id="user_info_total">

	<div id="title">
		<label id="user_info_title">
			캐릭터 정보
		</label>
	
	</div>
	
	<div id="item_category_total">
		<div id="category_total">
		전 체
		</div>
		<div id="category_charactor">
		캐 릭 터
		</div>
		<div id="category_background">
		배 경
		</div>
		<div id="category_etc">
		기 타
		</div>
	</div>
	
	<div id="char_info_div"> 
		<div id="char_img_div">
			<img id="char_img" src="../etc/image/itemImage/characterImage/jk_.png"/>
		</div>
		
		<div id="item_list_nextBtn"> &gt;
		</div>
		
		<div id="item_list_div">
			
			<c:forEach items="${list }" var="list">
				<div class="item_list_element_1">
				<img class="item_list_img" src="../etc/image/itemImage/characterImage/${list.item_img }.png"/>		
				</div>
			</c:forEach>
			<%-- <c:forEach var="i" begin="1" end="20" step="1">
				<div class="item_list_element_2" style="display: none;"> 
				<img class="item_list_img" src="../etc/image/itemImage/characterImage/jk.png"/>		
				</div>
			</c:forEach> --%>
			
		</div>
	</div>
</div>

</body>
</html>