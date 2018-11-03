<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 보내기</title>
<script type="text/javascript" src="../etc/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<h4>메일 보내기</h4>
  <form action="../mail/mailSending.do" method="post">
  	<input type="hidden" name="notifyboard_num" value="${notifyboard_num }">
    <div align="center"><!-- 받는 사람 이메일 -->
      <input type="email" name="tomail" size="120" style="width:100%" class="form-control" value="${tomail }">
    </div>     
    <div align="center"><!-- 제목 -->
      <input type="text" name="title" size="120" style="width:100%" placeholder="제목을 입력해주세요" class="form-control" >
    </div>
    <p>
    <div align="center"><!-- 내용 --> 
      <textarea name="content" cols="120" rows="12" style="width:100%; resize:none" placeholder="내용#" class="form-control"></textarea>
    </div>
    <p>
    <div align="center">
      <input type="submit" value="메일 보내기" class="btn btn-warning">
    </div>
  </form>
</body>
</html>