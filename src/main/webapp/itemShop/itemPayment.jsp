<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="../etc/css/shopTheme.css" type="text/css">
<style type="text/css">
div#body div#payTitle {
	font-family: "-윤고딕320"; 
	text-align: left;
	border-bottom: 5px solid #044f9a;
	margin-bottom: 50px;
}
div#payBody table {
	font-family: "-윤고딕320";
	border-collapse: collapse;
	/* border: 1px solid red; */
	border-bottom: 5px solid #2b769e;
}
div#payBody tr#title {
	background: #2b769e;
	height: 50px;
	text-align: center;
}
div#payBody tr#title td {background: none; color: white;  }
div#payBody tr#content {border-bottom: 1px solid lightgray; font-size: 1.1em; }
div#payBody tr#haveCash td{background-image: url("../etc/image/itemImage/cashBackground.png"); height: 85px;}
div#payBody tr#haveCash td div {height:85px; float:left; line-height: 85px; text-align: right;}
div#payBody tr#haveCash #myCash{font-size: 1.7em; color:#535353;}
div#payBody tr#haveCash #price{font-size: 1.7em; color: #f8585b;}
div#payBody div#buttonLine {
	width: 1000px;
	/* border: 1px solid orange;  */
    display: inline-block;
	height: 120px; }
div#payBody div#buttonLine div {
	float: left;
	width: 160px;
	padding-top: 20px;
	/* border: 1px solid blue; */
} 
div#payBody button {
	width:140px;
    background-color: #b7b1b6;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    font-size: 15px;
    margin: 4px;
    border-radius:30px;
}
div#payBody div#buttonLine button#go_buy {background-color: #f8585b;}
div#menu_space_ad a {margin-left: 500px; /* border: 1px solid orange; */}
div#payBody div#warning {
	height: 30px;
	margin-top: 30px;
	
}
div#payBody div#warning label{
	font-family: "-윤고딕310";
	/* border: 1px solid orange; */
}

	
	

</style>
<script type="text/javascript">
	$(function(){
		$("button#go_buy").click(function(){
			if($("input[type=checkbox]#warning_check").is(":checked")){
				if(${session_dto.user_cash - (itemShopDTO.item_charge*ea) < 0} ){
					// 캐시충전페이지로 이동하기 
				}else{
					// 결제화면으로 이동하기
					location.href="../itemShop/itemPaymentSuccess.do?item_charge=${itemShopDTO.item_charge*ea}";
				}
			}else{
				$("div#warning").css("color","red");
				$("div#warning").effect("shake");
				return false;
			}
		});
	});
</script>

</head>
<body>


<div id="top_info">
</div>
<div id="shop_bg"> <!-- 배경 -->
	<div id="menu_space">
		<div id="menu_space_top">
			<div id="blank"></div>
			<div id="mainLogo">
				<a href="../main/index.jsp">
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
		<div id="payTitle">
			<h2>　구매하기</h2>
		</div>
		<div id="payBody">
			<c:if test="${payOK == null }">
			<table>
				<tr id="title">
					<td width="200px"></td><td width="250px">상품명</td>
					<td width="200px">가격</td><td width="150px">수량</td><td width="200px">합계</td>
				</tr>
				<tr id="content">
					<td><img src="../storage/${itemShopDTO.item_img }.png" width="150" height="150"></td>
					<td>${itemShopDTO.item_name }</td><td>${itemShopDTO.item_charge } 캐시</td>
					<td>${ea }</td><td>${itemShopDTO.item_charge*ea } 캐시</td>
				</tr>
				<tr id="haveCash">
					<td colspan="5">
						<div style="width: 265px;"></div>
						<div style="width: 125px;">
							<label id="myCash">${session_dto.user_cash }</label>
						</div>
						<div style="width: 280px;"></div>
						<div style="width: 125px;">
							<label id="price">${itemShopDTO.item_charge*ea }</label>
						</div>
						<div style="width: 190px;"></div>
					</td>
				</tr>
			</table>
			<div id="warning">
				<label>&there4; 결제가 진행된 이후에는 환불이 불가능합니다.</label><br>
				<label><input type="checkbox" id="warning_check">위의 내용과 결제금액을 확인하였으며, 이에 동의합니다.</label>
			</div> 
			<div id="buttonLine">
				<div style="width: 250px;"></div>
				<div><button id="refill" onclick="location.href='#'">캐시 충전하기</button></div>
				<div><button id="go_shop" onclick="location.href='../itemShop/mainShop.do?category=all&pg=1&order=logtime'">계속 쇼핑하기</button></div>
				<div><button id="go_buy">결제하기</button></div>
			</div>
			</c:if>
			<c:if test="${payOK != null}">
				<jsp:include page="../itemShop/itemPaymentSuccess.jsp"/>
			</c:if>
		</div>
	</div>
</div>

<div id="footer">
	<jsp:include page="../template/bottom.jsp"/>
</div>
</body>
</html>