<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<style type="text/css">
	div#freeboard_viewForm {
		width: 950px;
		margin: auto;
		padding: 0;
	}
	
	div#freeboard_viewForm div.freeboard_viewForm {
		padding-top: 5px;
		padding-bottom: 10px;
		border-bottom: 1px solid lightgray;
	}
	
	div#freeboard_viewSubject, #freeboard_viewId,
		#freeboard_view_readCountNdate, #freeboard_viewContent {
		width: 950px;
	}
	
	
	div#freeboard_listBtn {
		width: 950px;
		float: left;
	}
</style>

<script type="text/javascript">
	$(function() {
		$("#free_del_btn").click(function() {
			if(confirm("등록된 게시물을 삭제하시겠습니까?")) {
				location.href="../freeboard/freeboard_delete.do?freeboard_num=${freeboardDTO.freeboard_num}";
			} else {
				history.back();
			}
		});
	});
</script>
</head>
<body>
<div id="freeboard_viewForm">
	<!-- 게시글 내용 출력 -->
	<div class="freeboard_viewForm" id="freeboard_title">
		<h3>&nbsp;자유 게시판</h3>
	</div>
	<div class="freeboard_viewForm" id="freeboard_viewSubject">
		${freeboardDTO.freeboard_subject}
	</div>
	<div class="freeboard_viewForm" id="freeboard_viewId">
		${freeboardDTO.freeboard_writer}
	</div>
	<div class="freeboard_viewForm" id="freeboard_view_hitNdate" style="text-align: right;">
		${freeboardDTO.freeboard_readCount}&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;${freeboardDTO.freeboard_date}&nbsp;&nbsp;
	</div>
	<div class="freeboard_viewForm" id="freeboard_viewContent">
		<pre>${freeboardDTO.freeboard_content}</pre>
	</div>
	<div class="freeboard_viewForm" id="freeboard_listBtn">
		<input type="button" value="목록" onclick="location.href='../freeboard/freeboard_list.do?freeboard_pg=1'">
		<c:if test="${freeboardDTO.freeboard_writer == sessionScope.id}">
			<input type="button" value="수정" onclick="location.href='../freeboard/freeboard_modifyForm.do?freeboard_num=${freeboardDTO.freeboard_num}&freeboard_pg=${freeboard_pg}'">
			<input type="button" value="삭제" id="free_del_btn">
		</c:if>
	</div>
	<!-- 게시글 내용 출력 -->
	
	<div id="free_commentInclude">
		<jsp:include page="../freeboard/freeboard_commentForm.jsp"/>
	</div>
</div>
</body>
</html>







