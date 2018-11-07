<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div#hisbody{
	padding-top: 30px;
	padding-left: 100px;	
	padding-right: 100px;
}
div#hitoryPageTitle { 
	font-size: 2.1em;
	line-height: 80px;
	/* text-align: left;*/
	margin-left: -32px; 
	margin-right: -32px; 
	border-bottom: 1px solid gray;
	margin-bottom: 35px;
}

label#his_info_title {
	margin-left: 2%;
}

tr#tablePage {
	border-top: 4px solid rgba(139, 189, 255, 0.7);
	line-height: 50px;
}
div#historyTable table{
	font-size: 1.3em;
	text-align: center;
	border-collapse: collapse;
}
tr#historyTitle {
	background-color: rgba(139, 189, 255, 0.7);
	height: 50px;
}
tr#historyContent {
	font-size: 0.9em;
	border-bottom: 1px solid lightgray;
	background: #f8fbff;
}


#currentPaging {
	color: red; 
	text-decoration: underline;
}
#paging {
	color: blue; 
	text-decoration: none;
}
tr#historyContent a:link {color:black; text-decoration: none;}
tr#historyContent a:visited {color:black; text-decoration: none;}
tr#historyContent a:active {color:black; text-decoration: none;}
tr#historyContent a:hover {color: rgba(150, 150, 255, 0.7); text-decoration: none;}
</style>
</head> 
<body>
<div id="hisbody">
<div id="hitoryPageTitle">
	<label id="his_info_title">구매 목록</label>
</div>
<div  id="historyTable">
<table>
	<tr id="historyTitle">
		<th></th><th width="200px">상 품 명</th>
		<th width="200px">가 격</th><th width="350px">구매날짜</th>
	</tr>
<c:forEach items="${list }" var="dto" >
	<tr id="historyContent">
		<td width="120px"><img src="../etc/image/itemImage/characterImage/${dto.item_img }.png" width="75px"></td>
		<td><a href="../itemShop/itemDetail.do?category=${dto.category }&item_code=${dto.item_code }&pg=${pg}&order=sysdate">${dto.item_name}</a></td>
		<td>${dto.item_charge}</td><td>${dto.pay_log}</td>
	</tr>
</c:forEach>

	<tr id="tablePage">
		<td colspan="4" align="center">
		<c:if test="${startPage > 3 }">
			[<a id="paging" href="../main/myPage.do?dis=../user/paymentHistory.do?pg=${startPage-1}">이전</a>]
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
			<c:if test="${pg == i }">
				[<a id="currentPaging" href="../main/myPage.do?dis=../user/paymentHistory.do?pg=${i}">${i }</a>]
			</c:if>
			<c:if test="${pg != i }">
				[<a id="paging" href="../main/myPage.do?dis=../user/paymentHistory.do?pg=${i}">${i }</a>]				
			</c:if>
		</c:forEach>
		
		<c:if test="${endPage < totalP}">
			[<a id="paging" href="../main/myPage.do?dis=../user/paymentHistory.do?pg=${endPage + 1 }">다음</a>]
		</c:if>
		
	</tr>


</table>
</div>


</div>
</body>
</html>