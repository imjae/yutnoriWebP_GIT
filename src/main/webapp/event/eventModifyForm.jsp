<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		
			$("#eventForm").submit(function() {
				if (!$("input[name='e_img']").val()) {
					alert("썸네일 이미지를 입력해 주세요");
					$("input[name='e_img']").focus();
					return false;
				}
				
				if (!$("input[name='title']").val()) {
					alert("제목을 입력해 주세요");
					$("input[name='title']").focus();
					return false;
				}
				
				if (!$("input[name='sub_title']").val()) {
					alert("부제목을 입력해 주세요");
					$("input[name='sub_title']").focus();
					return false;
				}
				
				if (!$("input[name='s_date']").val()) {
					alert("시작일을 입력해 주세요");
					$("input[name='s_date']").focus();
					return false;
				}
				
				if (!$("input[name='e_date']").val()) {
					alert("종료일을 입력해 주세요");
					$("input[name='e_date']").focus();
					return false;
				}
			});
	});
</script>
</head>
<body>
<form action="../event/eventModify.do" method="post" id="eventForm">
	<input type="hidden" name="e_num" value="${eventVO.e_num }">
	<input type="hidden" name="pg" value="${pg }">
	<input type="hidden" name="sector" value="${sector }">
	<h1>이벤트 입력창</h1>
	<table border="">
		<tr>
			<td width="100" align="center">썸네일 이미지</td>
			<td width="700">
				<input type="text" value="${eventVO.e_img }" name="e_img" size="110">
			</td>
		</tr>
		<tr>
			<td align="center">제목</td>
			<td>
				<input type="text" size="110" name="title" value="${eventVO.title }" >
			</td>
		</tr>
		<tr>
			<td align="center">부제목</td>
			<td>
				<input type="text" size="110" name="sub_title" value="${eventVO.sub_title }" >
			</td>
		</tr>
		<tr>
			<td align="center">시작일</td>
			<td>
				<input type="text" size="110" name="s_date" value="${eventVO.s_date }" >
			</td>
		</tr>
		<tr>
			<td align="center">종료일</td>
			<td>
				<input type="text" size="110" name="e_date" value="${eventVO.e_date }" >
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
				<a href="../event/eventListOn.do?pg=1">진행중인 이벤트 목록 보기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="../event/eventListOff.do?pg=1">종료된 이벤트 목록 보기</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>