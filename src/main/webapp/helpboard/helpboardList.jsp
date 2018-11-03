<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
.paging {color: blue; text-decoration: none;}
.currentPaging {color: red; text-decoration: underline;}
#subjectA:link {color: black; text-decoration: none;}
#subjectA:visited {color: black; text-decoration: none;}
#subjectA:achive {color: black; text-decoration: none;}
#subjectA:hover {color: red; text-decoration: underline;}
</style>

<script type="text/javascript">
 $(function() {
	$("#search_sorts").click(function() {
		if ($("select[name='sort1'] > option:selected").index() < 1) {
			var i = $("select[name='sort1'] > option:selected").index();
			alert("관련 분야를 선택해 주세요.");
			$("select[name='sort1']").focus();
			return false;
		} else if ($("select[name='sort2'] > option:selected").index() < 1) {
			alert("세부 사항을 선택해 주세요.");
			$("select[name='sort2']").focus();
			return false;
		} else {
			$("#listForm").submit();
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

<!-- 
<script type="text/javascript">
	function isLoginView(seq) {
		if (${memId == null}) {
			alert("먼저 로그인 하세요.");
		} else {
			location.href = "../helpboard/helpboardView.do?seq="+seq+"&pg=${pg}";
		}
	}
	
	function isLoginWrite() {
		if (${memId == null}) {
			alert("먼저 로그인 하세요.");
		} else {
			location.href = "../helpboard/helpboardWriteForm.do";
		}
	}
</script>

 -->
 
</head>
<body>
	<form action="../helpboard/helpboardListAdmin.do" id="listForm">
	<br> ○ 관련분야 : 
	<select name="sort1">
		<option>----- 선택하세요 -----</option>
		<option value="game">게임 관련</option>
		<option value="id">아이디 관련</option>
		<option value="cash">캐시(결제) 관련</option>
	</select>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;○ 세부사항 : 
	<select name="sort2">
		<option>----- 선택하세요 -----</option>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button id="search_sorts">검색</button>
	</form>
	<br><br>
	<table border="1">
		
		<tr align="center" bgcolor="yellow">
			<td width="70">글번호</td>
			<td width="200">관련 분야</td>
			<td width="150">세부 사항</td>
			<td width="300">제목</td>
		</tr>
		
		<!-- 내용 -->
		<c:forEach var="dto" items="${list }">
			<tr align="center" bgcolor="lightyellow">
				<td>${dto.helpboard_num }</td>
				<td>${dto.sort1}</td>
				<td>${dto.sort2}</td>
				<td><a href="../helpboard/helpboardView.do?helpboard_num=${dto.helpboard_num }&pg=${hldto.pg}">${dto.title}</a></td>
			</tr>
		</c:forEach>
		
		<!-- 페이징 처리 -->
		<c:if test="${sector == 'all'}">
		<tr align="center">
			<td colspan="4" align="center">
				<c:if test="${hldto.startPage > 3 }">
					[<a class="paging" href="../helpboard/helpboardListAllAdmin.do?pg=${hldto.startPage - 1 }">이전</a>]
				</c:if>
					<c:forEach var="i" begin="${hldto.startPage }" end="${hldto.endPage }" step="1">
						<c:if test="${hldto.pg == i }">
							[<a class="currentPaging" href = "../helpboard/helpboardListAllAdmin.do?pg=${i }">${i }</a>]
						</c:if>
						<c:if test="${hldto.pg != i }">
							[<a class="paging" href="../helpboard/helpboardListAllAdmin.do?pg=${i }">${i }</a>]
						</c:if>
					</c:forEach>
				<c:if test="${hldto.endPage < hldto.totalP }">
					[<a class="paging" href="../helpboard/helpboardListAllAdmin.do?pg=${hldto.endPage + 1 }">다음</a>]
				</c:if>
			</td>
		</tr>
		</c:if>
		
		<c:if test="${sector == 'sort'}">
		<tr align="center">
			<td colspan="4" align="center">
				<c:if test="${hldto.startPage > 3 }">
					[<a class="paging" href="../helpboard/helpboardListAdmin.do?pg=${hldto.startPage - 1 }&sort1=${hldto.sort1 }&sort2=${hldto.sort2}">이전</a>]
				</c:if>
					<c:forEach var="i" begin="${hldto.startPage }" end="${hldto.endPage }" step="1">
						<c:if test="${hldto.pg == i }">
							[<a class="currentPaging" href = "../helpboard/helpboardListAdmin.do?pg=${i }&sort1=${hldto.sort1 }&sort2=${hldto.sort2}">${i }</a>]
						</c:if>
						<c:if test="${hldto.pg != i }">
							[<a class="paging" href="../helpboard/helpboardListAdmin.do?pg=${i }&sort1=${hldto.sort1 }&sort2=${hldto.sort2}">${i }</a>]
						</c:if>
					</c:forEach>
				<c:if test="${hldto.endPage < hldto.totalP }">
					[<a class="paging" href="../helpboard/helpboardListAdmin.do?pg=${hldto.endPage + 1 }&sort1=${hldto.sort1 }&sort2=${hldto.sort2}">다음</a>]
				</c:if>
			</td>
		</tr>
		</c:if>
	</table>
	<br>
	<a href="../helpboard/helpboardWriteForm.do">새글쓰기</a>
</body>
</html>