<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도움말 게시글 등록(관리자)</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.10.1/standard/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		$("#helpboardWriteForm").submit(function() {
			if ($("select[name='sort1'] > option:selected").index() < 1) {
				var i = $("select[name='sort1'] > option:selected").index();
				alert("관련 분야를 선택해 주세요.");
				$("select[name='sort1']").focus();
				return false;
			} 
			
			if ($("select[name='sort2'] > option:selected").index() < 1) {
				alert("세부 사항을 선택해 주세요.");
				$("select[name='sort2']").focus();
				return false;
			}
		});
		
	});
</script>
</head>
<body>
<form action="../helpboard/helpboardModify.do" method="post" id="helpboardModifyForm">
	<input type="hidden" name="helpboard_num" value="${helpboardVO.helpboard_num }">
	<input type="hidden" name="pg" value="${pg }">
	<h1>도움말 게시글 등록</h1>
	<table border="">
		<tr>
			<td width="100" align="center">관련 분야</td>
			<td width="700">
				${helpboardVO.sort1 }
			</td>
		</tr>
		<tr>
			<td align="center">세부 사항</td>
			<td>
				${helpboardVO.sort2 }
			</td>
		</tr>
		<tr>
			<td align="center">제목</td>
			<td>
				<input type="text" size="110" name="title" value="${helpboardVO.title }">
			</td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td>
				<textarea rows="" cols="50" name="content" id="editor">${helpboardVO.content }</textarea>
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
				<a href="../helpboard/helpboardListAll.do?pg=1">전체 목록 보기</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>