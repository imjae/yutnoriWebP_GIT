<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<td colspan="3">
			<font size="5">${newsVO.title}</font>
		</td>
	</tr>
	<tr>
		<td align="center" width="150">글번호 : ${newsVO.news_num}</td>
		<td align="center" width="150">관련분야 : ${newsVO.sort}</td>
		<td align="center" width="150">입력일시 :<br> ${newsVO.logtime}</td>
	</tr>
	<tr>
		<td colspan="3">
		${newsVO.content}
		</td>
	</tr>
</table>
<input type="button" value="목록" onclick="location.href='../news/newsListAll.do?pg=${pg}'">
<input type="button" value="글수정" onclick="location.href='../news/newsModifyForm.do?news_num=${newsVO.news_num }&pg=${pg }'">
<input type="button" value="글삭제" onclick="location.href='../news/newsDelete.do?news_num=${newsVO.news_num }&pg=${pg }'">
</body>
</html>