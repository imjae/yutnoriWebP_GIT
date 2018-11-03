<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			if ($("select[name='sort'] > option:selected").index() < 1) {
				var i = $("select[name='sort'] > option:selected").index();
				alert("관련 분야를 선택해 주세요.");
				$("select[name='sort']").focus();
				return false;
			} else {
				$("#listForm").submit();
			}
		});
	});
</script>
</head>
<body>
	<form action="../news/newsList.do" id="listForm">
	<br> ○ 관련분야 : 
	<select name="sort">
		<option>----- 선택하세요 -----</option>
		<option value="inform">공지</option>
		<option value="patch">점검</option>
		<option value="shop">샵</option>
	</select>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button id="search_sorts">검색</button>
	</form>
	<br><br>
	<table border="1">
		
		<tr align="center" bgcolor="yellow">
			<td width="70">글번호</td>
			<td width="200">관련 분야</td>
			<td width="300">제목</td>
		</tr>
		
		<!-- 내용 -->
		<c:forEach var="dto" items="${list }">
			<tr align="center" bgcolor="lightyellow">
				<td>${dto.news_num }</td>
				<td>${dto.sort}</td>
				<td><a href="../news/newsView.do?news_num=${dto.news_num }&pg=${newsdto.pg}">${dto.title}</a></td>
			</tr>
		</c:forEach>
		
		<!-- 페이징 처리 -->
		<c:if test="${sector == 'all'}">
		<tr align="center">
			<td colspan="3" align="center">
				<c:if test="${newsdto.startPage > 3 }">
					[<a class="paging" href="../news/newsListAll.do?pg=${newsdto.startPage - 1 }">이전</a>]
				</c:if>
					<c:forEach var="i" begin="${newsdto.startPage }" end="${newsdto.endPage }" step="1">
						<c:if test="${newsdto.pg == i }">
							[<a class="currentPaging" href = "../news/newsListAll.do?pg=${i }">${i }</a>]
						</c:if>
						<c:if test="${newsdto.pg != i }">
							[<a class="paging" href="../news/newsListAll.do?pg=${i }">${i }</a>]
						</c:if>
					</c:forEach>
				<c:if test="${newsdto.endPage < newsdto.totalP }">
					[<a class="paging" href="../news/newsListAll.do?pg=${newsdto.endPage + 1 }">다음</a>]
				</c:if>
			</td>
		</tr>
		</c:if>
		
		<c:if test="${sector == 'sort'}">
		<tr align="center">
			<td colspan="3" align="center">
				<c:if test="${newsdto.startPage > 3 }">
					[<a class="paging" href="../news/newsList.do?pg=${newsdto.startPage - 1 }&sort=${newsdto.sort }">이전</a>]
				</c:if>
					<c:forEach var="i" begin="${newsdto.startPage }" end="${newsdto.endPage }" step="1">
						<c:if test="${newsdto.pg == i }">
							[<a class="currentPaging" href = "../news/newsList.do?pg=${i }&sort=${newsdto.sort }">${i }</a>]
						</c:if>
						<c:if test="${newsdto.pg != i }">
							[<a class="paging" href="../news/newsList.do?pg=${i }&sort=${newsdto.sort }">${i }</a>]
						</c:if>
					</c:forEach>
				<c:if test="${newsdto.endPage < newsdto.totalP }">
					[<a class="paging" href="../news/newsList.do?pg=${newsdto.endPage + 1 }&sort=${newsdto.sort }">다음</a>]
				</c:if>
			</td>
		</tr>
		</c:if>
	</table>
	<br>
	<a href="../news/newsWriteForm.do">새글쓰기</a>
</body>
</html>