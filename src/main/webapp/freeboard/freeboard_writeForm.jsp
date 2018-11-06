<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/4.10.1/standard/ckeditor.js"></script>
<style type="text/css">
	table#free_writeForm {
		width: 950px;
		margin: auto;
		padding: 0;
		font-family: "-윤고딕320";
		font-size:18px;
	}
</style>
</head>
<body>
<form action="freeboard_write.do" method="post" name="freeboard_writeForm">
	<div>
	<table id="free_writeForm">
		<tr>
			<td><h1>자유 게시판 > 글 쓰기</h1></td>
		</tr>
		<tr>
			<td>
				<label>제목</label>
				<input type="text" name="freeboard_subject" required="required" style="width: 90%;">
			</td>
		</tr>
		<tr>
			<td>
				<textarea name="freeboard_content" id="editor" style="resize: none;" required="required"></textarea>
				<script>
              		CKEDITOR.replace('editor');
            	</script>
			</td>
		</tr>
		<tr>
			<td align="right">
				<input type="submit" value="게시물 등록">
				<input type="button" value="게시판 목록" onclick="location.href='../freeboard/freeboard_list.do?freeboard_pg=1'">
			</td>
		</tr>
	</table>
	</div>
</form>
</body>
</html>