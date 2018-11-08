<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.object {
	float: left;
	margin-bottom: 10px;
	margin-left: 10px;
	margin-right: 10px;
	height: 380px;
	width: 300px;
	/* border: 1px solid orange; */
}
.img {
	height: 180px;
	width: 200px;
	/* border: 1px solid red; */
	margin-right: 30px;
}

.text {
	/* border: 1px solid green;  */
	height: 200px;
	padding-left: 25px;
}

.e_title {
/* 	margin-top: 20px; */]
	padding-top: 10px;
	margin-bottom: 10px;
	/* border: 1px solid red; */
}

.e_title a {
	color: black;
	font-size: 2.2em;
}

.e_title a:link {
	text-decoration: none;
}

.e_title a:hover {
	text-decoration: underline;
}
.e_sub_title {
	/* border: 1px solid yellow; */
	margin: 0px;
	height: 61px;
	margin-bottom: 30px;
}

.e_sub_title a {
	color: gray;
	font-size: 1.2em;
}

.e_sub_title a:link {
	text-decoration: none;
}

.e_sub_title a:hover {
	text-decoration: underline;
}
.period {
	/* border: 1px solid blue; */
	margin: 0px;
	color: gray;
}
#e_total {
	width: 100%;
	height: 100%;
	padding-left: 50px;
}
</style>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		 $.ajax({
			url : "../event/eventPreview.do",
			type : "post",
			dataType : "json",
			success : function(data) {
				$.each(data.items, function(index, item) {
					// 전체 div
					var div_object = $("<div>", {"class": "object"});
					//div_object.html("하이");
					
					// 이미지 div
					var div_img = $("<div>", {"class": "img"});
					var a_img = $("<a>", {
						href: "../event/eventMainView.do?e_num=" + item.e_num
					});
					var img_img = $("<img>", {
						src: "../etc/image/eventThumbnail/" + item.e_img,
						width: "300px",
						height: "170px"
					});
					a_img.append(img_img);
					div_img.append(a_img);
					
					 
					// text div
					var div_text = $("<div>", {"class": "text"});
					
					var div_e_title = $("<div>", {"class": "e_title"});
					var a_e_title = $("<a>", {
						href: "../event/eventMainView.do?e_num=" + item.e_num
					});
					a_e_title.html(item.title);
					div_e_title.append(a_e_title);
					
					var div_e_sub_title = $("<div>", {"class": "e_sub_title"});
					var a_e_sub_title = $("<a>", {
						href: "../event/eventMainView.do?e_num=" + item.e_num
					});
					a_e_sub_title.html(item.sub_title);
					div_e_sub_title.append(a_e_sub_title);
					
					var div_period = $("<div>", {"class": "period"});
					div_period.html(item.s_date + " ~ " + item.e_date);
					
					div_text.append(div_e_title).append(div_e_sub_title).append(div_period);
					 
					// 전체 div 조합
					div_object.append(div_img).append(div_text);
					
					// 조합
					$("#e_total").append(div_object);
				});
			},
			error : function(xhr, textStatus, errorThrown) {
				$("div").html("<div>"+textStatus+" (HTTP-)"+ xhr.status+" / "+errorThrown+")</div>");
			}
		}); 
	});
</script>
</head>
<body>
<div align="right">
	<a href="../event/eventMainOn.do"><img src="../etc/image/rankImage/plus.png"></a>
</div>
<div id="e_total">
</div>

</body>
</html>