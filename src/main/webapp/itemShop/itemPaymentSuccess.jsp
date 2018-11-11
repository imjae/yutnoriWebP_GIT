<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">

div#payment_result_total {
	font-family: "-윤고딕320";
	margin: 50px auto;
	width: 80%;
	height: 600px;
	border: 5px solid rgba(200,200,200,1);
	border-radius: 3px;
}

div#payment_result_title {
	width: 100%;
	height: 40%;
	border-bottom: 2px dotted gray;
}

div#payment_result_title_label {
	font-size: 2.2em;
	float: left;
	margin-top: 50px;
	
}

div#payment_result_title p {
	clear: both; padding-left: 100px;
}

div#payment_result_title_label > label {
	line-height: 60px;
	vertical-align: center;
	color: rgba(80,80,80,1);
}

img#payment_title_img {
	float: left;
	margin-top: 40px;
	margin-left: 50px;
	margin-right: 40px;
	width: 150px;
	height: 150px;
}

div#payment_result_con {
	width: 100%;
	height: 59%;
	color: rgba(80,80,80,1);
	
}
div#payment_result_con > div#left {
	width: 190px;
	height: 130px;
	
	margin-left: 180px;
	margin-top: 80px;
	float: left;
}
div#payment_result_con > div#right {
	width: 300px;
	height: 130px;
	float: left;
	margin-top: 80px;
}
</style>
</head>
<body>
<div id="paymentSuc"></div>
<c:if test="${suc == 0 || insertCount == 0}">
	<h1 id="paymentTitle">아이템 결제에 실패하였습니다.</h1>
	<h3>이용에 불편을 드려 대단히 죄송합니다.</h3>
	<h3>잠시 후에 다시 한번 이용해 주시기 바랍니다.</h3>
	<h3>동일한 문제가 지속적으로 발생할 경우, 고객센터로 문의해주시기 바랍니다.</h3>
	<h3>감사합니다.</h3>
	<button id="paymentFail" onclick="location.href='../itemShop/mainShop.do?category=all&pg=1&order=logtime'">상점으로</button>
</c:if>


<c:if test="${suc == 1 && insertCount == 1}">

<div id="payment_result_total">
	
	<div id="payment_result_title">
		<img id="payment_title_img" src="../etc/image/itemImage/paymentLogo.png">
	
		<div id="payment_result_title_label">
		<label>아이템 결제가 <br> 정상적으로 완료되었습니다.</label>
		</div>
		<p>구매하신 아이템은 마이페이지->캐릭터정보에서 확인하실 수 있습니다.</p>
	</div>
	
	<div id="payment_result_con">
		<div id="left">
		
		
		<p>&#x2714; 결제 전 금액<p>
		<p>&#x2714; 결제 금액<p>
		<p>&#x2714; 결제 후 금액<p>
		
		
		</div>
		
		
		<div id="right">
			
			<p> ${user_cash } 원</p>
			<p> ${item_charge } 원</p>
			<p> ${session_dto.user_cash } 원</p>
			
		</div>
		<!-- &#x2714; 충전 수단 -->
	<button id="go_charInfo" onclick="location.href='../main/myPage.do?dis=../user/charInfo_page.jsp'">장착하러 가기</button>
	<button id="go_shop" onclick="location.href='../itemShop/mainShop.do?category=all&pg=1&order=logtime'">계속 쇼핑하기</button>
	
	</div>
	
	
</div>

</c:if>

</body>
</html>