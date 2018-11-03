<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	window.onload = function() {
		if (${su > 0}) {
			alert("등록 완료");
		} else {
			alert("등록 실패!!!!!!!!!!");
		}
		location.href = "../news/newsWriteForm.do";
	}
</script>
</body>
</html>