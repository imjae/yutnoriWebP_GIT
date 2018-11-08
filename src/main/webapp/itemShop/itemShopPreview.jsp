<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
div#shopPreview img{
	width: 200px;
}
</style>

<script type="text/javascript">

	$(function(){
		$.ajax({
			url : "../itemShop/itemShopPreview.do",
			type : "post",
			data : {"pg" : "1"},
			dataType : "json",
			success : function(data){
				$.each(data.items, function(index, item){
					var a = $("<a>",{
						"href" : "../itemShop/itemDetail.do?category="
								+ item.category +"&item_code="
								+ item.item_code +"&pg=1&order=logtime"
					});
					var img = $("<img>",{
						"id" : "../etc/image/itemImage/characterImage/" + item.item_img + "Title" ,
						"src" : "../etc/image/itemImage/characterImage/" + item.item_img + "Title.png"
					});
					
					a.append(img);
					$("div#shopPreview").append(a);
					
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
<div id="shopPreview">

</div>

</body>
</html>


