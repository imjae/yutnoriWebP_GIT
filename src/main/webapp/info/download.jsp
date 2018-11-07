<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다운로드</title>
<style type="text/css">
table.made{
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	line-height: 1.5;
	margin: 20px 10px;
}
table.made td{
	width: 400px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: #ce4869;
}
table.down th {
	border: 1px solid red;
	color: blue;
	background-color:yellow;
}
</style>
</head>
<body>
<h2 align="center">다운로드</h2>
<table class="down" align="center">
	<tr>   
		<th>↓ 버튼 클릭하여 설치하기 ↓</th>
	</tr> 
	<tr>
		  <td><a href="/projectteam1/download.do?path=${game}&fileName=${game}"><img alt="" src="../etc/image/downImage/button.jpg"></a></td>
		  <td><img alt="" src="../etc/image/itemImage/characterImage/ycs_.png"></td>
	</tr>
</table>
<h2 align="center">게임 권장사항</h2>
<table border="1" class="made" align="center">
	<tr>
		<th align="center" class="title">구분</th>
		<th align="center" class="title">최소 권장사양</th>
	</tr>
	<tr>
		<th align="center">운영체제</th>
		<td align="center">window XP</td>
	</tr>
	<tr>
		<th align="center">CPU</th>
		<td align="center">펜티엄 3</td>
	</tr>
	<tr>
		<th align="center">RAM</th>
		<td align="center">256 MB</td>
	</tr>
	<tr>
		<th align="center">사운드카드</th>
		<td align="center"> -</td>
	</tr>
	<tr>
		<th align="center">그래픽카드</th>
		<td align="center">32M RAM</td>
	</tr>
	<tr>
		<th align="center">다이렉트X</th>
		<td align="center">Direct X 7.0</td>
	</tr>
</table>
</body>
</html>