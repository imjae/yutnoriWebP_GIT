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
	div#imgboard_viewForm {
		width: 950px;
		margin: auto;
		padding: 0;
		font-family: "-윤고딕320";
		font-size:18px;
	}
	
	div#imgboard_viewForm div.imgboard_viewDetail {
		padding-top: 5px;
		padding-bottom: 10px;
		border-bottom: 1px solid lightgray;
	}
	
	div#imgboard_viewSubject, #imgboard_viewId,
		#imgboard_view_readCountNdate, #imgboard_viewContent {
		width: 950px;
	}
	
	div#imgboard_commentInput {
		padding-top: 5px;
		width: 950px;
		margin: auto;
	}
	
	div#imgboard_listBtn {
		width: 950px;
		float: left;
	}
	
	ul#imgboard_commentView {
		line-height: 130%;
		list-style: none;
		padding-left: 0;
		padding-top: 90px;
	}
	
	li {
		width: 950px;
		padding-bottom: 10px;
		border-bottom: 1px solid lightgray;
	}
	
	.imgboard_commentWriter {
		font-weight: bold;
	}
</style>

<script type="text/javascript">
 	$(function() {
 		$("#img_del_btn").click(function() {
			if(confirm("등록된 게시물을 삭제하시겠습니까?")) {
				location.href="../imgboard/imgboard_delete.do?imgboard_num=${imgboardDTO.imgboard_num}";
			} else {
				history.back();
			}
		});
 		
 		$("#imgboard_commentForm").submit(function() {
			if(!$("#imgboard_comment").val()) {
				alert("내용을 입력하세요.");
				$("#imgboard_comment").focus();
				return false;
			}
			
			// 작성일 생성
			var date = new Date();
			var yy = date.getFullYear();
			var mm = date.getMonth() + 1;
			var dd = date.getDate();
			var hh = date.getHours();
			var min = date.getMinutes();
			var sec = date.getSeconds();
			
			// 자릿수 보정
			if(mm < 10) mm = "0" + mm;
			if(dd < 10) dd = "0" + dd;
			if(hh < 10) hh = "0" + hh;
			if(min < 10) min = "0" + min;
			if(sec < 10) sec = "0" + sec;
			
			// 금일의 날짜 값 생성
			var today = yy + "-" + mm + "-" + dd + " " + hh + ":" + min + ":" + sec;
			
			// 새로운 글이 추가될 li 태그 객체
			var new_li = $("<li>", );
			new_li.addClass("imgboard_commentItem");
			
			// 작성자의 정보가 저장될 <p> 태그
			var writer_p = $("<p>");
			writer_p.addClass("free_commentInfo");
			
			// 작성자 정보의 이름
			var id_span = $("<span>");
			id_span.addClass("imgboard_commentWriter");
			id_span.html("@&nbsp;" + $("${sessionScope.imgboard_writer}").val());
			
			// 작성일
			var date_span = $("<span>");
			date_span.html(" / " + today + " ");
			
			// 덧글 삭제 버튼
			var del_input = $("<input>");
			del_input.attr({
				"type" : "button", "value" : "덧글 삭제"
			});
			del_input.addClass("free_delComment");
			
			// 내용
			var content_p = $("<p>");
			content_p.html($("#imgboard_comment").val());
			
			// 조립
			writer_p.append(id_span).append(date_span).append(del_input);
			new_li.append(writer_p).append(content_p);
			$("#imgboard_commentView").append(new_li);
			
			// 입력 내용 지우기
			$("#imgboard_comment").val("");
			return false;
		});
		
		// 삭제 버튼 클릭시 동작을 미리 지정
		$(document).on("click", ".free_delComment", function() {
			if(confirm("등록하신 덧글을 삭제하시겠습니까?")) {
				$(this).parents(".imgboard_commentItem").remove();
			}
		});
	});
</script>
</head>
<body>
<div id="imgboard_viewForm">
	<!-- 게시글 내용 출력 -->
	<div class="imgboard_viewDetail" id="imgboard_title">
		<h1>스크린샷 게시판 &gt; 글 상세 보기</h1>
	</div>
	<div class="imgboard_viewDetail" id="imgboard_viewSubject">
		<h3>${imgboardDTO.imgboard_subject}</h3>
	</div>
	<div class="imgboard_viewDetail" id="imgboard_viewId">
		${imgboardDTO.imgboard_writer}
	</div>
	<div class="imgboard_viewDetail" id="imgboard_view_hitNdate" style="text-align: right;">
		${imgboardDTO.imgboard_readCount}&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;${imgboardDTO.imgboard_date}&nbsp;&nbsp;
	</div>
	<div class="imgboard_viewDetail" id="imgboard_viewContent">
		<p><img src="../storage/${imgboardDTO.imgboard_img}" width="60%" height="60%"></p>
		<pre>${imgboardDTO.imgboard_content}</pre>
	</div>
	<div class="imgboard_viewDetail" id="imgboard_listBtn">
		<input type="button" value="목록" onclick="location.href='imgboard_list.do?imgboard_pg=1'">
		
		<c:if test="${imgboardDTO.imgboard_writer == session_id}">
			<input type="button" value="수정" onclick="location.href='../imgboard/imgboard_modifyForm.do?imgboard_num=${imgboardDTO.imgboard_num}&imgboard_pg=${imgboard_pg}'">
			<input type="button" value="삭제" id="img_del_btn">
		</c:if>
	</div>
	<!-- 게시글 내용 출력 -->
	
	<!-- 덧글 입력 폼 -->
	<div id="imgboard_commentInput">
		<form action="../imgboard/imgboard_view.do?imgboard_pg=${imgboard_pg}&imgboard_num=${imgboardDTO.imgboard_num}" method="post" id="imgboard_commentForm" name="imgboard_commentForm">
			<textarea id="imgboard_comment" name="imgboard_comment" style="resize: none; float: left; width: 84.4%; height: 68px;"></textarea>
			<input type="submit" value="덧글 등록" style="float: left; width: 14.7%; height:74px;">
		</form>
	</div>
	<!-- 덧글 입력 폼 -->
	
	<!-- 덧글이 등록 되면 덧글 리스트 출력 / 전달된 내용 값이 없으면 덧글 리스트 div 제외 -->
	<%-- <c:if test=""> --%>
		<ul id="imgboard_commentView">
		</ul>
	<%-- </c:if> --%>
	
</div>
</body>
</html>