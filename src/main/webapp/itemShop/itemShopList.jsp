<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<style type="text/css">
table {
	/* border: 1px solid red; */
}
td {
	width: 180px;
}
#currentPaging {
	color: red; 
	text-decoration: underline;
}
#paging {
	color: blue; 
	text-decoration: none;
}
</style>
<script type="text/javascript">
	$(function(){
		
		$(document).ready(function(){
			if(${have eq 'have'}){
				alert("이미 가지고 있는 제품입니다.");
				location.href="../itemShop/mainShop.do?category=all&pg=1&order=logtime";
			}
		});
		
		
		$("#shopForm a img").hover(function(){
			var img = $(this).attr("id") + "Mud.png";
			$(this).attr("src",img);
		},function(){
			$(this).attr("src",$(this).attr("id")+".png");
		});
	});
</script>
</head>
<body>

<c:set var="i" value="0"/>
<table align="center" id="shopForm">
	<tr>
	<c:forEach var="itemShopDTO" items="${list }">
		<c:set var="i" value="${i+1 }" />
		<td>
			<a href="itemDetail.do?category=${category }&item_code=${itemShopDTO.item_code }&pg=${pg}&order=${order}">
			<img id="../etc/image/itemImage/characterImage/${itemShopDTO.item_img }Title" src="../etc/image/itemImage/characterImage/${itemShopDTO.item_img }Title.png">
			</a>
		</td>
		<c:if test="${i%4==0 }">
			</tr>
		</c:if>
	</c:forEach>
	
	
	<!-- 페이징처리 -->
	<tr>
		<td colspan="4" align="center">
		<c:if test="${startPage > 3 }">
			[<a id="paging" href="mainShop.do?category=${category }&pg=${startPage -1 }&order=${order}">이전</a>]
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
			<c:if test="${pg == i }">
				[<a id="currentPaging" href="mainShop.do?category=${category }&pg=${i}&order=${order}">${i }</a>]
			</c:if>
			<c:if test="${pg != i }">
				[<a id="paging" href="mainShop.do?category=${category }&pg=${i }&order=${order}">${i }</a>]				
			</c:if>
		</c:forEach>
		
		<c:if test="${endPage < totalP}">
			[<a id="paging" href="mainShop.do?category=${category }&pg=${endPage + 1 }&order=${order}">다음</a>]
		</c:if>
		
	</tr>
	
</table>


</body>
</html>