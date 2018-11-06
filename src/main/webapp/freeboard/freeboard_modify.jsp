<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(${num > 0}) {
		location.href="../freeboard/freeboard_view.do?freeboard_pg=${freeboard_pg}&freeboard_num=${freeboardDTO.freeboard_num}";
	}
</script>
</head>
<body>

</body>
</html>