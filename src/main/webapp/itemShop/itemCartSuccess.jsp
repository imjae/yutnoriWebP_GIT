<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	
/** 장바구니 부분 */

div#cart_result_total {
	font-family: "-윤고딕320";
	margin: 50px auto;
	width: 80%;
	height: 600px;
	border: 5px solid rgba(200,200,200,1);
	border-radius: 3px;
}

div#cart_result_title {
	width: 100%;
	height: 40%;
	border-bottom: 2px dotted gray;
}

div#cart_result_title_label {
	font-size: 2.2em;
	float: left;
	margin-top: 50px;
	margin-left: 30px;
	
}

div#cart_result_title p {
	clear: both; padding-left: 80px;
}

div#cart_result_title_label > label {
	line-height: 60px;
	vertical-align: center;
	color: rgba(80,80,80,1);
}

img#cart_title_img {
	float: left;
	margin-top: 40px;
	margin-left: 80px;
	margin-right: 40px;
	width: 150px;
	height: 150px;
}


div#cart_result_total button {
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
    margin-top: 50px;
}

</style>
</head>
<body>
	
	<div id="cart_result_total">

		<div id="cart_result_title">
			<img id="cart_title_img" src="../etc/image/itemImage/shoppingCartLogo.png">
			
			<div id="cart_result_title_label">
				<label>장바구니 담기가 <br> 정상적으로 완료되었습니다.</label>
			</div>
			
			<p>담으신 아이템은 장바구니에서 확인하실 수 있습니다.</p>
		</div>
	
			<button id="go_shoppingCart" onclick="location.href='../itemShop/itemShoppingCart.do'">장바구니 가기</button>
			<button id="go_shop" onclick="location.href='../itemShop/mainShop.do?category=all&pg=1&order=logtime'">계속 쇼핑하기</button>
	</div>
	
</body>
</html>