<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>

<style type="text/css">
	
	div#step02_total {
		padding: 0px 40px;
		font-family: "-윤고딕320";
		
	}
	
	div#top_title1 {
		width: 95%;
		height: 120px;
		border-bottom: 3px solid lightgray;
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
	
	div#signUp_btn div#okBtn, div#signUp_btn div#resetBtn {
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
	
	
	
	div#step02_total > div {
		margin: 20px;
		width: 100%;
		height: 150px;
		border-bottom: 1px solid lightgray;
	}
	
	div#step02_total > div:last-child {
		margin: 20px;
		width: 100%;
		height: 150px;
		border-bottom: 0px solid lightgray;
	}
	
	div.left_col {
		font-size: 1.3em;
		padding: 20px;
		width: 25%;
		height: 130px;
		float: left;
		color: gray;
	}
	
	div.right_col {
		padding: 20px;
		width: 50%;
		height: auto;
		float: left;
	}
	
	div.right_col input[type=text], input[type=password] {
		border: 2px solid rgba(176,217,255,0.9);
		height: 40px;
		width: 340px;
		background-color: rgba(176,217,255,0.6);
	}
	
	div#user_jumin input[type=text] {
		width: 160px;
		height: 35px;
	}
	div#user_jumin input[type=password] {
		width: 160px;
		height: 35px;
	}
	
	div#user_phone input[name=user_phone1] {
		width: 70px;
		height: 30px;
	}
	div#user_phone input[name=user_phone2] {
		width: 100px;
		height: 30px;
	}
	div#user_phone input[name=user_phone3] {
		width: 100px;
		height: 30px;
	}
	
	select {
		width: 70px;
		height: 30px;
	}
</style>

<script type="text/javascript">

	$(function(){
		
		$("div#user_id input[type=text]").focus();
		// 이메일유효성 검사
		$("div#user_id input[type=text]").focusout(function(){
			// 정규식 - 이메일 유효성 검사
	        var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	        // 정규식 -전화번호 유효성 검사
	        var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	        
	        var user_mail = $("div#user_id input[type=text]");
	        
	        var userid =  user_mail.val(); 
	        
	        
	        $.ajax({
	            async: true,
	            type : 'POST',
	            data : {"id" : $("div#user_id input[type=text]").val()},
	            url : "userIdCheck.do",
	            success : function(data) {
	                if (data != '0') {
	                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
	                    $("label#email_check").css("color", "red");
	            		$("label#email_check").html("&nbsp; X 아이디가 존재합니다.. TT _ TT");
	                    
	                	return false;
	                } else {
	                	if( !userid ){
	        	        	$("label#email_check").css("color", "red");
	        	            $("label#email_check").html("&nbsp; X 이메일을 입력해 주세요. TT _ TT");
	        	            return false;
	        	        } else {
	        	            if(!regEmail.test(user_mail.val())) {
	        	            	$("label#email_check").css("color", "red");
	        	            	$("label#email_check").html("&nbsp; X 이메일주소가 유효하지않습니다.  TT _ TT");
	        	                return false;
	        	            }else {
	        	            	$("label#email_check").css("color", "green");
	        	            	$("label#email_check").html("&nbsp; O 사용 가능한 이메일주소 입니다. ^ __ ^");
	        	            	return true;
	        	            }
	        	        }
	                }
	            },
	            error : function(error) {
	                
	                alert("error : " + error);
	            }
	        }); 
	        
		});
		
		// 비밀번호 유효성검사
		$("div#user_password input[type=password]#user_password").focusout(function(){
			
				var password = $("div#user_password input[type=password]").val();
				
			 	
			    var checkNumber = password.search(/[0-9]/g);
			    var checkEnglish = password.search(/[a-z]/ig);
			    
			    if(checkNumber <0 || checkEnglish <0){
			    	$("label#password_check").css("color", "red");
			        $("label#password_check").html("&nbsp; X 숫자, 영문자 혼용해 다시 작성해주세요.  TT _ TT");
			        $("div#user_password input[type=password]").focus();
			        return false;
			    }
			    if(/(\w)\1\1\1/.test(password)){
			        $("label#password_check").css("color", "red");
			        $("label#password_check").html("&nbsp; X 같은 문자를 4번이상 사용하실 수 없습니다.  TT _ TT");
			        $("div#user_password input[type=password]").focus();
			        return false;
			    }
			    
			    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
			        $("label#password_check").css("color", "red");
		            $("label#password_check").html("&nbsp; X 숫자+영문자+특수문자 조합으로 8자리 이상 사용해 주세요.  TT _ TT");
		            $("div#user_password input[type=password]").focus();
			        return false;
			    }    
			 	
			    $("label#password_check").css("color", "green");
	            $("label#password_check").html("&nbsp; O 유효한 비밀번호 입니다. ^ __ ^");
			    return true;
		});
		
		//비밀번호 재확인
		$("div#user_re_password input[type=password]#user_re_password").focusout(function(){
			var password = $("div#user_password input[type=password]").val();
			
			
			var re_password = $("div#user_re_password input[type=password]").val();
			
			if(!(password == re_password)){
				 $("label#re_password_check").css("color", "red");
		         $("label#re_password_check").html("&nbsp; X 비밀번호가 일치하지 않습니다.  TT _ TT");
		         $("div#user_re_password input[type=password]").focus();
		         
		         return false;
			}else {
				$("label#re_password_check").css("color", "green");
		        $("label#re_password_check").html("&nbsp; O 비밀번호가 일치합니다.  ^ __ ^");
		        
		        return true;
			}
			
			return true;
		});
		
		
		$("div#okBtn").click(function(){
			$("#signup_form").submit();
		});
	});
	

