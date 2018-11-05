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
	border: 1px solid black;
	
}
div#cash_result_con > div#left {
	width: 190px;
	height: 130px;
	border-right: 1px solid green;
	border-top: 1px solid green;
	
	margin-left: 200px;
	margin-top: 100px;
	float: left;
}
div#cash_result_con > div#right {
	width: 300px;
	height: 130px;
	border: 1px solid pink;
	float: left;
	margin-top: 100px;
}

div#cash_result_con > div#right p {
	
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
	</div>
	
</div>

</body>
</html>