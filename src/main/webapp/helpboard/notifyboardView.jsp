<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
<table border="1">
	<tr>
		<td colspan="3">
			<font size="5">${notifyboardVO.title}</font>
		</td>
	</tr>
	<tr>
		<td align="center" width="150">글번호 : ${notifyboardVO.notifyboard_num}</td>
		<td align="center" width="250">구   분 : ${notifyboardVO.notify_sort}</td>
		<td align="center" width="250">이메일 : ${notifyboardVO.reporter_id}</td>
	</tr>
	<tr>
		<td colspan="3">
		${notifyboardVO.content}
		</td>
	</tr>
</table>
<input type="button" value="목록" onclick="location.href='../helpboard/notifyboardListAll.do?pg=${pg}'">
<input type="button" value="회신 보내기" onclick="location.href='../helpboard/mailForm.do?tomail=${notifyboardVO.reporter_id }&notifyboard_num=${notifyboardVO.notifyboard_num }'">
</body>
</html>