<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div#rankPreviewList {
	 background-image: url(../etc/image/rankImage/lostArk.png);
	 background-repeat: no-repeat;
	 background-position: center;
}
</style>
</head>
<body>
<div align="right">
	<a href="../rank/yutnoriiiRankList.do?pg=1"><img src="../etc/image/rankImage/plus.png"></a>
</div>
<div align="center">
<img alt="" src="../etc/image/rankImage/honor777.png" >
<br>

<div id="rankPreviewList">
<br>
<jsp:include page="../rank/rankPreview.jsp"/>
<br>
</div>
</div>
</body>
</html>




