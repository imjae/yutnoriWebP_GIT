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
	$("#search").click(function() {
		if ($("select[name='notify_sort'] > option:selected").index() == 0) {
			// alert($("select[name='notify_sort'] > option:selected").index());
			location.href = "../helpboard/notifyboardListAll.do?pg=1";
		} else {
			var notify_sort = $("select[name='notify_sort'] > option:selected").val();
			location.href = "../helpboard/notifyboardList.do?notify_sort=" + notify_sort;
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
	<br> ○ 구분 : 
	<select name="notify_sort">
		<option>----- 선택하세요 -----</option>
		<option value="user_insult">욕설/비매너 유저 신고</option>
		<option value="steal_name">명의/결제정보 도용</option>
		<option value="cash_losensteal">게임머니 유실 신고</option>
		<option value="mantoman">1:1 문의(기타)</option>
	</select>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button id="search">검색</button>
	<br><br>
	<table border="1">
		
		<tr align="center" bgcolor="yellow">
			<td width="70">글번호</td>
			<td width="70">회신여부</td>
			<td width="200">구분</td>
			<td width="300">제목</td>
		</tr>
		
		<!-- 내용 -->
		<c:forEach var="dto" items="${list }">
			<tr align="center" bgcolor="lightyellow">
				<td>${dto.notifyboard_num }</td>
				<td>${dto.respond }</td>
				<td>${dto.notify_sort}</td>
				<td><a href="../helpboard/notifyboardView.do?notifyboard_num=${dto.notifyboard_num }&pg=${nldto.pg}">${dto.title}</a></td>
			</tr> 
		</c:forEach>
		
		<!-- 페이징 처리 -->
		<c:if test="${sector == 'all'}">
		<tr align="center">
			<td colspan="4" align="center">
				<c:if test="${nldto.startPage > 3 }">
					[<a class="paging" href="../helpboard/notifyboardListAll.do?pg=${nldto.startPage - 1 }">이전</a>]
				</c:if>
					<c:forEach var="i" begin="${nldto.startPage }" end="${nldto.endPage }" step="1">
						<c:if test="${nldto.pg == i }">
							[<a class="currentPaging" href = "../helpboard/notifyboardListAll.do?pg=${i }">${i }</a>]
						</c:if>
						<c:if test="${nldto.pg != i }">
							[<a class="paging" href="../helpboard/notifyboardListAll.do?pg=${i }">${i }</a>]
						</c:if>
					</c:forEach>
				<c:if test="${nldto.endPage < nldto.totalP }">
					[<a class="paging" href="../helpboard/notifyboardListAll.do?pg=${nldto.endPage + 1 }">다음</a>]
				</c:if>
			</td>
		</tr>
		</c:if>
		
		<c:if test="${sector == 'sort'}">
		<tr align="center">
			<td colspan="4" align="center">
				<c:if test="${nldto.startPage > 3 }">
					[<a class="paging" href="../helpboard/notifyboardList.do?pg=${nldto.startPage - 1 }&notify_sort=${nldto.notify_sort}">이전</a>]
				</c:if>
					<c:forEach var="i" begin="${nldto.startPage }" end="${nldto.endPage }" step="1">
						<c:if test="${nldto.pg == i }">
							[<a class="currentPaging" href = "../helpboard/notifyboardList.do?pg=${i }&notify_sort=${nldto.notify_sort}">${i }</a>]
						</c:if>
						<c:if test="${nldto.pg != i }">
							[<a class="paging" href="../helpboard/notifyboardList.do?pg=${i }&notify_sort=${nldto.notify_sort}">${i }</a>]
						</c:if>
					</c:forEach>
				<c:if test="${nldto.endPage < nldto.totalP }">
					[<a class="paging" href="../helpboard/notifyboardList.do?pg=${nldto.endPage + 1 }&notify_sort=${nldto.notify_sort}">다음</a>]
				</c:if>
			</td>
		</tr>
		</c:if>
	</table>
	<a href="../helpboard/helpboardWriteForm.do">새글쓰기</a>
</body>
</html>