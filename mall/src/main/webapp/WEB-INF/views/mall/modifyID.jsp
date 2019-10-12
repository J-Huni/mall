<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>Food Wide</title>
<style>
input[type=text] {
	border: solid white;
}

.rolldown-list {
  text-align: left;
  padding: 0;
  margin: 0;
}

.rolldown-list li {
  padding: 1em;
  margin-bottom: .125em;
  display: block;
  list-style: none;
  text-transform: uppercase;
}

.rolldown-list li {
  visibility: hidden;
  animation: rolldown .7s 1;
  transform-origin: 50% 0;
  animation-fill-mode: forwards;
}

.rolldown-list li:nth-child(2n) {
  background-color: #FFDEA9;
  width: 20%;
}

.rolldown-list li:nth-child(2n+1) {
  background-color: #FFF0BB;
  width: 20%;
}

#myList {
  position: absolute;
  width: 50%; 
  left: 50%;
  margin-left: -33.7%;
  font-fa
}

#myList a {
	text-decoration:none;
	color:black;
}

@keyframes rolldown {
  0% {
    visibility: visible;
    transform: rotateX(180deg) perspective(500px);
  }
  70% {
    visibility: visible;
    transform: rotateX(-20deg);
  }
  100% {
    visibility: visible;
    transform: rotateX(0deg);
  }
}
</style>
<link rel="stylesheet" href="/resources/Nevi.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/resources/main.css" type="text/css" media="screen" />

</head>
<body style="font-family: fantasy;">
	<div>
		<a href="/"><img src="/resources/loginCss/images/p2.png"
			style="width: 10%; margin-top: 40px; margin-left: 12%"> </a>
		<fieldset id="search" style="margin-top: 5%; margin-left: 5%;">
			<input type="text" class="inp"> <a class="btn_search"
				href="/"><img class="btn_search" src="/resources/btn_search.PNG"></a>
			<!-- 		<button class="btn_search" type="submit"></button> -->
		</fieldset>
	</div>
	<div id="top">
		<ul
			style="height: 56px; margin-top: 20px; border-top: 1px solid #BDBDBD; border-bottom: 2px solid #A84E19">
			<li
				style="margin-left: 16%; border-right: 1px solid #BDBDBD; border-left: 1px solid #BDBDBD;">
				<a id="btnli" type="button">카테고리</a>
			</li>
			<li><a style="font-size: 12; padding-top: 20;">베스트</a></li>
			<li><a href="/mall/qna/list"
				style="border-right: 1px solid #BDBDBD; border-left: 1px solid #BDBDBD; margin-left: 600px">Q
					& A</a></li>
			<c:choose>
				<c:when test='${session == "yes" }'>
					<li><a href="/modifyID" style="padding-bottom: 0px; color: #A84E19;">
						${sessionScope.id}님</a></li>
					<li><a href="/logout"
						style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px"><img
							src="/resources/logout.PNG"></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/mall/login/login"
						style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px"><img
							src="/resources/login.PNG"></a></li>
					<li><a href="/mall/login/signup"
						style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;"><img
							src="/resources/signup.PNG" style="padding-top: 2px;"></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<div>
		<ul id="myList" style="display:none">
			<li><a href="/mall/category/japan">일본</a></li>
			<li><a href="/mall/category/china">중국</a></li>
			<li><a href="/mall/category/america">미국</a></li>
			<li><a href="/mall/category/eu">유럽</a></li>
		</ul>
	</div>
	<h2>개인정보 수정</h2>
	<hr>
	<div>
		<table>
			<tr>
				<td>아이디</td>
				<td>${modify.id}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${modify.name}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td></td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${modify.address}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${modify.pnum}</td>
			</tr>
		</table>
	</div>
</body>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	
	
	$('#myList li').each(function() {
		var delay = ($(this).index() / 4) + 's';
		$(this).css({
			webkitAnimationDelay : delay,
			mozAnimationDelay : delay,
			animationDelay : delay
		});
	});

	$('#btnli').click(function() {
		console.log($('.rolldown-list').attr('class'));
 		if($('#myList').attr('class')=='rolldown-list'){
			$('#myList').removeClass('rolldown-list');
			$('#myList').css('display','none');
		}else{
			$('#myList').addClass('rolldown-list');
			$('#myList').css('display','block');
		}
	});
</script>
</html>
