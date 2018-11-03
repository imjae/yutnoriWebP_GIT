<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
div#step01_total {
	padding: 0px 40px;
	font-family: "-윤고딕320";
}

div#top_title1 {
	width: 100%;
	height: 120px;
	border-bottom: 2px solid lightgray;
	padding-left: 30px;
}

div#top_title1 div.top_title1 {
	font-size: 2.4em;
	float: left;
	line-height: 120px;
}

div#top_title1 div.top_title2 {
	font-size: 0.95em;
	float: left;
	line-height: 140px;
	color: gray;
}

div#top_title2 {
	border-bottom: 0.7px solid lightgray;
	clear: both;
	font-size: 1.6em;
	left: 0;
	line-height: 60px;
	height: 80px;
}

div#all_agree, div#agree_1, div#agree_2 {
	font-size: 1em;
	font-weight: 500;
	padding: 10px;
	color: gray;
}

div#agree_1_check, div#agree_2_check {
	width: 747px;
	height: 30px;
	line-height: 30px;
	border-top: 1px solid lightgray;
	border-left: 1px solid lightgray;
	border-right: 1px solid lightgray;
	background: #eeeeee;
}

div#agree_1_textArea, div#agree_2_textArea {
	width: 90%;
	height: 300px;
	margin-top: 1px;
}

textarea#agree_1_ta, textarea#agree_2_ta {
	resize: none; /* 사용자 임의 변경 불가 */
	/* resize: both; /* 사용자 변경이 모두 가능 */
	resize: horizontal; /* 좌우만 가능 */ */
	resize: vertical; /* 상하만 가능 */
	border: 1px solid lightgray;
	color: gray;
}

div#agree_2 {
	margin-top: -150px;
}

div#signUp_btn {
	width: 100%;
	height: 100px;
	margin-top: -120px;
	position: relative;
	text-align: center;
}

div#align_div {
	display: inline-block;
}

div#signUp_btn div#okBtn, div#signUp_btn div#cancelBtn {
	display: inline-block;
	margin: 0 auto;
	width: 125px;
	height: 40px;
	border: 1px solid #dadada;
	float: left;
	margin: 10px;
	border-radius: 5px;
	background-color: #dadada;
	color: #5f5f5f;
	line-height: 40px;
	font: "-윤고딕330";
	font-size: 1.2em;
}
</style>

<script type="text/javascript">
	$(function() {

		$.ajax({
			url : "../etc/txt/agree_1.txt",
			type : "post",
			dataType : "text",
			timeout : 30000,
			cache : false,
			success : function(data) {

				$("textarea#agree_1_ta").html(data);
			},
			error : function(xhr, textStatus, errorThrown) {
				$("div#result").html(
						"<div>" + textStatus + " (HTTP-" + xhr.status + " / "
								+ errorThrown + ")</div>");
			}
		});
		
		$.ajax({
			url : "../etc/txt/agree_2.txt",
			type : "post",
			dataType : "text",
			timeout : 30000,
			cache : false,
			success : function(data) {

				$("textarea#agree_2_ta").html(data);
			},
			error : function(xhr, textStatus, errorThrown) {
				$("div#result").html(
						"<div>" + textStatus + " (HTTP-" + xhr.status + " / "
								+ errorThrown + ")</div>");
			}
		});

		var agree_count = 0;

		$("div#all_agree input[type=checkbox]#aa").click(function() {

			var ischecked = $(this).is(":checked");

			if (ischecked) {
				$("input[type=checkbox]#bb").attr("checked", true);
				$("input[type=checkbox]#cc").attr("checked", true);
			} else {
				$("input[type=checkbox]#bb").attr("checked", false);
				$("input[type=checkbox]#cc").attr("checked", false);
			}

		});
		
		$("input[type=checkbox]").click(function(){
			var check1= $("input[type=checkbox]#bb").is(":checked");
			var check2= $("input[type=checkbox]#cc").is(":checked");
			
			if(check1==true && check2==true){
				$("div#all_agree input[type=checkbox]").attr("checked", true);
			}else {
				$("div#all_agree input[type=checkbox]").attr("checked", false);
			}
			
		});

		$("div#okBtn").click(function() {

			if ($("input[type=checkbox]#bb").is(":checked")) {
				agree_count++;
			} else {

				agree_count--;
			}
			if ($("input[type=checkbox]#cc").is(":checked")) {
				agree_count++;
			} else {
				agree_count--;
			}

			if (agree_count < 2) {
				$("p#next_check").css("color", "red");
				$("p#next_check").html(" X 약관에 동의해 주세요.");
				$("p#next_check").effect("shake");
				return false;
			} else {

				location.href = "../user/signUp.jsp?step=signUp_step02";

				// 다음 페이지로.
			}
		});

		$("div#cancelBtn").click(function() {
			location.href = '../main/index.jsp';
		});
	});
</script>

</head>
<body>
	<div id="step01_total">
		<div id="top_title1">
			<div class="top_title1">약관동의</div>
			<div class="top_title2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;하단의 약관
				내용을 확인하시고 동의여부를 결정해주십시오.</div>
		</div>

		<div id="top_title2">&nbsp;&nbsp;&nbsp;회원가입을 환영합니다!!</div>
		<div id="all_agree">
			<input type="checkbox" id="aa" name="all_agree"> <label
				for="aa"> 서비스 이용약관, 개인정보 수집 및이용, 유효기간 1년에 <strong>모두
					동의</strong> 합니다.
			</label>
		</div>
		<div id="agree_1">
			<div id="agree_1_check">
				&nbsp;<input type="checkbox" id="bb" name="agree_1"> <label
					for="bb"> 서비스 이용약관 동의 <strong>(필수)</strong></label>
			</div>
			<div id="agree_1_textArea">
				<textarea id="agree_1_ta" rows="9" cols="91">

				</textarea>
			</div>
		</div>

		<div id="agree_2">
			<div id="agree_2_check">
				&nbsp;<input type="checkbox" id="cc" name="agree_2"> <label
					for="cc"> 개인정보 수집 및 이용 동의 <strong>(필수)</strong></label>
			</div>
			<div id="agree_2_textArea">
				<textarea id="agree_2_ta" rows="9" cols="91">

				</textarea>
			</div>
		</div>

		<div id="signUp_btn">
			<div id="align_div">
				<p id="next_check"></p>
				<div id="okBtn">확 인</div>


				<div id="cancelBtn">취 소</div>
			</div>
		</div>
	</div>
</body>
</html>