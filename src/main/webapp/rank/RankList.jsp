<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Roboto+Condensed');

.preserve-3d {
    transform-style: preserve-3d;
    -webkit-transform-style: preserve-3d;
}

body {
    padding: 0;
    margin: 0;
    border: 0;
    overflow-x: none;
    background-color: #ffffff;
    font-smooth: always;
    -webkit-font-smoothing: antialiased;
    
}
.back {
    width: 15%;
    height: 160px;
    float: left;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    counter-increment: bc;
    padding: 0px 5px 5px 5px;
}



@media screen and (max-width: 1260px) {
    .back {
        width: 50%;
    }
}

@media screen and (max-width: 840px) {
    .back {
        width: 100%;
    }
}

.button_base {
    margin: 0;
    border: 0;
    border-color: #BDBDBD;
    font-size: 18px;
    position: relative;
    top: 50%;
    left: 50%;
    margin-top: -60px;
    margin-left: -70px;
    width: 150px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
    border-radius: 2px;
   
    
}

.button_base:hover {
    cursor: pointer;
}

/* ### ### ### 03 */
.b03_skewed_slide_in {
    overflow: hidden;
    border: #BDBDBD solid 1px;
}

.b03_skewed_slide_in div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 50px;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    padding: 10px;
}

.b03_skewed_slide_in div:nth-child(1) {
    color: #424242;
    background-color: #ffffff;
}

.b03_skewed_slide_in div:nth-child(2) {
    background-color: #FA8258;
    width: 230px;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: translate(-250px, 0px) skewX(-30deg);
    -webkit-transform: translate(-250px, 0px) skewX(-30deg);
    -moz-transform: translate(-250px, 0px) skewX(-30deg);
}

.b03_skewed_slide_in div:nth-child(3) {
    color: #ffffff;
    left: -200px;
    transition: left 0.2s ease;
    -webkit-transition: left 0.2s ease;
    -moz-transition: left 0.2s ease;
}

.b03_skewed_slide_in:hover div:nth-child(2) {
    transition: all 0.5s ease;
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    transform: translate(-15px, 0px) skewX(-30deg);
    -webkit-transform: translate(-15px, 0px) skewX(-30deg);
    -moz-transform: translate(-15px, 0px) skewX(-30deg);
}

.b03_skewed_slide_in:hover div:nth-child(3) {
    left: 0px;
    transition: left 0.30000000000000004s ease;
    -webkit-transition: left 0.30000000000000004s ease;
    -moz-transition: left 0.30000000000000004s ease;
}
.line{border: 2px solid LightGray;}
 
div#ranking_title {
	 
}

A:link {text-decoration:none; color:#646464;}
A:visited {text-decoration:none; color:#646464;}
input[type=submit] { 
  display: inline-block;
  padding: 4px 8px;
  font-size: 14px;
  cursor: pointer;
  text-align: center;   
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #424242;
  border: 0;
  border-radius: 4px;
  box-shadow: 0 2px #999;
  margin-top: -200px; 
  
}
input[type=text] {
	padding: 1px 1px;
	border-radius: 2px;
}  
select {
	width: 70px;
	height: 20px;
	color:#999;
	border:2px solid #ddd;
	background: url('../etc/image/rankImage/ico_selectArrow.png') no-repeat right -4px center;
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none; 
	border-radius: 2px;
	
}
select::-ms-expand{
    display: none;
}

 
div#total_rank_title {
	width: 1000px;
	height: 90px;
	border-bottom: 2px solid #BDBDBD;
	font-weight: 600;
	font: #424242;
	font-family: "-윤고딕330";
}

div#rank_paging {
	border-top: 1px solid lightgray;
	margin: auto;
	padding: 0;
	float: center;
	margin-top: 15px;
	padding-top: 10px;
	width: 97%;
	text-align: center;
}

tr#absad {
	width: 300px;
	height: 50px;
	border-bottom: 1px solid black;
}
img#rank_mini_img {
	width: 70px;
	hight: 65px;
}

</style>
<script type="text/javascript">
function checkRankList() {
	if(RankList.keyword.value == "") {
		alert("내용을 입력하세요.")
		RankList.keyword.focus();
		return false;
	}
	else return true;
}
</script>
</head>
<body>

<form action="../rank/RankList.do?pgg=1" name="RankList" method="post" onsubmit="return checkRankList()">
<table border="0" cellpadding="5" align="center" id="park"> 
	<tr color="">
		<td colspan="5"><div id="total_rank_title"><FONT SIZE=6>전적 랭킹</FONT></div></td>
	</tr>
	<tr>
		<td colspan="5">
			<div class="back">
    <div class="button_base b03_skewed_slide_in">
        <div>전적 랭킹</div>
        <div></div>
        <div onclick="location.href='../rank/yutnoriiiRankList.do?pg=1'">전적 랭킹</div>
   	
   	</div>
</div>
	<div class="back">
    <div class="button_base b03_skewed_slide_in">
        <div>골드보유 랭킹</div>
        <div></div>
        <div onclick="location.href='../rank/MoneyRankList.do?pg=1'">골드보유 랭킹</div>
    </div>
</div>
		</td>
	</tr>
	<tr>
	
		<td colspan="5" align="right">
			<select name="searchOption">
				<option value="user_name">닉네임</option>
				<option value="user_tear">티어</option>
			</select>
			<input type="text" name="keyword">
			<input type="submit" value="검색">
		</td>
	</tr>
	<br>
	<tr>
	<td width="100" class="line" align="center" style="background-color:#424242; color:#FAFAFA">순위</td>	
		<td width="150" class="line" align="center" style="background-color:#424242; color:#FAFAFA">티어</td>
		<td width="300" class="line" align="center" style="background-color:#424242; color:#FAFAFA">이름</td>
		<td width="200" class="line" align="center" style="background-color:#424242; color:#FAFAFA">보유금액</td>
		<td width="150" class="line" align="center" style="background-color:#424242; color:#FAFAFA">전적</td>
	</tr>
<c:forEach var="dto" items="${listAll}">
	<tr id="absad" align="center">
		<td>${dto.rank}</td>
		<td>${dto.tear}</td>
		<td><img id="rank_mini_img" src="../etc/image/itemImage/characterImage/${dto.equ_character}.png"/> ${dto.name}</td>
		<td>${dto.money}</td>
		<td>${dto.win}승${dto.lose}패</td>
	</tr>
	
</c:forEach>	

</table>
</form>
<div id="rank_paging">
	<c:if test="${startPagee > 3}">
			[<a id="paging" href="RankList.do?pgg=${startPagee - 1}&keyword=${keyword}&searchOption=${searchOption}">이전</a>]
		</c:if>		
		
		<c:forEach var="z" begin="${startPagee}" end="${endPagee}" step="1">
			<c:if test="${pgg == z}">
				[<a id="currentPaging" href="RankList.do?pgg=${z}&keyword=${keyword}&searchOption=${searchOption}">${z}</a>]
			</c:if>
			<c:if test="${pgg != z}">
				[<a id="paging" href="RankList.do?pgg=${z}&keyword=${keyword}&searchOption=${searchOption}">${z}</a>]
			</c:if>		
		</c:forEach>
		
		<c:if test="${endPagee < totalPP}">
			[<a id="paging" href="RankList.do?pgg=${endPagee + 1}&keyword=${keyword}&searchOption=${searchOption}">다음</a>]			
		</c:if>
</div>
</body>
</html>




