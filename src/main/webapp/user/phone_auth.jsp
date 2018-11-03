<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">




</script>

</head>
<body>
	<form method="post" id="smsForm" action="sendSMS.do">
		<ul>
			<li>보낼사람 : <input type="text" name="from" /></li>
			<li>내용 : <textarea name="text"></textarea></li>
			<li><input type="submit" value="전송하기" /></li>
		</ul>
	</form>
</body>
</html>