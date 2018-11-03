<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../etc/css/helpBody.css" />
<script type="text/javascript" src="../etc/js/helpBody.js"></script>
<!-- 페이징 처리 -->
<style type="text/css">
.paging {
	color: blue;
	text-decoration: none;
}

.currentPaging {
	color: red;
	text-decoration: underline;
}

#subjectA:link {
	color: black;
	text-decoration: none;
}

#subjectA:visited {
	color: black;
	text-decoration: none;
}

#subjectA:achive {
	color: black;
	text-decoration: none;
}

#subjectA:hover {
	color: red;
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="helpBody">
		<!-- <div class="faqHeader">
			<button type="button" class="showAll">답변 모두 여닫기</button>
		</div> -->

		<c:set var="id" value="0"></c:set>

		<!-- boardVO list가 전달됨 -->
		<ul class="faqBody">
			<c:if test="${list != null }">
				<c:forEach var="i" items="${list }">
					<c:set var="id" value="${id + 1}"></c:set>
					<li class="article" id="${id}">
						<p class="q">
							<a href="${id }" class="q_title">${i.title }</a>
						</p>
						<div class="a">${i.content }</div>
					</li>
				</c:forEach>
			</c:if>
			
			<c:if test="${list == null }">
				<p align="center">내용을 선택하세요</p>
			</c:if>

		</ul>

		<div align="center">
			<c:if test="${hldto.startPage > 3 }">
					[<a class="paging"
					href="../helpboardc/helpboardListAll.do?pg=${hldto.startPage - 1 }&sort1=${hldto.sort1}&sort2=${hldto.sort2}">이전</a>]
				</c:if>
			<c:forEach var="i" begin="${hldto.startPage }"
				end="${hldto.endPage }" step="1">
				<c:if test="${hldto.pg == i }">
							[<a class="currentPaging"
						href="../helpboardc/helpboardListAll.do?pg=${i }&sort1=${hldto.sort1}&sort2=${hldto.sort2}">${i }</a>]
						</c:if>
				<c:if test="${hldto.pg != i }">
							[<a class="paging"
						href="../helpboardc/helpboardListAll.do?pg=${i }&sort1=${hldto.sort1}&sort2=${hldto.sort2}">${i }</a>]
						</c:if>
			</c:forEach>
			<c:if test="${hldto.endPage < hldto.totalP }">
					[<a class="paging"
					href="../helpboardc/helpboardListAll.do?pg=${hldto.endPage + 1 }&sort1=${hldto.sort1}&sort2=${hldto.sort2}">다음</a>]
				</c:if>
		</div>
	</div>
</body>
</html>