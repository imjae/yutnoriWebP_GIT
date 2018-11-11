<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="../etc/css/shopTheme.css" type="text/css">
<style type="text/css">
div#content {height: 600px; background: none; padding-top: 50px;}

#menu_space div#menu_img {width: 350px; float: left;  /*  border: 1px solid black; */ }
#menu_space div#menu_name {width:600px; float: left; /* border: 1px solid red; */ }

#menu_name td span {
	/** #menu_name h4 span */
	color: orange; font-size: 28px;
    font-family: "-윤고딕330";  
}

#menu_name  td {
 	/** #menu_name > h4 */
	margin-top: -3px;
	color: white;
	opacity : 0.9;
    filter: alpha(opacity=90);
    -moz-opacity:0.9;
    -khtml-opacity: 0.9;  
    font-family: "-윤고딕310";             
}
/* div#menu_space_top a{
	font-size: 1.2em;
	color: white;
} */
div#menu_name td input {
	/** div#menu_button button */
	width:100px;
    background-color: #f8585b;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    border-radius:5px;
    /* cursor: pointer; */
}
</style>
<script type="text/javascript">
	function confLogin(uri){
		if(${session_id == null}){	// 로그인 안한 상태로 결제하기 눌렀을 때
			alert("로그인 후 이용해주세요.");
			location.href="../login/loginPage.jsp";
		}else{	// 로그인 상태일때
			location.href=uri;
		}
	}
	
</script>
</head>
<body>


<div id="shop_bg">

<div id="top_info">
</div>

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
		<div id="basket"><a onclick="confLogin('../itemShop/itemShoppingCart.do')">장바구니</a></div>
		<div id="buyList"><a onclick="confLogin('../main/myPage.do?dis=../user/paymentHistory.do')">구매내역</a></div>
		<div id="blank"></div>
	</div>
	<div id="blank"></div>
	<div id="menu_img">
		<img src="../etc/image/itemImage/characterImage/${itemShopDTO.item_img }.png" width="230" height="230">
	</div>
	<div id="menu_name">
		<table>
			<tr height="20px"></tr>
			<tr height="40px">
				<td>상품명 : </td>
				<td colspan="2"><span>${itemShopDTO.item_name }</span></td>
			</tr>
			<tr height="30px">
				<td>수량 :</td>
				<td colspan="2"><strong><font size="4">1개</font></strong></td>
			</tr>
			<tr height="40px">
				<td>상품가격 :</td>
				<td colspan="2">
					<span style="color: #ffc77f;">${itemShopDTO.item_charge }</span>
					<font size="5" color="#ffc77f">캐시</font>
				</td>
			</tr>
			<tr height="10px"></tr>
			<tr height="50px">
				<td></td>
				<td colspan="2" width="500px"  align="center">
					<input type="button" value="목록" onclick="location.href='../itemShop/mainShop.do?category=${category}&pg=${pg }&order=${order }'">
					<input type="button" value="장바구니" onclick="confLogin('../itemShop/itemCart.do?item_code=${itemShopDTO.item_code}')">
					<input type="button" value="결제하기" onclick="confLogin('../itemShop/itemPayment.do?item_code=${itemShopDTO.item_code}&ea=1')">
				</td>
			</tr>
		</table>
	</div>
	
</div>

<div id="body">

	<div id="content" align="center">
		<img src="../etc/image/itemImage/characterImage/${itemShopDTO.item_content }.png" width="1000" height="450">
	</div>
</div>

</div>
<div id="footer">
	<jsp:include page="../template/bottom.jsp"/>
</div>

</body>
</html>