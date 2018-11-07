<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div#total {
	height: 875px;
}
.paging {
	color: black;
	text-decoration: none;
	/* border: 1px solid red; */
	height: 35px;
	line-height: 35px;
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
.object {
	margin-top: 10px;
	margin-bottom: 10px;
	height: 145px;
	/* border: 1px solid orange; */
}
.img {
	float: left;
	height: 145px;
	width: 400px;
	/* border: 1px solid red; */
	margin-right: 30px;
}

.text {
	/* border: 1px solid green;  */
	height: 145px;
}

.e_title {
/* 	margin-top: 20px; */
	padding-top: 10px;
	margin-bottom: 10px;
	/* border: 1px solid red; */
}

.e_title a {
	color: black;
	font-size: 2.2em;
}

.e_title a:link {
	text-decoration: none;
}

.e_title a:hover {
	text-decoration: underline;
}
.e_sub_title {
	/* border: 1px solid yellow; */
	margin: 0px;
	height: 61px;
}

.e_sub_title a {
	color: gray;
	font-size: 1.2em;
}

.e_sub_title a:link {
	text-decoration: none;
}

.e_sub_title a:hover {
	text-decoration: underline;
}
.period {
	/* border: 1px solid blue; */
	margin: 0px;
	color: gray;
}
</style>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div id="total">
		<c:if test="${list != null }">
			<c:forEach var="i" items="${list }">
				<div class="object">
					<div class="img">
						<a href="#"><img alt="" src="../etc/image/eventThumbnail/${i.e_img }" style="height: 100%; width: 100%;"></a>
					</div>
					<div class="text">
						<div class="e_title"><a href="#">${i.title }</a></div>
						<div class="e_sub_title"><a href="#">${i.sub_title }</a></div>
						<div class="period">${i.s_date } ~ ${i.e_date }</div>
					</div>
				</div>
				<hr style="border: 0.5px dashed orange">
			</c:forEach>
		</c:if>
	
		<c:if test="${list == null }">
			<p align="center">내용을 선택하세요</p>
		</c:if>
		
		
		<c:if test="${sector == 'on' }">
			<div align="center" class="paging">
				<c:if test="${startPage > 3 }">
							[<a class="paging"
						href="../event/eventMainOn.do?pg=${startPage - 1 }">이전</a>]
						</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
					<c:if test="${pg == i }">
									[<a class="currentPaging" href="../event/eventMainOn.do?pg=${i }">${i }</a>]
								</c:if>
					<c:if test="${pg != i }">
									[<a class="paging" href="../event/eventMainOn.do?pg=${i }">${i }</a>]
								</c:if>
				</c:forEach>
				<c:if test="${endPage < totalP }">
							[<a class="paging" href="../event/eventMainOn.do?pg=${endPage + 1 }">다음</a>]
				</c:if>
			</div>
		</c:if>
		
		<c:if test="${sector == 'off' }">
			<div align="center" class="paging">
				<c:if test="${startPage > 3 }">
							[<a class="paging"
						href="../event/eventMainOff.do?pg=${startPage - 1 }">이전</a>]
						</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
					<c:if test="${pg == i }">
									[<a class="currentPaging" href="../event/eventMainOff.do?pg=${i }">${i }</a>]
								</c:if>
					<c:if test="${pg != i }">
									[<a class="paging" href="../event/eventMainOff.do?pg=${i }">${i }</a>]
								</c:if>
				</c:forEach>
				<c:if test="${endPage < totalP }">
							[<a class="paging" href="../event/eventMainOff.do?pg=${endPage + 1 }">다음</a>]
				</c:if>
			</div>
		</c:if>
	</div>
</body>
</html>