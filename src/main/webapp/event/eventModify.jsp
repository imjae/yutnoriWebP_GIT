<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		if (${su > 0}) {
			alert("등록 완료");
		} else {
			alert("등록 실패!!!!!!!!!!");
		}
		
		if (${sector == 'on'}) {
			location.href = "../event/eventListOn.do?pg=${pg}";
		} else if (${sector == 'off'}) {
			location.href = "../event/eventListOff.do?pg=${pg}";
		}
	}
</script>
</head>
<body>

</body>
</html>