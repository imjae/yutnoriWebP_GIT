<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../etc/js/jquery-3.3.1.js"></script>

<style type="text/css">
	div#img_preview_title {
		margin: 0 auto;
		width: 100%;
		height: 50px;
		/* border-top: 1px solid lightgray; */
		font-size: 2em;
		font-family: "-윤고딕320";
		color: gray;
	}
	
	div#img_preview {
		margin-left: 30px;
		width: 100%;
		height: 100%;
	}
	
	div#pre_img_div {
		margin: 15px 10px;
		float: left;
		width: 16.5%;
		height: 80%;
		background-color: white;
		vertical-align: center;
	}
	
	
	img#img_preShot {
		width: 100%;
		height: 100%;
	}
	
	div#img_preWriter {
		font-size: 12px;
		width: 100%;
	}
	
	div#img_preImg {
		height: 65%;
		margin-top: 0;
	}
	
	div#img_preSubject {
		width: 100%;
		height: 10%;
	}
	img#pre_img {
		width: 95%;
		height: 95%;
	}
	
	img#img_pre_plus {
		float: right;
	}
</style>

<script type="text/javascript">

	$(function(){
		$.ajax({
			url : "../imgboard/imgboard_listPreView.do",
			type : "post",
			data : {"imgboard_pg" : "1"},
			dataType : "json",
			success : function(data){
			
				$.each(data.items, function(index, item){
					
					var div = $("<div>", {id : "pre_img_div"});
					var div_img = $("<div>", {id: "img_preImg"});
					
					var imga = $("<img>", {
						"src" : "../storage/"+item.imgboard_img,
						"id" : "pre_img"
					}); 
					
					
					var div_subject = $("<div>", {id: "img_preSubject"}).html(item.imgboard_subject);
					var div_writer = $("<div>", {id: "img_preWriter"}).html(item.imgboard_writer);
					
					div_img.append(imga);
					
					div.append(div_img);
					div.append(div_subject);
					div.append(div_writer);
					
					$("div#img_preview").append(div);
				});
			},
			error : function(xhr, textStatus, errorThrown){
				$("div").html("<div>"+textStatus+" (HTTP-"+ xhr.status + " / " + errorThrown +")</div>");
			}
		});
		
		$("img#img_pre_plus").click(function(){
			location.href="../imgboard/imgboard_list.do?imgboard_pg=1";
		});
	});

</script>

</head>
<body>
	
		<img id="img_pre_plus" src="../etc/image/rankImage/plus.png"/>
	
	<div id="img_preview">
	
	</div>
	
</body>
</html>