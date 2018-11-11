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
table#shoppingCartList {
	margin-left: 40px;
	font-family: "-윤고딕320";
	font-size: 1.5em;
	border-collapse: collapse;
	/* border: 1px solid red; */
	border-bottom: 5px solid #2b769e;
}
table#shoppingCartList tr#title{
	background: #2b769e;
	height: 50px;
	text-align: center;
}
table#shoppingCartList tr#title td {background: none; color: white;  }
table#shoppingCartList tr#content {border-bottom: 1px solid lightgray; font-size: 1.1em; }

div#buttonLine button {
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
div#total_charge {
	padding-top: 20px;
	text-align: right;
	margin-right: 120px;
}
div#total_charge label {
	font-size: 40px;
	color: orange;

}

</style>
<script type="text/javascript">
	$(function(){

		var charge = 0;
		
		$("button#go_buy").click(function(){
			if($("input[type=checkbox]#warning_check").is(":checked")){
				
				if((${session_dto.user_cash} - Number(charge)) < 0 ){
					// 캐시충전페이지로 이동하기
					location.href="../main/myPage.do?dis=../user/cashCharge_page.jsp";
				}else{
					alert("저기냐");
				 	// 결제화면으로 이동하기
					//location.href="../itemShop/itemPaymentSuccess.do?item_code=${itemShopDTO.item_code}&item_charge=${itemShopDTO.item_charge*ea}";
				}
			}else{
				$("div#warning").css("color","red");
				$("div#warning").effect("shake");
				return false;
			}
		});
		
		
		
		$("input[type=checkbox].check").click(function(){
			if($(this).is(":checked")){
				charge = String(Number(charge)+Number($(this).attr("value")));
				$("label#charge").html(charge);
			}else{
				charge = String(Number(charge)-Number($(this).attr("value")));
				$("label#charge").html(charge);
			}
		});
		
		
	});


</script>
</head>
<body>
<table id="shoppingCartList">
	<tr id="title">
		<th width="150" height="70"></th>
		<th width="100"></th>
		<th width="380">아이템명</th>
		<th width="150">개수</th>
		<th width="300">금액</th>
	</tr>
<c:forEach var="itemShopDTO" items="${list }">
	<tr id="content">
		<td><input type="checkbox" class="check" id="${itemShopDTO.item_code }" value="${itemShopDTO.item_charge }"></td>
		<td><img src="../etc/image/itemImage/characterImage/${itemShopDTO.item_img }.png" width="130px" height="145px"></td> 
		<td>${itemShopDTO.item_name }</td>
		<td>1개</td>
		<td>${itemShopDTO.item_charge }캐시</td>
	</tr>
</c:forEach>
</table>
<div id="total_charge">
	<label id="charge">0</label><label>원</label>
</div>
<div id="warning">
	<label>&there4; 결제가 진행된 이후에는 환불이 불가능합니다.</label><br>
	<label><input type="checkbox" id="warning_check">위의 내용과 결제금액을 확인하였으며, 이에 동의합니다.</label>
</div> 
<div id="buttonLine">
	<div style="width: 250px;"></div>
	<div><button id="refill" onclick="location.href='../main/myPage.do?dis=../user/cashCharge_page.jsp'">캐시 충전하기</button></div>
	<div><button id="go_shop" onclick="location.href='../itemShop/mainShop.do?category=all&pg=1&order=logtime'">계속 쇼핑하기</button></div>
	<div><button id="go_buy">결제하기</button></div>
</div>

</body>
</html>