<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<td colspan="3" align="center">
			<font size="5">${eventVO.title}</font>
		</td>
	</tr>
	<tr>
		<td colspan="3" align="center">
			<font size="5">${eventVO.sub_title}</font>
		</td>
	</tr>
	<tr>
		<td align="center" width="150">e_num : ${eventVO.e_num}</td>
		<td align="center" width="150">시작일 : <br> ${eventVO.s_date}</td>
		<td align="center" width="150">종료일 : <br> ${eventVO.e_date}</td>
	</tr>
	<tr>
		<td colspan="3" align="center">
			<img alt="" src="../etc/image/eventThumbnail/${eventVO.e_img }">
		</td>
	</tr>
</table>
<c:if test="${sector == 'on' }">
	<input type="button" value="목록" onclick="location.href='../event/eventListOn.do?pg=${pg}'">
</c:if>
<c:if test="${sector == 'off' }">
	<input type="button" value="목록" onclick="location.href='../event/eventListOff.do?pg=${pg}'">
</c:if>

<input type="button" value="글수정" onclick="location.href='../event/eventModifyForm.do?e_num=${e_num }&pg=${pg }&sector=${sector }'">
<input type="button" value="글삭제" onclick="location.href='../event/eventDelete.do?e_num=${e_num }&pg=${pg }&sector=${sector }'">
</body>
</html>