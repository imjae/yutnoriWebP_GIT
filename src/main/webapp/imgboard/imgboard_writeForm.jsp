<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table#img_writeForm {
		width: 950px;
	}
	
	table tr td.imgStyle_btm {
		border-bottom: 1px solid lightgray;
	}
</style>
</head>
<body>
<form action="../imgboard/imgboard_write.do" method="post" name="imgboard_writeForm" enctype="multipart/form-data">
	<div>
	<table id="img_writeForm">
		<tr>
			<td class="imgStyle_btm"><h3>스크린샷 게시판 > 글 쓰기</h3></td>
		</tr>
		<tr>
			<td>
				<label>제목</label>
				<input type="text" name="imgboard_subject" required="required" style="width: 602px;">
			</td>
		</tr>
		<tr>
			<td>
				<textarea rows="20" cols="96" name="imgboard_content" style="resize: none;" required="required"></textarea>
			</td>
		</tr>
		<tr>
			<td class="imgStyle_btm"><input type="file" name="imgboard_file"></td>
		</tr>
		<tr>
			<td align="right">
				<input type="submit" value="게시물 등록">
				<input type="button" value="게시판 목록" onclick="location.href='../imgboard/imgboard_list.do?imgboard_pg=1'">
			</td>
		</tr>
	</table>
	</div>
</form>
</body>
</html>