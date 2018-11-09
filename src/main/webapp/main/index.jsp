<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="../etc/css/indexCss/index_style.css"/>


</head>

<script type="text/javascript">

	$(function(){
		$("div#menu").mouseover(function(){
			
			$("#menu_sub").stop().slideDown(100);
		});
		$("div#menu").mouseout(function(){
			
			$("#menu_sub").stop().slideUp(100);
		});
		$("#menu_sub").mouseover(function(){
			
			$("#menu_sub").stop().slideDown(100);
		});
		$("#menu_sub").mouseout(function(){
			
			$("#menu_sub").stop().slideUp(100);
		});
		
		
		$("a.over_mouse_title").mouseover(function(){
			$(this).parent().css("border-bottom","1.5px solid white");
		});
		$("a.over_mouse_title").mouseout(function(){
			$(this).parent().css("border-bottom","0px");
		});
		
		$("div#start_button").click(function(){
			var agent = navigator.userAgent.toLowerCase();

			if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
			    alert("Internet Explorer"); 
				var path = String.fromCharCode(34)+'C:\\Riot Games\\League of Legends\\LeagueClient.exe'+String.fromCharCode(34);
			    alert(path);
				var objWSH = new ActiveXObject("WScript.Shell");
				alert("test");
			    var retval = objWSH.run(path,1,true);
			   
			}
			 
			else if (agent.indexOf("chrome") != -1) {
			  
			    alert("HAVE TO INSTALL."); 
			    var objWSH = new ActiveXObject("WScript.Shell");
			    var retval = objWSH.Run("C:/Windows/SysWOW64/notepad.exe",1,true);
			  
			}

		});
		
		
		
		$.ajax({
			url : "../rank/rankPreview.do",
			type : "post",
			data : {"pg" : "1"},
			dataType : "json",
			success : function(data){
			
				$.each(data.items, function(index, item){
					// 결과를 출력하기 위한 동적 요소의 생성
					
					var tr = $("<tr>", {align: "center"});
					var td1 = $("<td>").html(item.rank);
					var td2 = $("<td>").html(item.name);
						
					var td3 = $("<td>").html(item.win + " / " + item.lose);
					
					tr.append(td1).append(td2).append(td3);
					
					$("table#rankPreview").append(tr);
				});
			},
			error : function(xhr, textStatus, errorThrown){
				$("div").html("<div>"+textStatus+" (HTTP-)"+ xhr.status + " / " + errorThrown +")</div>");
			}
		});
<<<<<<< HEAD
	});
	
=======
<<<<<<< HEAD
=======

>>>>>>> 5649e4fb68e6234db39383cd8a377ddc914982ec
	
	});
	

<<<<<<< HEAD
	}
=======

	
>>>>>>> 5649e4fb68e6234db39383cd8a377ddc914982ec
>>>>>>> 13fe87bb385dad4405535b04bd74b6beb6d4c443
	
</script>

<body>
<div id="top_info">
	
	
</div>
<div id="menu_space">
	<div id="menu_title">
		<div id="menu">
			<jsp:include page="menu/title_menu.jsp"/>
		</div>
		<div id="start_button">
			<img alt="" src="../etc/image/mainImage/gameStartBtn.png">	
		</div>
	</div>
	
	<div id="menu_sub">
		<jsp:include page="menu/sub_menu.jsp"/>
		
	</div>
	
	<div id="login_form">
		<c:if test="${session_id != null}">
			<jsp:include page="../login/loginResult.jsp"/>
		</c:if>
		<c:if test="${session_id == null}">
			<jsp:include page="../login/loginForm.jsp"/>
		</c:if>
		<div id="login_activity">
		<c:if test="${session_id == null}">
			<a href="../user/signUp.jsp?step=signUp_step01">회원가입</a>
			
			<a href="javascript:void(window.open('../user/id_pw_findPage.jsp?step=01','IP/PW 찾기','width=650px, height=800px'))">ID/비밀번호 찾기</a>
			
		</c:if>
		<c:if test="${session_id != null}">
			<a href="../main/myPage.do">마이페이지</a>
			
			<a href="../main/signOut.do">로그아웃</a>
		</c:if>
		</div>
	</div>
	
</div>

<c:if test="${display == null }">
	<c:if test="${loginCheck == 'no' }">
		<script type="text/javascript">
			alert("로그인 후 이용해주세요");
			location.href = "../login/loginPage.jsp";
		</script>
	</c:if>
<div id="data_space">

	<div id="rank_notice">
		
		<div id="rank">
			<jsp:include page="../template/left.jsp"/>
		</div>
		
		<div id="notice">
			<jsp:include page="../news/newsPreview.jsp"/>
		</div>
	</div>
	
	<div id="game_info">
	
		게임정보 메뉴
	</div>
	
	<div id="screenshot">
		<jsp:include page="../event/eventPreview.jsp"/>
	</div>
	
	<div id="real_screenshot">
		<jsp:include page="../imgboard/imgboard_listPreView.jsp"/>
	</div>
	
	<div id="item_shop">
		<jsp:include page="../itemShop/itemShopPreview.jsp"/>
	</div>

</div>
</c:if>
<c:if test="${display != null }">
<div id="space">
	<jsp:include page="${display }"/>
</div>
</c:if>




<div id="footer">
	<jsp:include page="../template/bottom.jsp"/>
</div>

</body>
</html>
