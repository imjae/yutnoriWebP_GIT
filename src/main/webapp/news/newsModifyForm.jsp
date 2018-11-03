<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.10.1/standard/ckeditor.js"></script>
<script type="text/javascript">
$(function() {
	$("#mform").submit(function() {
		
		if (!$("input[name='title']").val()) {
			alert("제목을 입력해 주세요.");
			$("input[name='title']").focus();
			return false;
		}
	});
	
});
</script>

</head>
<body>
<form action="../news/newsModify.do" method="post" id="mform">
	<input type="hidden" name="news_num" value="${newsVO.news_num }">
	<input type="hidden" name="pg" value="${pg }">
	<h1>도움말 게시글 등록</h1>
	<table border="">
		<tr>
			<td width="100" align="center">관련 분야</td>
			<td width="700">
				${newsVO.sort }
			</td>
		</tr>
		<tr>
			<td align="center">제목</td>
			<td>
				<input type="text" size="110" name="title" value="${newsVO.title }">
			</td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td>
				<textarea rows="" cols="50" name="content" id="editor">${newsVO.content }</textarea>
				<script>
					CKEDITOR.replace('editor');
				</script>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button id="submit">등록</button>
				<button type="reset">다시 작성</button>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="../news/newsListAll.do?pg=1">전체 목록 보기</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>