</script>

</head>
<body>

<form action="sign_mail.do" method="post" id="signup_form">
<div id="step02_total">
	<div id="top_title1">
		<div class="top_title1">기본정보입력</div>
		<div class="top_title2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기본 정보를 정확히 입력해주시기 바랍니다.</div>
	</div>
	
	<div id="user_id">
		<div class="left_col">
			ID(email형식)
		</div>
		<div class="right_col">
			<input type="text" name="user_id"><br><br>
			<label id="email_check">이메일 형식에 맞게 입력해주세요.</label>
		</div>
	</div>
	
	<div id="user_password">
		<div class="left_col">
			비밀번호
		</div>
		<div class="right_col">
			<input type="password" name="user_password" id="user_password"><br><br>
			<label id="password_check"></label>
		</div>
	</div>
	
	<div id="user_re_password">
		<div class="left_col">
			비밀번호 재확인
		</div>
		<div class="right_col">
			<input type="password" name="user_re_password" id="user_re_password"><br><br>
			<label id="re_password_check"></label>
		</div>
	</div>
	
	<div id="user_name">
		<div class="left_col">
			이름
		</div>
		<div class="right_col">
			<input type="text" name="user_name">
		</div>
	</div>
	
	<div id="user_jumin">
		<div class="left_col">
			주민등록번호
		</div>
		<div class="right_col">
			<input type="text" name="user_jumin1"> &nbsp;-&nbsp; <input type="password" name="user_jumin2">
		</div>
	</div>

	<div id="user_phone">
		<div class="left_col">
			핸드폰 번호
		</div>
		<div class="right_col">
			
			<select name="agency">
				<option value="SKT">SKT</option>
				<option value="KT">KT</option>
				<option value="LG">LG</option>
			</select><br><br>
			
			<input type="text" name="user_phone1"> &nbsp;-&nbsp; 
			<input type="text" name="user_phone2">&nbsp;-&nbsp; <input type="text" name="user_phone3">
		</div>
	</div>

	<div id="signUp_btn">
		<div id="align_div">
			<div id="okBtn">
				확 인
			</div>
		
			<div id="resetBtn">
				새로 입력
			</div>
			
		</div>
	</div>
</div>
</form>
</body>
</html>