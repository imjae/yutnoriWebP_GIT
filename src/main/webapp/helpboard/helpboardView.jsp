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
			<font size="5">${helpboardVO.title}</font>
		</td>
	</tr>
	<tr>
		<td align="center" width="150">글번호 : ${helpboardVO.helpboard_num}</td>
		<td align="center" width="150">관련분야 : ${helpboardVO.sort1}</td>
		<td align="center" width="150">세부사항 : ${helpboardVO.sort2}</td>
	</tr>
	<tr>
		<td colspan="3">
		${helpboardVO.content}
		</td>
	</tr>
</table>
<input type="button" value="목록" onclick="location.href='../helpboard/helpboardListAllAdmin.do?pg=${pg}'">
<input type="button" value="글수정" onclick="location.href='../helpboard/helpboardModifyForm.do?helpboard_num=${helpboardVO.helpboard_num }&pg=${pg }'">
<input type="button" value="글삭제" onclick="location.href='../helpboard/helpboardDelete.do?helpboard_num=${helpboardVO.helpboard_num }&pg=${pg }'">
</body>
</html>