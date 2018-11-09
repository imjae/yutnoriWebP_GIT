<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

div#user_info_total>div#title {
	margin: 0 auto;
	margin-top: 100px;
	width: 87%;
	height: 100px;
	border-bottom: 1px solid gray;
}

label#user_info_title {
	margin-left: 2%;
	font-size: 2.1em;
	line-height: 110px;
}

div#char_info_div {
	margin: 0 auto;
	width: 85%;
	height: 400px;
	/* border-top: 1px solid gray; */
	padding-top: 5px;
	border-bottom: 1px solid gray;
	/* border: 1.5px solid lightgray; */
}

div#char_img_div {
	width: 37%;
	height: 90%;
	/* border: 1px solid black; */
	float: left;
	border: 1.5px solid lightgray;
}

div#item_list_div {
	width: 58%;
	height: 90%;
	/*  border: 1px solid black;  */
	float: right;
	margin-left: 10px;
}

div.item_list_element_1, div.item_list_element_2 {
	width: 17%;
	height: 23%;
	border: 2px solid lightgray;;
	border-radius: 5px;
	float: left;
	margin-right: 8px;
	margin-bottom: 10px;
}

div.item_list_element_1:hover {
	border: 2px solid pink;
	cursor: pointer;
}


div#item_list_nextBtn {
	width: 25px;
	height: 90%;
	background-color: lightgray;
	color: black;
	float: right;
	border-radius: 4px;
	font-weight: bold;
	text-align: center;
	line-height: 360px
}

div#item_list_nextBtn:hover {
	cursor: pointer;
}

img.item_list_img {
	width: 95%;
	height: 100%;
}

img#char_img {
	width: 100%;
	height: 100%;
}

div#item_category_total {
	margin: 0 auto;
	width: 85%;
	height: 37px;
	/* border: 1px solid green; */
	margin-top: 100px;
}

div#item_category_total div {
	width: 95px;
	height: 95%;
	float: left;
	border-left: 0px;
	border-top: 1.5px solid black;
	border-right: 1.5px solid black;
	border-bottom: 1.5px solid black;
	text-align: center;
	line-height: 40px;
	border-radius: 0px 6px 0px 0px;
	background: lightgray;
}

div#item_category_total div:first-child {
	width: 95px;
	height: 95%;
	float: left;
	border-left: 1.5px solid black;
	border-top: 1.5px solid black;
	border-right: 1.5px solid black;
	border-bottom: 0px;
	text-align: center;
	line-height: 40px;
	border-radius: 3px;
	background-color: white;
}

div#category_total {
	margin-left: 38.8%;
}

div#equipBtn { 
	width: 130px;
	height: 40px;
	margin: 30px auto;
	background-color: #cacaca;
	border-radius: 5px;
	line-height: 40px;
	font-size: 1.3em;
	color: white;
	text-align: center;
}
div#equipBtn:hover {
	cursor: pointer;
}

div#char_img_div img {
	width: 99%;
	height: 99%;
}

div#char_img_div img#char_img {
	position: relative;
	
	margin-top: -500px;
}

</style>

