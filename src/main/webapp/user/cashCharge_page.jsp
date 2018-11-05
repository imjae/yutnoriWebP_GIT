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

div.user_info_cont > div:last-child > input[type=password] {

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

div#modify_btn {
	width: 150px;
	height: 60px;
	margin: -260px auto;
	background-color: #cacaca;
	border-radius: 5px;
	line-height: 60px;
	font-size: 1.5em;
	color: white;
	text-align: center;
}
div#modify_btn:hover {
	cursor: pointer;
}
</style>

<script type="text/javascript">

	$(function(){
		var final_check1 = false;
		var final_check2 = false;
		var final_check3 = false;
		// 비밀번호 일치 확인.
		$("input[type=password]#cur_pw").focusout(function(){
			 $.ajax({
		            async: true,
		            type : 'POST',
		            data : {"pw" : $("input[type=password]#cur_pw").val()},
		            url : "../user/userPwCheck.do",
		            success : function(data) {
		                if (data == 'O') {
		                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
		                    $("label#cur_pw_label").css("color", "green");
		            		$("label#cur_pw_label").html("&nbsp; O 비밀번호가 일치합니다.. ^____^");
		                    
		            		final_check1 = true;
		                	return false;
		                } else {
		        	        $("label#cur_pw_label").css("color", "red");
		        	        $("label#cur_pw_label").html("&nbsp; X 비밀번호가 일치하지않습니다. TT _ TT");
		        	        final_check1 = false;
		        	        return false;
		                }
		            },
		            error : function(error) {
		                
		                alert("error : " + error);
		            }
		        }); 
		});
		
		// 비밀번호 유효성검사
		$("input[type=password]#re_pw1").focusout(function(){
				final_check2 = false;
				var password = $("input[type=password]#re_pw1").val();
				
			 	
			    var checkNumber = password.search(/[0-9]/g);
			    var checkEnglish = password.search(/[a-z]/ig);
			    
			    if(checkNumber <0 || checkEnglish <0){
			    	$("label#re_pw1_label").css("color", "red");
			        $("label#re_pw1_label").html("&nbsp; X 숫자, 영문자 혼용해 다시 작성해주세요.  TT _ TT");
			        final_check2 = false;
			        return false;
			    }
			    if(/(\w)\1\1\1/.test(password)){
			        $("label#re_pw1_label").css("color", "red");
			        $("label#re_pw1_label").html("&nbsp; X 같은 문자를 4번이상 사용하실 수 없습니다.  TT _ TT");
			        final_check2 = false;
			        return false;
			    }
			    
			    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
			        $("label#re_pw1_label").css("color", "red");
		            $("label#re_pw1_label").html("&nbsp; X 숫자+영문자+특수문자 조합으로 8자리 이상 사용해 주세요.  TT _ TT");
		            final_check2 = false;
			        return false;
			    }    
			 	
			    $("label#re_pw1_label").css("color", "green");
	            $("label#re_pw1_label").html("&nbsp; O 유효한 비밀번호 입니다. ^ __ ^");
	            final_check2 = true;
			    return true;
		});
		
		//비밀번호 재확인
		$("input[type=password]#re_pw2").focusout(function(){
			final_check3 = false;
			var password = $("input[type=password]#re_pw1").val();
			
			
			var re_password = $("input[type=password]#re_pw2").val();
			
			if((password != re_password)){
				 $("label#re_pw2_label").css("color", "red");
		         $("label#re_pw2_label").html("&nbsp; X 비밀번호가 일치하지 않습니다.  TT _ TT");
		         
		         final_check3 = false;
		         return false;
			}else {
				$("label#re_pw2_label").css("color", "green");
		        $("label#re_pw2_label").html("&nbsp; O 비밀번호가 일치합니다.  ^ __ ^");
		        final_check3 = true;
		        return true;
			}
			
			return true;
		});
		
		$("div#modify_btn").click(function(){
			if(final_check1 && final_check2 && final_check3){
				alert("수정 성공!");
				$("form#modify_password_form").submit();
			}else{
				alert("수정 실패!");
			}
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
	
	<div class="user_info_cont">
		<div id="name_title">이름</div>
		<div id="name_con">
		${session_dto.user_name }
		</div>
	</div>
	
	
	<div class="user_info_cont">
		<div id="name_title">아이디</div>
		
		<div id="name_con">
		${session_id}
		</div>
	</div>
	
	
	<div class="user_info_cont">
		<div id="name_title">현재 비밀번호</div>
		<div id="name_con">
		<input type="password" id="cur_pw"><br>
			<label id="cur_pw_label"></label>
		</div>
	</div>
	
	<form action="../user/user_modify.do" method="post" id="modify_password_form">
	<div class="user_info_cont">
		<div id="name_title">변경할 비밀번호</div>
		<div id="name_con">
		<input type="password" id="re_pw1" name="re_pw1"><br>
		
			<label id="re_pw1_label"></label>
		</div>
	</div>
	</form>
	
	
	<div class="user_info_cont">
		<div id="name_title">비밀번호 확인</div>
		<div id="name_con">
			<input type="password" id="re_pw2"><br>
			<label id="re_pw2_label"></label>
		</div>
	</div>
	

</div>

<div id="modify_btn">
	 수 정 
</div>

</body>
</html>