<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table#img_modifyTable {
		width: 950px;
		padding: 0;
		margin: auto;
		font-family: "-윤고딕320";
		font-size: 18px;
	}
	
	table tr td.imgStyle_btm {
		border-bottom: 1px solid lightgray;
	}
</style>
</head>
<body>
<form action="../imgboard/imgboard_modify.do?imgboard_num=${imgboardDTO.imgboard_num}&imgboard_pg=${imgboard_pg}" method="post" name="imgboard_modifyForm" enctype="multipart/form-data">
	<div id="img_modifyForm">
		<table id="img_modifyTable">
			<tr>
				<td class="imgStyle_btm"><h1>스크린샷 게시판 > 게시글 수정</h1></td>
			</tr>
			<tr>
				<td>
					<label>제목</label>
					<input type="text" name="imgboard_subject" value="${imgboardDTO.imgboard_subject}" required="required" style="width: 600px;">
				</td>
			</tr>
			<tr>
				<td>
					<textarea rows="30" name="imgboard_content" style="resize: none; width: 99.3%;" required="required">${imgboardDTO.imgboard_content}</textarea>
				</td>
			</tr>
			<tr>
				<td class="imgStyle_btm" style="padding-bottom: 5px;"><input type="file" name="imgboard_img"></td>
			</tr>
			<tr>
				<td align="right" style="padding-top: 5px;">
					<input type="submit" value="게시물 등록">
					<input type="button" value="게시판 목록" onclick="location.href='../imgboard/imgboard_list.do?imgboard_pg=1'">
				</td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>