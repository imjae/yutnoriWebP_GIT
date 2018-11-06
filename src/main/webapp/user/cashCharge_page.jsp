<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

label#cash_charge_title{
	margin-left: 2%;
	font-size: 2em;
	line-height: 110px;
	
}

div.user_info_cont {
	margin: 0 auto;
	width: 87%;
	height: 120px;
	border-bottom: 1px solid lightgray;
	font-size: 1.3em;
	color: gray;
	line-height: 100px;
}

div.user_info_cont > div:first-child {
	/* border: 1px solid green;  */
	height: 100%;
	width: 25%;
	float: left;
	margin-left: 50px;
	text-align: center;
} 

div.user_info_cont > div:last-child {
/* 	border: 1px solid black;   */
	height: 100%;
	width: 60%;
	float: left;
} 

div#cash_con input[type=text]#cash_input {
	border: 2px solid rgba(176,217,255,0.9);
	height: 40px;
	width: 340px;
	background-color: rgba(176,217,255,0.6);
} 

label {
	font-size: 0.6em;
	width: 300px;
	height: 50px;
	display: block;
	margin-top: -60px;
	
}

div#charge_btn {
	width: 150px;
	height: 60px;
	margin: 20px auto;
	background-color: #cacaca;
	border-radius: 5px;
	line-height: 60px;
	font-size: 1.5em;
	color: white;
	text-align: center;
}
div#charge_btn:hover {
	cursor: pointer;
}
div#account_ {
	text-align: center;
	font-size: 2em;
}
</style>

<script type="text/javascript">

	$(function(){
		$("div#charge_btn").click(function(){
			$("form#cashCharge_form").submit();
		});
	});

</script>

</head>
<body>

<div id="user_info_total">

	<div id="title">
		<label id="cash_charge_title">
			캐쉬 충전
		</label>
	
	</div>
	<div id ="account_">
	<br>
	무통장 입금 : 512602-01-305050(국민) 
	<br>
	</div>
	<div class="user_info_cont">
		<div id="cash_title">충전할 금액</div>
		<div id="cash_con">
		<form action="../user/cashCharge.do" id="cashCharge_form">
		<input type="text" id="cash_input" name="cash_input"> 원<br>
		</form>
			<label></label>
		</div>
		
	</div>
	<div id="charge_btn">
	충 전
	</div>
</div>



</body>
</html>