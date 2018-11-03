<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이템샵</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="../etc/css/shopTheme.css" type="text/css">
<style type="text/css">

div#header div {	
	float: left;	
}
div#header {
	display: inline-block;
	text-align: center;
	margin: 0 auto;
	height: 65px;
	/* border: 1px solid blue;  */
}
div#top {height: 130px; width: 1000px;  /* border: 1px solid blue; */}
div#sort {
	width: 870px;
	text-align: right;
	word-spacing: 20px;
}
div#sort a {
	text-decoration: none;
	color: black;
	font-family: "-윤고딕320";
	
}
div#section {
	/* border: 1px solid orange;  */
}
#header div {
	border-bottom: 3px solid lightgray; 
	width: 185px;
	height: 60px;
	margin: 0; padding: 0;	
	background-color: rgba(0, 0, 0, 0.05);
}
#header div a img {
	opacity: 0.5;
}
#header div.selected a img {
	opacity: 1;
}
#header div.selected {
	border-left: 3px solid lightgray; 
	border-right: 3px solid lightgray; 
	border-top: 3px solid lightgray;  
	border-bottom: 0px solid white;
	background: white;
}
div#header a {
	text-decoration: none;
}
div#menu_space_ad a {margin-left: 500px; /* border: 1px solid orange; */}
</style>

</head>
<body>
<div id="top_info">
</div>
<div id="shop_bg">
<div id="menu_space">
	<div id="menu_space_top">
		<div id="blank"></div>
		<div id="mainLogo">
			<a href="#">
				<img src="../etc/image/mainImage/logo.png">
			</a>
		</div>
		<div id="shopLogo">
			<a href="../itemShop/mainShop.do?category=all&pg=1&order=logtime">
				<img src="../etc/image/itemImage/shopLogo.png">
			</a>
		</div>
		<div id="basket"><a href="#">장바구니</a></div>
		<div id="buyList"><a href="#">구매내역</a></div>
		<div id="blank"></div>
	</div>
	<div id="menu_space_ad">
		<a href="../itemShop/mainShop.do?category=all&pg=1&order=logtime"><img src="../etc/image/itemImage/itemAd.png"></a>
	</div>
</div>



<div id="body">

<br><br>

<div id="top">
	<div id="header">
		<div id="all" class="${category=='all'? 'selected':'' }">
			<a href="../itemShop/mainShop.do?category=all&pg=1&order=logtime">
			<img src="../etc/image/전체글씨.png"></a>
		</div>
		<div id="character" class="${category=='character'? 'selected':'' }">
			<a href="../itemShop/mainShop.do?category=character&pg=1&order=logtime">
			<img src="../etc/image/캐릭터.png"></a>
		</div>
		<div id="background" class="${category=='background'? 'selected':'' }">
			<a href="../itemShop/mainShop.do?category=background&pg=1&order=logtime">
			<img src="../etc/image/배경.png"></a>
		</div>
		<div id="potion" class="${category=='potion'? 'selected':'' }">
			<a href="../itemShop/mainShop.do?category=potion&pg=1&order=logtime">
			<img src="../etc/image/물약.png"></a>
		</div>
	</div>
	<div id="sort">
		<a href="../itemShop/mainShop.do?category=${category }&pg=1&order=logtime">신상품순</a>
		<a href="../itemShop/mainShop.do?category=${category }&pg=1&order=item_name">이름순</a>
		<a href="../itemShop/mainShop.do?category=${category }&pg=1&order=item_charge_low">낮은가격순</a>
		<a href="../itemShop/mainShop.do?category=${category }&pg=1&order=item_charge">높은가격순</a>
	</div>
	
</div>


<div id="section">
		<c:if test="${category != null }">
			<c:if test="${pg != null }">
				<jsp:include page="${cateAdd}">
					<jsp:param value="${pg }" name="pg"/>
					<jsp:param value="${category }" name="category"/>
					<jsp:param value="${order }" name="order"/>
				</jsp:include>
			</c:if>
			<%-- <c:if test="${pg == null }">
				<jsp:include page="${cateAdd}">
					<jsp:param value="1" name="pg"/>
					<jsp:param value="${category }" name="category"/>
					<jsp:param value="${order }" name="order"/>
					
				</jsp:include>
			</c:if>		 --%>
		</c:if>
	</div>
</div>

<div id="footer">
	<jsp:include page="../template/bottom.jsp"/>
</div>
</div>
</body>
</html>