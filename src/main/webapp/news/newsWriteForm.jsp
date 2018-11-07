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
		
		$("#reset").click(function() {
			CKEDITOR.instances.editor.setData("");
		});
		
		$("#newsWriteForm").submit(function() {
			if ($("select[name='sort'] > option:selected").index() < 1) {
				alert("관련 분야를 선택해 주세요.");
				$("select[name='sort']").focus();
				return false;
			}
			
			if (!$("input[name='title']").val()) {
				alert("제목을 입력해 주세요.");
				$("input[name='title']").focus();
				return false;
			}
			
			if (!$("#editor").val()) {
				alert("내용을 입력해 주세요.");
				$("#editor").focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
<form action="../news/newsWrite.do" method="post" id="newsWriteForm">
	<h1>공지사항(새소식) 입력창</h1>
	<table border="">
		<tr>
			<td width="100" align="center">관련 분야</td>
			<td width="1000">
				<select name="sort">
					<option>----- 선택하세요 -----</option>
					<option value="inform">공지</option>
					<option value="patch">점검</option>
					<option value="shop">샵</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="center">제목</td>
			<td>
				<input type="text" size="110" name="title">
			</td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td>
				<textarea rows="" cols="50" name="content" id="editor">내용을 입력하세요</textarea>
				<script>
					CKEDITOR.replace('editor');
				</script>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button id="submit">등록</button>
				<button type="reset" id="reset">다시 작성</button>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="../news/newsListAll.do?pg=1">새소식 전체 목록 보기</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>