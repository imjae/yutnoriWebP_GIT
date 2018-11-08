<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.paging {
	color: black;
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
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../etc/css/cnewsCenter.css" />
<!-- <script type="text/javascript" src="../etc/js/helpBody.js"></script> -->
</head>
<body>

	<ul class="faqBody">
		<c:if test="${list != null }">
			<c:forEach var="i" items="${list }">
				<li class="article" id="${id}">
					<div class="q">
						
							<c:if test="${i.sort == 'inform' }">
							<div id="sort_notice">
								공지
							</div>
							<a href="../news/newsMainView.do?&news_num=${i.news_num}" id="q_title_notice">${i.title }</a>
							<div id="date_notic">
							${i.logtime }
							</div>
							</c:if>
							
							<c:if test="${i.sort == 'patch' }">
							<div id="sort_jumgum">
								점검
							</div>
							<a href="../news/newsMainView.do?&news_num=${i.news_num}" id="q_title_jumgum">${i.title }</a>
							<div id="date_jumgum">
							${i.logtime }
							</div>
							</c:if>
							
							<c:if test="${i.sort == 'shop' }">
							<div id="sort_shop">
								샵
							</div>
							<a href="../news/newsMainView.do?&news_num=${i.news_num}" id="q_title_shop">${i.title }</a>
							<div id="date_shop">
							${i.logtime }
							</div>
							</c:if>
						
						
						
					</div>
				</li>
			</c:forEach>
		</c:if>

		<c:if test="${list == null }">
			<p align="center">내용을 선택하세요</p>
		</c:if>
	</ul>
	
	<div align="center" class="paging">
		<br>
		<br>
		<c:if test="${newsdto.startPage > 3 }">
					[<a class="paging"
				href="../news/newsMainAll.do?pg=${newsdto.startPage - 1 }&sort=${newsdto.sort}">이전</a>]
				</c:if>
		<c:forEach var="i" begin="${newsdto.startPage }" end="${newsdto.endPage }" step="1">
			<c:if test="${newsdto.pg == i }">
							[<a class="currentPaging"
					href="../news/newsMainAll.do?pg=${i }&sort=${newsdto.sort}">${i }</a>]
						</c:if>
			<c:if test="${newsdto.pg != i }">
							[<a class="paging"
					href="../news/newsMainAll.do?pg=${i }&sort=${newsdto.sort}">${i }</a>]
						</c:if>
		</c:forEach>
		<c:if test="${newsdto.endPage < newsdto.totalP }">
					[<a class="paging"
				href="../news/newsMainAll.do?pg=${newsdto.endPage + 1 }&sort=${newsdto.sort}">다음</a>]
				</c:if>
	</div>
</body>
</html>