<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div#paymentSuc {
	font-family: "-윤고딕310";
}
h1#paymentTitle {
	color: #2b769e;
	font-size: 40px;
	font-family: "-윤고딕320";
	}
</style>
</head>
<body>
<div id="paymentSuc"></div>
<c:if test="${suc == 0}">
	<h1 id="paymentTitle">아이템 결제에 실패하였습니다.</h1>
	<h3>이용에 불편을 드려 대단히 죄송합니다.</h3>
	<h3>잠시 후에 다시 한번 이용해 주시기 바랍니다.</h3>
	<h3>동일한 문제가 지속적으로 발생할 경우, 고객센터로 문의해주시기 바랍니다.</h3>
	<h3>감사합니다.</h3>
	<button id="paymentFail" onclick="location.href='../itemShop/mainShop.do?category=all&pg=1&order=logtime'">상점으로</button>
</c:if>

<c:if test="${suc == 1}">
	<h1 id="paymentTitle">아이템 결제가 완료되었습니다.</h1>
	<h2>구매하신 아이템은 마이페이지->캐릭터정보에서 확인하실 수 있습니다.</h2>
	<button id="go_charInfo" onclick="location.href='#'">마이페이지</button>
	<button id="go_shop" onclick="location.href='../itemShop/mainShop.do?category=all&pg=1&order=logtime'">계속 쇼핑하기</button>
	
</c:if>

</body>
</html>