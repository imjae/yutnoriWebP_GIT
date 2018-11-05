<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div#imgboard_listPage, div#imgboard_writeBtn, div#imgboard_listForm, div#imgboard_paging {
		width: 950px;
		margin: auto;
		padding: 0;
		display: block;
		font-family: "-윤고딕320";
		font-size: 18px;
	}
	
	div#imgboard_listForm, div#imgboard_paging {
		border-bottom: 1px solid lightgray;
		padding-bottom: 5px;
	}
	
	div#imgboard_writeBtn {
		text-align: right;
		border-bottom: 0;
	}
	
	div#imgboard_listForm > ul {
		list-style: none;
		padding-left: 0;
	}
	
	div#img_search {
		padding-top: 5px;
		padding-bottom: 5px;
		border-bottom: 1px solid lightgray;
		text-align: right;
	}
	
	ul li#imgboard_list {
		float: center;
		display: inline-block;
		margin: 7px;
		padding: 0;
		width: 22.8%;
		height: 220px;
		border: 1px solid lightgray;
	}
	
	ul li img#img_shot {
		width: 100%;
		height: 100%;;
		margin: 0;
		padding: 0;
	}
	
	ul li p.img_info {
		font-size: 12px;
		width: 100%;
		line-height: 50%;
	}
	
	ul li p#img_img {
		height: 60%;
	}
	
	ul li p#img_listSubject {
		overflow: hidden;
		text-overflow: clip;
		font-size: 16px;
		font-weight: bold;
		line-height: 90%;
	}
	
	div#imgboard_paging {
		width: 950px;
		margin: auto;
		margin-bottom: 10px;
		text-align: center;
	}
	
	#subjectA:link {color: black; text-decoration: none;}
	#subjectA:visited {color: black; text-decoration: none;}
	#subjectA:archieve {color: black; text-decoration: none;}
	#subjectA:hover {color: orange; text-decoration: underline;}
	
	div#imgboard_paging a.paging {color: blue; text-decoration: none;}
	div#imgboard_paging a.currentPaging {color: red; text-decoration: underline;}
</style>
</head>
<body>
<div id="imgboard_listPage">
	<div style="width: 950px; border-bottom: 1px solid lightgray;">
		<h1>커뮤니티 &gt; 스크린샷 게시판</h1>
	</div>
	<div id="img_search">
		<form action="imgboard_list.do?" name="imgboard_searchForm" method="post">
			<select name="imgboard_searchType">
				<option value="imgboard_searchAll">전체</option>
				<option value="imgboard_writer">작성자</option>
				<option value="imgboard_subject">제목</option>
				<option value="imgboard_content">내용</option>
			</select>
			<input type="text" name="imgboard_keyword">
			<input type="submit" value="검색">
		</form>
	</div>
	<div id="imgboard_listForm">
		<ul>
			<c:forEach var="imgboardDTO" items="${imgboard_list}">
				<li id="imgboard_list" onclick="location.href='../imgboard/imgboard_view.do?imgboard_pg=${imgboard_pg}&imgboard_num=${imgboardDTO.imgboard_num}'">
					<p id="img_img"><img id="img_shot"src ="../storage/${imgboardDTO.imgboard_img}"></p>
					<p id="img_listSubject">${imgboardDTO.imgboard_subject}</p>
					<p class="img_info">${imgboardDTO.imgboard_writer}</p>
					<p class="img_info">조회 수 : <span>${imgboardDTO.imgboard_readCount}</span> / 덧글 : <span>덧글 수</span></p>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<div id="imgboard_paging">
	<c:if test="${img_startPg > 10}">
		<button onclick="location.href='../imgboard/imgboard_list.do?imgboard_pg=${img_startPg-1}'">&lt;</button>
	</c:if>
	<c:forEach begin="${img_startPg}" step="1" var="i" end="${img_endPg}">
		<c:if test="${imgboard_pg == i}">
			[<a class="currentPaging" href="../imgboard/imgboard_list.do?imgboard_pg=${i}">${i}</a>]
		</c:if>
		<c:if test="${imgboard_pg!=i}">
			[<a class="paging" href="../imgboard/imgboard_list.do?imgboard_pg=${i}">${i}</a>]
		</c:if>
	</c:forEach>
	<c:if test="${img_endPg < img_totalP}">
		<button onclick="location.href='../imgboard/imgboard_list.do?imgboard_pg=${img_endPg + 1}'">&gt;</button>
	</c:if>
</div>
<div id="imgboard_writeBtn">
	<c:if test="${session_id != null}">
		<input type="button" value="글 작성" onclick="location.href='../imgboard/imgboard_writeForm.do'">
	</c:if>
</div>
</body>
</html>