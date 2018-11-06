<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<form action="../event/eventWrite.do" method="post" id="form">
	<h1>이벤트 입력창</h1>
	<table border="">
		<tr>
			<td width="100" align="center">썸네일 이미지</td>
			<td width="700">
				<input type="text" placeholder="Thumbnail.png etc" name="e_img" size="110">
			</td>
		</tr>
		<tr>
			<td align="center">제목</td>
			<td>
				<input type="text" size="110" name="title">
			</td>
		</tr>
		<tr>
			<td align="center">부제목</td>
			<td>
				<input type="text" size="110" name="sub_title">
			</td>
		</tr>
		<tr>
			<td align="center">시작일</td>
			<td>
				<input type="text" size="110" name="s_date" placeholder="0000-00-00">
			</td>
		</tr>
		<tr>
			<td align="center">부제목</td>
			<td>
				<input type="text" size="110" name="e_date" placeholder="0000-00-00">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button id="submit">등록</button>
				<button type="reset" id="reset">다시 작성</button>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="../event/eventListAll.do?pg=1">이벤트 전체 목록 보기</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>