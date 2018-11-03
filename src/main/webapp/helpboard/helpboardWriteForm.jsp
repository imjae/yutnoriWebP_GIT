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
		
		$("select[name='sort1']").change(function() {
			if ($("select[name='sort1'] > option:selected").index() == 1) {
				
				$("select[name='sort2']").empty();
				
				var option0_g = $("<option>");
				var option1_g = $("<option value='installnaccess'>");
				var option2_g = $("<option value='home_error'>");
				
				option0_g.html("---- 선택하세요 ----");
				option1_g.html("설치 / 접속 오류");
				option2_g.html("홈페이지 오류");
				
				$("select[name='sort2']").append(option0_g).append(option1_g).append(option2_g);
				
			} else if ($("select[name='sort1'] > option:selected").index() == 2) {
				
				$("select[name='sort2']").empty();
				
				var option0_i = $("<option>");
				var option1_i = $("<option value='innout'>");
				var option2_i = $("<option value='search-idnpwd'>");
				
				option0_i.html("---- 선택하세요 ----");
				option1_i.html("가입 / 탈퇴");
				option2_i.html("아이디/비밀번호 찾기");
				
				$("select[name='sort2']").append(option0_i).append(option1_i).append(option2_i);
				
			} else if ($("select[name='sort1'] > option:selected").index() == 3) {
				
				$("select[name='sort2']").empty();
				
				var option0_c = $("<option>");
				var option1_c = $("<option value='charge'>");
				var option2_c = $("<option value='refund'>");
				var option3_c = $("<option value='item_buyngift'>");
				
				option0_c.html("---- 선택하세요 ----");
				option1_c.html("캐시 충전");
				option2_c.html("캐시 환불");
				option3_c.html("아이템 구매/선물");
				
				$("select[name='sort2']").append(option0_c).append(option1_c).append(option2_c).append(option3_c);
			}
		});
	});
</script>
</head>
<body>
<form action="../helpboard/helpboardWrite.do" method="post" id="helpboardWriteForm">
	<h1>도움말 게시글 등록</h1>
	<table border="">
		<tr>
			<td width="100" align="center">관련 분야</td>
			<td width="1000">
				<select name="sort1">
					<option>----- 선택하세요 -----</option>
					<option value="game">게임 관련</option>
					<option value="id">아이디 관련</option>
					<option value="cash">캐시(결제) 관련</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="center">세부 사항</td>
			<td>
				<select name="sort2">
					<option>----- 선택하세요 -----</option>
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
				<button type="reset">다시 작성</button>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="../helpboard/helpboardListAllAdmin.do?pg=1">FAQ 전체 목록 보기</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="../helpboard/notifyboardListAll.do?pg=1">신고 게시판 전체 목록 보기</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>