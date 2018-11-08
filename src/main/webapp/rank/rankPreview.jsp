<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Roboto+Condensed');

.preserve-3d {
    transform-style: preserve-3d;
    -webkit-transform-style: preserve-3d;
}

body {
    font-smooth: always;
    -webkit-font-smoothing: antialiased;
    
   
}

div#total_rank_subject {
	border: 0;
	border-radius: 4px;
	
}
</style>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>


</head>
<body>
	<table border="0.1" id="rankPreview" style="background-image: url('../image/rankImage/ranklist.png'); background-repeat: no repeat"> 	
		<tr>
			<th width="100" class="line" align="center" style="background-color:#A4A4A4; color:#FAFAFA"><div id="total_rank_subject">순위</div></th>	
			<th width="200" class="line" align="center" style="background-color:#A4A4A4; color:#FAFAFA"><div id="total_rank_subject">닉네임</div></th>
			<th width="120" class="line" align="center" style="background-color:#A4A4A4; color:#FAFAFA"><div id="total_rank_subject">전적 (승/패)</div></th>
		</tr>
	</table>
</body>
</html>




