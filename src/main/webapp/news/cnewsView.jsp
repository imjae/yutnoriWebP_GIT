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
#sec_title {
	background-color: darkgray;
	height: 70px;
	line-height: 70px;
	padding-left: 30px;
	font-size: 1.7em;
	color: white;
}
#sec_date {
	height: 35px;
	line-height: 35px;
	padding-right: 30px;
/* 	border: 1px solid black; */
	font-size: 15px;
	color: gray;
	text-align: right;
	border-bottom: 1px solid rgba(200,200,200,0.4);
}
#sec_content {
	padding-left: 30px;
	padding-right: 30px;
	height: 800px;
	overflow: scroll;
}
#sec_btn {
	padding-left: 30px;
	padding-top: 10px;
	height: 33px;
	border-top: 1px solid rgba(200,200,200,0.4);
	/* border: 1px solid red; */
}


</style>
</head>
<body id="news_sec_total">
<div id="sec_title">
	[
	<c:if test="${newsVO.sort == 'inform' }">
		공지
	</c:if>
	<c:if test="${newsVO.sort == 'patch' }">
		점검
	</c:if>
	<c:if test="${newsVO.sort == 'shop' }">
		샵
	</c:if>
	] ${newsVO.title }
</div>

<div id="sec_date">
	${newsVO.logtime }
</div>

<div id="sec_content">
	${newsVO.content }
</div>

<div id="sec_btn">
	<button id="btn">목록</button>
</div>

</body>
</html>