<script type="text/javascript">
	$(function() {
		var pg = 1;
		
		$.ajax({
			url : "../user/equip_item_status_charInfo.do",
			type : "post",
			dataType : "json",
			success : function(data){
				var su = 0;
				$.each(data.items, function(index, item){
					
					
					if(item.character != null){
						$("img#char_img").attr("src","../etc/image/itemImage/characterImage/"+item.character+".png");

					}
					if(item.background != null){
						$("img#back_img").attr("src","../etc/image/itemImage/characterImage/"+item.background+".png");
					}
					
				
				});
			},
			error : function(xhr, textStatus, errorThrown){
				$("div").html("<div>"+textStatus+" (HTTP-)"+ xhr.status + " / " + errorThrown +")</div>");
			}
		});
		
		$.ajax({
			url : "../user/have_itemList.do",
			type : "post",
			data : {"category" : "total",
					"pg":"1"},
			dataType : "json",
			success : function(data){
				var su = 0;
				$.each(data.items, function(index, item){
					// 결과를 출력하기 위한 동적 요소의 생성
					/*<div class="item_list_element_1">
						<img class="item_list_img"
							src="../etc/image/itemImage/characterImage/${list.item_img }.png" />
					</div> */
					
					var div1 = $("<div>",{
						"class": "item_list_element_1",
						"data-itemCode": item.item_code,
						"data-category": item.category,
						"flag" : "0"
					});
					
					su = item.su;
					if(su != 0){
						var img = $("<img>", {"class": "item_list_img"}).attr("src","../etc/image/itemImage/characterImage/"+item.item_img+".png");
						}
					div1.append(img);
					
					$("div#item_list_div").append(div1);  
					
				
				});
				
				for(var i=0; i<su; i++){
					var div1 = $("<div>",{"class": "item_list_element_1"});
					
					$("div#item_list_div").append(div1);
				}
			},
			error : function(xhr, textStatus, errorThrown){
				$("div").html("<div>"+textStatus+" (HTTP-)"+ xhr.status + " / " + errorThrown +")</div>");
			}
		});
	

		$("div.item_list_element_1").click(function(){
			alert("tetst");
			$(this).css("border", "1px solid pink");
		});
		
		

		$("div#category_total").click(function() {
			$("div.item_list_element_1").remove();
			
			$("div.category").css("border-bottom","1px solid black");
			$("div.category").css("background-color","lightgray");
			
			$(this).css("background-color", "white");
			$(this).css("border-bottom", "0px");
				
			$.ajax({
				url : "../user/have_itemList.do",
				type : "post",
				data : {"category" : "total",
						"pg":"1"},
				dataType : "json",
				success : function(data){
					var su = 0;
					
				
					$.each(data.items, function(index, item){
						// 결과를 출력하기 위한 동적 요소의 생성
						/*<div class="item_list_element_1">
							<img class="item_list_img"
								src="../etc/image/itemImage/characterImage/${list.item_img }.png" />
						</div> */
						
						var div1 = $("<div>",{
							"class": "item_list_element_1",
							"data-itemCode": item.item_code,
							"data-category": item.category,
							"flag" : "0"
						});
						su = item.su;
						if(su != 0){
							var img = $("<img>", {"class": "item_list_img"}).attr("src","../etc/image/itemImage/characterImage/"+item.item_img+".png");
							}
						div1.append(img);
						
						$("div#item_list_div").append(div1);  
					});
					
					for(var i=0; i<su; i++){
						var div1 = $("<div>",{"class": "item_list_element_1"});
						
						$("div#item_list_div").append(div1);
					}
				},
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>"+textStatus+" (HTTP-)"+ xhr.status + " / " + errorThrown +")</div>");
				}
			});

		});
		$("div#category_character").click(function() {
			$("div.item_list_element_1").remove();


			$("div.category").css("border-bottom","1px solid black");
			$("div.category").css("background-color","lightgray");
			
			$(this).css("background-color", "white");
			$(this).css("border-bottom", "0px");

			$.ajax({
				url : "../user/have_itemList.do",
				type : "post",
				data : {"category" : "character",
						"pg":"1"},
				dataType : "json",
				success : function(data){
					var su = 0;
				
					$.each(data.items, function(index, item){
						// 결과를 출력하기 위한 동적 요소의 생성
						/*<div class="item_list_element_1">
							<img class="item_list_img"
								src="../etc/image/itemImage/characterImage/${list.item_img }.png" />
						</div> */
						
						var div1 = $("<div>",{
							"class": "item_list_element_1",
							"data-itemCode": item.item_code,
							"data-category": item.category,
							"flag" : "0"
						});
						su = item.su;
						if(su != 0){
							var img = $("<img>", {"class": "item_list_img"}).attr("src","../etc/image/itemImage/characterImage/"+item.item_img+".png");
							}
						div1.append(img);
						
						$("div#item_list_div").append(div1);  
					});
					
					for(var i=0; i<su; i++){
						var div1 = $("<div>",{"class": "item_list_element_1"});
						
						$("div#item_list_div").append(div1);
					}
				},
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>"+textStatus+" (HTTP-)"+ xhr.status + " / " + errorThrown +")</div>");
				}
			});

		});
		$("div#category_background").click(function() {
			$("div.item_list_element_1").remove();
			$("div.category").css("border-bottom","1px solid black");
			$("div.category").css("background-color","lightgray");

			$(this).css("background-color", "white");
			$(this).css("border-bottom", "0px");

			$.ajax({
				url : "../user/have_itemList.do",
				type : "post",
				data : {"category" : "background",
						"pg":"1"},
				dataType : "json",
				success : function(data){
					var su = 0;
				
					$.each(data.items, function(index, item){
						// 결과를 출력하기 위한 동적 요소의 생성
						/*<div class="item_list_element_1">
							<img class="item_list_img"
								src="../etc/image/itemImage/characterImage/${list.item_img }.png" />
						</div> */
						su = item.su;
						
						var div1 = $("<div>",{
							"class": "item_list_element_1",
							"data-itemCode": item.item_code,
							"data-category": item.category,
							"flag" : "0"
						});
						
						if(su != 0){
							var img = $("<img>", {"class": "item_list_img"}).attr("src","../etc/image/itemImage/characterImage/"+item.item_img+".png");
						}
						div1.append(img);
						
						$("div#item_list_div").append(div1);  
					});
					
					for(var i=0; i<su; i++){
						var div1 = $("<div>",{"class": "item_list_element_1"});
						
						$("div#item_list_div").append(div1);
					}
				},
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>"+textStatus+" (HTTP-)"+ xhr.status + " / " + errorThrown +")</div>");
				}
			});

		});
		$("div#category_etc").click(function() {
			$("div.item_list_element_1").remove();

			$("div.category").css("border-bottom","1px solid black");
			$("div.category").css("background-color","lightgray");
			
			$(this).css("background-color", "white");
			$(this).css("border-bottom", "0px");
			

			$.ajax({
				url : "../user/have_itemList.do",
				type : "post",
				data : {"category" : "etc",
						"pg":"1"},
				dataType : "json",
				success : function(data){
					var su = 0;
				
					$.each(data.items, function(index, item){
						// 결과를 출력하기 위한 동적 요소의 생성
						/*<div class="item_list_element_1">
							<img class="item_list_img"
								src="../etc/image/itemImage/characterImage/${list.item_img }.png" />
						</div> */
						su = item.su;
						
						var div1 = $("<div>",{
							"class": "item_list_element_1",
							"data-itemCode": item.item_code,
							"data-category": item.category,
							"flag" : "0"
						});
						if(su != 0){
						var img = $("<img>", {"class": "item_list_img"}).attr("src","../etc/image/itemImage/characterImage/"+item.item_img+".png");
						}
						div1.append(img);
						
						$("div#item_list_div").append(div1);  
						
					});
					
					for(var i=0; i<su; i++){
						var div1 = $("<div>",{"class": "item_list_element_1"});
						
						$("div#item_list_div").append(div1);
					}
				},
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>"+textStatus+" (HTTP-)"+ xhr.status + " / " + errorThrown +")</div>");
				}
			});

		});
		var item_sel_flag = false;
		
		$(document).on("hover", "div.item_list_element_1", function() {
			
			$(this).css("border","2px solid pink");
			
		 	 	
		});
		
		$(document).on("click", "div.item_list_element_1", function() {
			
		
			var clicked_item_code = $(this).attr("data-itemCode");
			var clicked_item_category = $(this).attr("data-category");
			if(clicked_item_category === undefined){
				
			}else{
			$.ajax({
				url : "../user/equip_item.do",
				type : "post",
				data : {
					"item_code" : clicked_item_code,
					"category" : clicked_item_category
				},
				dataType : "json",
				success : function(data){
					$.each(data.items, function(index, item){
						
						var a = item.category=="character";
						
						
						if(item.category=="character"){
							$("img#char_img").attr("src","../etc/image/itemImage/characterImage/"+item.item_img+".png")
							 
							
						}else if(item.category == "background"){
							$("img#back_img").attr("src","../etc/image/itemImage/characterImage/"+item.item_img+".png")
							
						}   
						
					});
					
	
				},
				error : function(xhr, textStatus, errorThrown){
					$("div").html("<div>"+textStatus+" (HTTP-)"+ xhr.status + " / " + errorThrown +")</div>");
				}
			});
			}
		 	 	
		});

		$("div#item_list_nextBtn").click(function() {
			
		});
	});
</script>

</head>
<body>

	<div id="user_info_total">

		<div id="title">
			<label id="user_info_title"> 캐릭터 정보 </label>

		</div>

		<div id="item_category_total">
			<div id="category_total" class="category">전 체</div>
			<div id="category_character" class="category">캐 릭 터</div>
			<div id="category_background" class="category">배 경</div>
			<div id="category_etc" class="category">기 타</div>
		</div>
		
		<div id="char_info_div">
			<div id="char_img_div">
			
				<img id="back_img"/>
				<img id="char_img" />
				
			</div>

			<div id="item_list_nextBtn">&gt;</div>

			<div id="item_list_div">
				
				

			</div>
		</div>
		
	</div>

</body>
</html>