<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.paging {color: blue; text-decoration: none;}
.currentPaging {color: red; text-decoration: underline;}
#subjectA:link {color: black; text-decoration: none;}
#subjectA:visited {color: black; text-decoration: none;}
#subjectA:achive {color: black; text-decoration: none;}
#subjectA:hover {color: red; text-decoration: underline;}
</style>
</head>
<body>
	<br><br>
	<table border="1">
		
		<tr align="center" bgcolor="yellow">
			<td width="70">글번호</td>
			<td width="200">제목</td>
			<td width="300">부제목</td>
		</tr>
		
		<!-- 내용 -->
		<c:forEach var="dto" items="${list }">
			<tr align="center" bgcolor="lightyellow">
				<td>${dto.e_num }</td>
				<td><a href="../event/eventView.do?e_num=${dto.e_num }&pg=${pg}&sector=${sector}">${dto.title}</a></td>
				<td>${dto.sub_title}</td>
			</tr>
		</c:forEach>
		
		<!-- 페이징 처리 -->
		<c:if test="${sector == 'on'}">
		<tr align="center">
			<td colspan="3" align="center">
				<c:if test="${startPage > 3 }">
					[<a class="paging" href="../event/eventListOn.do?pg=${startPage - 1 }">이전</a>]
				</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
						<c:if test="${pg == i }">
							[<a class="currentPaging" href = "../event/eventListOn.do?pg=${i }">${i }</a>]
						</c:if>
						<c:if test="${pg != i }">
							[<a class="paging" href="../event/eventListOn.do?pg=${i }">${i }</a>]
						</c:if>
					</c:forEach>
				<c:if test="${endPage < totalP }">
					[<a class="paging" href="../event/eventListOn.do?pg=${endPage + 1 }">다음</a>]
				</c:if>
			</td>
		</tr>
		</c:if>
		
		<c:if test="${sector == 'off'}">
		<tr align="center">
			<td colspan="3" align="center">
				<c:if test="${startPage > 3 }">
					[<a class="paging" href="../event/eventListOff.do?pg=${startPage - 1 }">이전</a>]
				</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
						<c:if test="${pg == i }">
							[<a class="currentPaging" href = "../event/eventListOff.do?pg=${i }">${i }</a>]
						</c:if>
						<c:if test="${pg != i }">
							[<a class="paging" href="../event/eventListOff.do?pg=${i }">${i }</a>]
						</c:if>
					</c:forEach>
				<c:if test="${endPage < totalP }">
					[<a class="paging" href="../event/eventListOff.do?pg=${endPage + 1 }">다음</a>]
				</c:if>
			</td>
		</tr>
		</c:if>
	</table>
	<br>
	<a href="../event/eventWriteForm.do">새 이벤트 등록</a>
</body>
</html>