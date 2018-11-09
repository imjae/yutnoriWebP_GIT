<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>

<style type="text/css">

	#login_label {
		position: relative;
		top: 10px;
	}
	
	#loginForm {
		left: 0;
		margin: 10px;
		width: 99.5%;
		height: 100%;
		font-size: 0.8em;
		color: white;
		top: -10px;
		left: -10px;
		position: relative;
		background-image: url("../etc/image/mainImage/loginForm_back.png");
	}
	
	div#cur_char_img {
		border: 1px solid white;
		width: 110px;
		height: 140px;
		margin-top: 15px;
		margin-left: -113px;
		float: left;
	}
	div#cur_back_img {
		border: 1px solid white;
		width: 110px;
		height: 140px;
		margin-top: 15px;
		margin-left: 23px;
		float: left;
	}
	div#char_info {
		margin-top: 15px;
		margin-left: 20px;
		width: 185px;
		height: 140px;
		float: left;
		margin-bottom: -7px;
	}
	
	div#char_info div {
		text-align: left;
		height: 25%;
		width: 100%;
		font-size: 0.7em;
		
	}
	
	img#cur_char_img{
		width: 100%;
		height: 100%;
	}
	img#cur_back_img{
		width: 100%;
		height: 100%;
	}
</style>

<script type="text/javascript">

	$(function(){
		
		$.ajax({
			url : "../user/equip_item_status.do",
			type : "post",
			dataType : "json",
			success : function(data){
				var su = 0;
				$.each(data.items, function(index, item){
					
					
					if(item.character != null){
						$("img#cur_char_img").attr("src","../etc/image/itemImage/characterImage/"+item.character+".png");

					}
					if(item.background != null){
						$("img#cur_back_img").attr("src","../etc/image/itemImage/characterImage/"+item.background+".png");
					}
					
				
				});
			},
			error : function(xhr, textStatus, errorThrown){
				$("div").html("<div>"+textStatus+" (HTTP-)"+ xhr.status + " / " + errorThrown +")</div>");
			}
		});
		
	});


</script>

</head>
<body id = "zxcv">
<div id="loginForm">


<div id="login_label">- MY  INFO -</div>


	<div id="charcter">
	
		<div id="cur_back_img">
			<img id="cur_back_img"/>
		</div>
		<div id="cur_char_img">
			<img id="cur_char_img"/>
		</div>
		
		
		<div id="char_info">
			<div id="user_id">${session_dto.user_id }</div>
			<div id="user_money"> 게임머니 : ${session_dto.user_money } 원</div>
			<div id="user_tear"> 등급 : ${session_dto.user_tear } </div>
			<div id="user_id"> 캐쉬 : ${session_dto.user_cash } 원</div>
		</div>
	</div>
	
	<c:if test="${session_id == 'jakeim1111@gamil.com' }">
		<button id="admin" onclick="location.href = '../adminPage.jsp'">Administrator</button>
	</c:if>
</div>
</body>
</html>