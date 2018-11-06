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
		padding: 0;
		margin: auto;
		font-family: "-윤고딕320";
		font-size:18px;
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
			<td class="imgStyle_btm"><h1>스크린샷 게시판 > 글 쓰기</h1></td>
		</tr>
		<tr>
			<td style="padding-top: 10px; padding-bottom: 5px;">
				<label style="font-weight: bold">제목&nbsp;</label>
				<input type="text" name="imgboard_subject" required="required" style="width: 600px;">
			</td>
		</tr>
		<tr>
			<td>
				<textarea rows="40" name="imgboard_content" style="resize: none; width: 99.2%" required="required"></textarea>
			</td>
		</tr>
		<tr>
			<td class="imgStyle_btm" style="padding-bottom: 5px;"><input type="file" name="imgboard_file"></td>
		</tr>
		<tr>
			<td align="right" style="padding-top: 10px;">
				<input type="submit" value="게시물 등록">
				<input type="button" value="게시판 목록" onclick="location.href='../imgboard/imgboard_list.do?imgboard_pg=1'">
			</td>
		</tr>
	</table>
	</div>
</form>
</body>
</html>