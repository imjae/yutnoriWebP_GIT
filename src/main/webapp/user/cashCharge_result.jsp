<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

div#cash_result_total {
	font-family: "-윤고딕320";
	margin: 50px auto;
	width: 80%;
	height: 600px;
	border: 5px solid rgba(200,200,200,1);
	border-radius: 3px;
}

div#cash_result_title {
	width: 100%;
	height: 40%;
	border-bottom: 2px dotted gray;
}

div#cash_result_title_label {
	font-size: 2.2em;
	float: left;
	margin-top: 50px;
	
}

div#cash_result_title_label > label {
	line-height: 60px;
	vertical-align: center;
	color: rgba(80,80,80,1);
}

img#cash_title_img {
	float: left;
	margin-top: 40px;
	margin-left: 110px;
	margin-right: 40px;
	width: 150px;
	height: 150px;
}

div#cash_result_con {
	width: 100%;
	height: 59%;
	color: rgba(80,80,80,1);
	
}
div#cash_result_con > div#left {
	width: 190px;
	height: 130px;
	
	margin-left: 330px;
	margin-top: 80px;
	float: left;
}
div#cash_result_con > div#right {
	width: 300px;
	height: 130px;
	float: left;
	margin-top: 80px;
}

div#go_index_btn{
	clear: both;
	width: 130px;
	height: 50px;
	margin: 40px auto;
	background-color: #cacaca;
	border-radius: 25px;
	line-height: 50px;
	font-size: 1.5em;
	color: white;
	text-align: center;
	float: left;
	margin-left: 330px;
}

div#go_itemShop_btn{
	width: 130px;
	height: 50px;
	margin: 40px auto;
	background-color: #cacaca;
	border-radius: 25px;
	line-height: 50px;
	font-size: 1.5em;
	color: white;
	text-align: center;
	float: left;
	margin-left: 30px;
}

div#go_index_btn:hover,div#go_itemShop_btn:hover {
	cursor: pointer;
}
</style>

</head>
<body>

<div id="cash_result_total">
	
	<div id="cash_result_title">
		<img id="cash_title_img" src="../etc/image/mainImage/chargeBack.png">
	
		<div id="cash_result_title_label">
		<label>캐시 충전이<br> 정상적으로 이루어졌습니다.</label>
		</div>
	
	</div>
	
	<div id="cash_result_con">
		<div id="left">
		
		
		<p>&#x2714; 충전 수단<p>
		<p>&#x2714; 충전 금액<p>
		<p>&#x2714; 충전후 캐쉬<p>
		
		
		</div>
		
		
		<div id="right">
			
			<p> 무통장 입금 </p>
			<p> 10000 원 </p>
			<p> 20000 원 </p>
			
		</div>
		<!-- &#x2714; 충전 수단 -->
	<div id="go_index_btn">처음으로</div>
	<div id="go_itemShop_btn">상점으로</div>
	</div>
	
	
</div>

</body>
</html>