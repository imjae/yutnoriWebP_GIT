<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>

<style type="text/css">

div#notice_total {
	width: 100%;
	height: 100%;
	font-family: "-윤고딕320";
}

div#news_preview_preview {
	border-right: 2px dotted black;
	width: 45%;
	height: 82%;
	float: left;
	overflow:hidden;
	white-space:nowrap; 
	text-overflow:ellipsis;
}

div#news_preview_list_total {
	width: 100%;
	height: 100%;
	
}

div#news_preview_title {
	margin: 0 auto;
	line-height: 65px;
	font-size: 2.1em;
	margin-left: 10px;
	width : 100%;
	height: 16%;
	border-bottom: 3px dotted gray;
	
}

div#news_preview_list {
	font-family: "-윤고딕320";
	font-size: 1.2em;
	width: 100%;
	height: 82%;
	float: left;
	/* border: 1px solid gray; */
}

div#news_preview_sort_div {
	width: 10%;
	height: 100%;
	float: left;
	text-align: center;
	font-weight: bold;
	margin-left: 10px;
	
}

div#news_preview_title_div {
	width: 85%;
	height: 100%;
	margin-left: 10px;
	float: left;

	overflow:hidden;
	white-space:nowrap; 
	text-overflow:ellipsis;

}

div#news_preview_listD_iv {
	line-height: 45px;
	width: 100%;
	height: 14%;
	clear: both;
}

div#news_preview_privew_title_div {
	width: 90%;
	height: 10%;
	font-size: 1.5em;
	margin: 5px auto;
	border-bottom: 1px dotted black;	
	overflow:hidden;
	white-space:nowrap; 
	text-overflow:ellipsis;
	display: none;
}
div#div#news_preview_privew_content_div {
	width: 90%;
	height: 90%;
	overflow: hidden;
	white-space: nowrap; 
	text-overflow: ellipsis;
	display: none;
}

div#news_preview_preview {
	display: none;
	width: 46%;
	height: 80%;
}

</style>

<script type="text/javascript">
	
	$(function(){
		
		
		$(document).on("hover", "div.item_list_element_1", function() {
	         
	         $(this).css("border","2px solid pink");
	         
	              
	     });
		
		$.ajax({
			url : "../news/newsPreview.do",
			type : "post",
			dataType : "json",
			success : function(data){
			
				$.each(data.items, function(index, item){
					
					var div = $("<div>",{ "id" : "news_preview_listD_iv"});
					
					var div_sort = $("<div>",{ "id" : "news_preview_sort_div"}).html(item.sort);
					
					var div_title = $("<div>",{ "id" : "news_preview_title_div"}).html(item.title);
					
					var a = $("<a>", {
						"href" : "#",
						"class" : "news_preview_title_link",
						"data-newsNum" : item.news_num			
					}); 
					
					
					a.append(div_title);
					
					div.append(div_sort).append(a);
					
					$("div#news_preview_list").append(div); 
					
				});
			},
			error : function(xhr, textStatus, errorThrown){
				$("div").html("<div>"+textStatus+" (HTTP-)"+ xhr.status + " / " + errorThrown +")</div>");
			}
		});
		
		
		$(document).on("click", "a.news_preview_title_link", function() {
			
			 $("div#news_preview_privew_title_div").remove();
 	         $("div#news_preview_privew_content_div").remove();
			
 	         
 	         
 	         
	         var link = $(this).attr("data-newsNum");
	         $.ajax({
	 			url : "../news/newsPreview_preview.do",
	 			type : "post",
	 			
	 			data : {"news_num" : link},
	 			
	 			dataType : "json",
	 			success : function(data){
	 			
	 				$.each(data.items, function(index, item){
	 					var div_title = $("<div>",{ "id" : "news_preview_privew_title_div"}).html(item.title);
	 					
	 					var div_content = $("<div>",{ "id" : "news_preview_privew_content_div"}).html(item.content);
	 					
	 					$("div#news_preview_preview").append(div_title);  
	 					$("div#news_preview_preview").append(div_content);  
	 					
	 				});
	 			},
	 			error : function(xhr, textStatus, errorThrown){
	 				$("div").html("<div>"+textStatus+" (HTTP-)"+ xhr.status + " / " + errorThrown +")</div>");
	 			}
	 		});
		
		
	 		$("div#news_preview_preview").css("display","block");
	         $("div#div#news_preview_privew_content_div").css("display","block");	   
	         $("div#div#news_preview_privew_title_div").css("display","block");
	         $("div#news_preview_list").css("width","53%");
	      });
	
	
	});

</script>

</head>

<body>

<div id="notice_total">
	
	
	
	
	<div id="news_preview_list_total">
	
		<div id="news_preview_title">
			&nbsp;&nbsp;새소식
		</div>
		
		
		<div id="news_preview_preview">
		
		</div>
		<div id="news_preview_list">
		
		</div>
	</div>
	


</div>

</body>
</html>