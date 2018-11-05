<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div#freeboard_commentInput {
		padding-top: 5px;
		width: 950px;
		margin: auto;
	}
	ul#freeboard_commentView {
		line-height: 130%;
		list-style: none;
		padding-left: 0;
		padding-top: 90px;
	}
	
	li#freeboard_commentItem {
		width: 950px;
		padding-bottom: 10px;
		border-bottom: 1px solid lightgray;
	}
	
	#freeboard_commentWriter {
		font-weight: bold;
	}
</style>
<script type="text/javascript" src="etc/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#freeboard_commentForm").submit(function() {
			if(!$("#freeboard_comment").val()) {
				alert("내용을 입력하세요.");
				$("#freeboard_comment").focus();
				return false;
			}
			
			$.ajax({
				url: "../freeboard/freeboard_commentJson.do",
				type: "post",
				data: {"freeboard_num": "${freeboardDTO.freeboard_num}"},
				dataType: "json",
				success: function(data) {
					$.each(data.items, function(index, item) {
						// 결과를 출력하기 위한 동적 요소 생성
						var li = $("<li>", {id: "freeboard_commentItem"});
						var writer_p = $("<p>", {id: "free_commentInfo"});
						var id_span = $("<span>", {id: "freeboard_commentWriter"}).html(item.free_comment_writer);
						var date_span = $("<span>").html(" / " + item.free_comment_date + " ");
						var del_input = $("<input>", {
							id: "free_delComment",
							type: "button",
							value: "덧글 삭제",
							click: function() {
								if(confirm("등록하신 덧글을 삭제하시겠습니까?")) {
									$(this).parents("#freeboard_commentItem").remove();
								}
							}
						});
						var content_p = $("<p>").html(item.free_comment_content);
						
						writer_p.append(id_span).append(date_span).append(del_input);
						new_li.append(writer_p).append(content_p);
						$("#freeboard_commentView").append(new_li);
	
						$("#freeboard_comment").val("");
						return false;
					});
				},
				error: function(xhr, textStatus, errorThrown) {
					$("div").html("<div>" + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>");
				}
			});
		});
	});
</script>
</head>
<body>
<!-- 덧글 입력 폼 -->
<div id="freeboard_commentInput">
	<form action="" method="post" id="freeboard_commentForm" name="freeboard_commentForm">
		<textarea id="freeboard_comment" name="freeboard_comment" style="resize: none; float: left; width: 84.4%; height: 68px;"></textarea>
		<input type="submit" value="덧글 등록" style="float: left; width: 14.7%; height:74px;">
	</form>
</div>
<!-- 덧글 입력 폼 -->

<!-- 덧글이 등록 되면 덧글 리스트 출력 / 전달된 내용 값이 없으면 덧글 리스트 div 제외 -->
<%-- <c:if test="${free_comment}"> --%>
	<ul id="freeboard_commentView"></ul>
<%-- </c:if> --%>
</body>
</html>