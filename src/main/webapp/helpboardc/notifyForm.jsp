<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<style type="text/css">
.table {
	width: 100%;
	border: none;
	border-collapse: separate;
	border-spacing: 2px;
}
.table th {
	padding: 15px;
	border: none;
	border-left: 5px solid #c03;
	border-bottom: 1px solid #ddd;
	background: #fcf0f3;
	font-weight: normal;
	text-align: center;
	text-shadow: 0 1px #fff;
	vertical-align: middle;
}
.table td {
	padding: 15px;
	border: none;
	border-bottom: 1px solid #ddd;
	text-align: left;
	vertical-align: baseline;
}
h1 {
	color: #c03;
}
#submit, #reset {
	border: 0;
	background-color: white;
}
</style>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.ckeditor.com/4.10.1/standard/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("#reset").click(function() {
			CKEDITOR.instances.editor.setData("");
		});
		
		
		$("#helpboardWriteForm").submit(function() {
			if ($("select[name='notify_sort'] > option:selected").index() < 1) {
				var i = $("select[name='sort'] > option:selected").index();
				alert("관련 분야를 선택해 주세요.");
				$("select[name='sort1']").focus();
				return false;
			}
			
			if (!$("input[name='title']").val()) {
				alert("제목을 입력해 주세요.");
				$("input[name='title']").focus();
				return false;
			}
			
			if (!$("input[name='title']").val()) {
				alert("제목을 입력해 주세요.");
				$("input[name='title']").focus();
				return false;
			}
			
			if (!$("textarea").val()) {
				alert("내용을 입력해 주세요.");
				$("textarea").focus();
				return false;
			}
		});	
	});
</script>
</head>
<body>
<form action="../helpboardc/helpboardNotify.do" method="post" id="helpboardNotifyForm">
	<table border="" class="table">
		<tr>
			<td colspan="2" align="center">
				<h1>신고/1:1 문의</h1>
				※ 아이디(이메일)로 답변이 회신됩니다.
			</td>
		</tr>
		<tr>
			<th width="100" align="center">구분</th>
			<td width="700">
				<select name="notify_sort">
					<option>----- 선택하세요 -----</option>
					<option value="user_insult">욕설/비매너 유저 신고</option>
					<option value="steal_name">명의/결제정보 도용 신고</option>
					<option value="cash_losensteal">게임머니 유실 신고</option>
					<option value="mantoman">1:1 문의(기타)</option>
				</select>
			</td>
		</tr>
		<tr>
			<th align="center">제목</th>
			<td>
				<input type="text" size="110" name="title">
			</td>
		</tr>
		<tr>
			<th align="center">내용</th>
			<td>
				<textarea rows="" cols="50" name="content" id="editor">내용을 입력하세요.</textarea>
				<script>
					CKEDITOR.replace('editor');
				</script>
				
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button id="submit"><img src="../etc/image/submit.png" id="submit"></button>
				<button type="reset" id="reset"><img src="../etc/image/reset.png"></button>
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>