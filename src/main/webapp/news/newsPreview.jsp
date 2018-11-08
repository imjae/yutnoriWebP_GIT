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
	height: 100%;
	float: left;
}

div#news_preview_list_total {
	width: 54%;
	height: 100%;
	float: left;
	margin: 0 auto;
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
	margin: 0 auto;
	width: 100%;
	height: 80%;
	
}

div#news_preview_list {
	font-family: "-윤고딕320";
	font-size: 1.4em;
	/* border: 1px solid gray; */
}

div#news_preview_sort_div {
	width: 14%;
	height: 100%;
	margin-top: 9px;
	float: left;
/* 	border: 1px solid blue; */
	text-align: center;
	font-weight: bold;
	margin-left: 10px;
	
}

div#news_preview_title_div {
	width: 80%;
	height: 100%;
	margin-top: 5px;
	margin-left: 10px;
	float: left;
	/* border: 1px solid green; */
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
					
					var a = $("<a>", {"href" : })
					
					
					div.append(div_sort).append(div_title);
					
					$("div#news_preview_list").append(div); 
					
					
				});
			},
			error : function(xhr, textStatus, errorThrown){
				$("div").html("<div>"+textStatus+" (HTTP-)"+ xhr.status + " / " + errorThrown +")</div>");
			}
		});
	
	
	});

</script>

</head>

<body>

<div id="notice_total">
	
	<div id="news_preview_preview">
		
	</div>
	
	
	<div id="news_preview_list_total">
		<div id="news_preview_title">
			&nbsp;&nbsp;새소식
		</div>
		<div id="news_preview_list">
		
			
		
		</div>
	</div>
	


</div>

</body>
</html>