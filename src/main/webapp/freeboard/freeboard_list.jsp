<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<style type="text/css">
body#freeboard_list, table#freeboard_listForm {
	margin: auto;
	width: 950px;
	font-family: "-윤고딕320";
	font-size: 18px;
}

table#freeboard_listForm th, td {
	border-bottom: 1px solid lightgray;
	padding-top: 5px;
	padding-bottom: 10px;
}

table#freeboard_listForm tr td {
	padding-bottom: 5px;
}

div#freeboard_selectBox {
	float: right;
	/* border: 1px solid lightgray; */
}

#freeboard_listKind th {
	padding-bottom: 10px;
	padding-top: 5px;
}

#freeboard_listSeq, #freeboard_listHit {
	width: 7%;
}

#freeboard_listSubject {
	width: 58%;
}

#freeboard_listWriter, #freeboard_listDate {
	width: 14%;
}

.freeboard_listAlign {
	text-align: center;
}

#subjectA:link {
	color: black;
	text-decoration: none;
}

#subjectA:visited {
	color: black;
	text-decoration: none;
}

#subjectA:archieve {
	color: black;
	text-decoration: none;
}

#subjectA:hover {
	color: orange;
	text-decoration: underline;
}

.paging {
	color: blue;
	text-decoration: none;
}

.currentPaging {
	color: red;
	text-decoration: underline;
}

td#adim_td {
	color: black;
	font-size: 1.3em;
	font-weight: bold;
	background-color: yellow;
	font-family: "호국체 std";
}
</style>
</head>
<body id="freeboard_list">
	<table id="freeboard_listForm">
		<tr>
			<td colspan="5"><h1>커뮤니티 &gt; 자유 게시판</h1></td>
		</tr>
		<tr>
			<td colspan="5" align="right">


				<form action="freeboard_list.do?freeboard_pg=${freeboard_pg}"
					name="freeboard_searchForm" method="post">
					<select name="freeboard_searchType">
						<option value="freeboard_searchAll"
							<c:out value="${freeboard_searchType == 'freeboard_searchAll'?'selected':''}"/>>전체</option>
						<option value="freeboard_writer"
							<c:out value="${freeboard_searchType == 'freeboard_writer'?'selected':''}"/>>작성자</option>
						<option value="freeboard_subject"
							<c:out value="${freeboard_searchType == 'freeboard_subject'?'selected':''}"/>>제목</option>
						<option value="freeboard_content"
							<c:out value="${freeboard_searchType == 'freeboard_content'?'selected':''}"/>>내용</option>
					</select> <input type="text" name="freeboard_keyword"
						value="${freeboard_keyword}"> <input type="submit"
						value="검색">
				</form>
			</td>
		</tr>
		<tr id="freeboard_listKind">
			<th id="freeboard_listSeq">번호</th>
			<th id="freeboard_listSubject">제목</th>
			<th id="freeboard_listWriter">작성자</th>
			<th id="freeboard_listHit">조회 수</th>
			<th id="freeboard_listDate">작성일</th>
		</tr>
		<tbody id="freeboard_listOutput">
			<c:forEach var="freeboardDTO" items="${freeboard_list}">
				<tr>
					<td class="freeboard_listAlign">${freeboardDTO.freeboard_num}</td>
					<td><a id="subjectA"
						href="../freeboard/freeboard_view.do?freeboard_num=${freeboardDTO.freeboard_num}&freeboard_pg=${freeboard_pg}">
							${freeboardDTO.freeboard_subject} </a></td>
					<c:if
						test="${freeboardDTO.freeboard_writer == 'jakeim1111@gmail.com' }">
						<td class="freeboard_listAlign" id="adim_td">관 리 자</td>
					</c:if>
					<c:if
						test="${freeboardDTO.freeboard_writer != 'jakeim1111@gmail.com' }">
						<td class="freeboard_listAlign">
							${freeboardDTO.freeboard_writer}</td>
					</c:if>
					<td class="freeboard_listAlign">${freeboardDTO.freeboard_readCount}</td>
					<td class="freeboard_listAlign">${freeboardDTO.freeboard_date}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tr>
			<td colspan="5" align="center"><c:if
					test="${freeboard_keyword == null}">
					<c:if test="${free_startPg > 10}">
						<button
							onclick="location.href='../freeboard/freeboard_list.do?freeboard_pg=${free_startPg-1}'">&lt;</button>
					</c:if>
					<c:forEach begin="${free_startPg}" step="1" var="i"
						end="${free_endPg}">
						<c:if test="${freeboard_pg == i}">
						[<a class="currentPaging"
								href="../freeboard/freeboard_list.do?freeboard_pg=${i}">${i}</a>]
					</c:if>
						<c:if test="${freeboard_pg!=i}">
						[<a class="paging"
								href="../freeboard/freeboard_list.do?freeboard_pg=${i}">${i}</a>]
					</c:if>
					</c:forEach>
					<c:if test="${free_endPg < free_totalP}">
						<button
							onclick="location.href='../freeboard/freeboard_list.do?freeboard_pg=${free_endPg + 1}'">&gt;</button>
					</c:if>
				</c:if> <c:if test="${freeboard_keyword != null}">
					<c:if test="${free_startPg > 10}">
						<button
							onclick="location.href='../freeboard/freeboard_list.do?freeboard_pg=${free_startPg-1}&freeboard_searchType=${freeboard_searchType}&freeboard_keyword=${freeboard_keyword}'">&lt;</button>
					</c:if>
					<c:forEach begin="${free_startPg}" step="1" var="i"
						end="${free_endPg}">
						<c:if test="${freeboard_pg == i}">
						[<a class="currentPaging"
								href="../freeboard/freeboard_list.do?freeboard_pg=${i}&freeboard_searchType=${freeboard_searchType}&freeboard_keyword=${freeboard_keyword}">${i}</a>]
					</c:if>
						<c:if test="${freeboard_pg!=i}">
						[<a class="paging"
								href="../freeboard/freeboard_list.do?freeboard_pg=${i}&freeboard_searchType=${freeboard_searchType}&freeboard_keyword=${freeboard_keyword}">${i}</a>]
					</c:if>
					</c:forEach>
					<c:if test="${free_endPg < free_totalP}">
						<button
							onclick="location.href='../freeboard/freeboard_list.do?freeboard_pg=${free_endPg + 1}&freeboard_searchType=${freeboard_searchType}&freeboard_keyword=${freeboard_keyword}'">&gt;</button>
					</c:if>
				</c:if></td>
		</tr>
		<tr>
			<td colspan="5" align="right" style="border-bottom: 0;"><c:if
					test="${session_id != null}">
					<input type="button" value="새 글 작성"
						onclick="location.href='../freeboard/freeboard_writeForm.do'">
				</c:if></td>
		</tr>
	</table>
</body>
</html>