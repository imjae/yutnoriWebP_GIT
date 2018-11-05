<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/4.10.1/standard/ckeditor.js">
	CKEDITOR.editorConfig = function(config) {
		config.language = 'ko';
		config.font_names = '맑은 고딕; 돋움; 바탕; 돋음; 궁서; Nanum Gothic Coding; Quattrocento Sans;'
							+ CKEDITOR.config.font_names; 
	};
</script>
<style type="text/css">
	table {
		width: 950px;
	}
</style>
</head>
<body>
<form action="../freeboard/freeboard_modify.do?freeboard_num=${freeboardDTO.freeboard_num}&freeboard_pg=${freeboard_pg}" method="post" name="freeboard_modifyForm">
	<div id="modify_test">
	<table>
		<tr>
			<td><h3>자유 게시판 &gt; 게시 글 수정</h3></td>
		</tr>
		<tr>
			<td>
				<label>제목</label>
				<input type="text" name="freeboard_subject" required="required" value="${freeboardDTO.freeboard_subject}" style="width: 602px;">
			</td>
		</tr>
		<tr>
			<td>
				<textarea rows="20" cols="60" name="freeboard_content" id="editor" style="resize: none;" required="required">${freeboardDTO.freeboard_content}</textarea>
				<script>
              		CKEDITOR.replace('editor');
            	</script>
			</td>
		</tr>
		<tr>
			<td align="right">
				<input type="submit" value="게시물 수정">
				<input type="button" value="게시판 목록" onclick="location.href='../freeboard/freeboard_list.do?freeboard_pg=1'">
			</td>
		</tr>
	</table>
	</div>
</form>
</body>
</html>