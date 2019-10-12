<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

#detailimg img {
	width:130%;
	border: 1px solid #bdbdbd;
}

#detailimg {
	margin-top:5%;
	margin-left:10%;
	margin-right:9%;
	float:left;
	width:20%;
}

#detailmenu {
	float: left;	
	margin-left:1%;
}

#detailmenu img{
	width:5%;
}

#detailslt{
    float: left;
    margin-left:1%;
}
/* 
#detailmenu button{
	margin-top: 5%;
    width: 100px;
    float: right;
} */
.diagonal {
  margin-top:7%;
  position: relative;
  line-height: 50px;
  background: #67809F;
  color: white;
  border: none;
  font-weight: bold;
  font-family: 'Open Sans', sans-serif;
  overflow: hidden;
  z-index: 1;
  padding: 0px;
  width: 550px;
}
.diagonal:after {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 500%;
  height: 1000%;
  background: #34495E;
  z-index: -1;
  transform-origin: 0% 0%;
  transform: translateX(calc(20% - 25px)) translateY(10%) rotate(-45deg);
  /transform: translateY(10%) translateX(16%) rotate(-45deg);
  transition: transform .3s;
}
.diagonal:hover::after {
  transform: translateY(10%) translateX(-25px) rotate(-45deg);
}
  
</style>
<link rel="stylesheet" href="/resources/Nevi.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="/resources/main.css" type="text/css"
	media="screen" />
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
	<div>
		<div id= "detailimg">
			<img src="/resources/picture/${read.p_picture}">
		</div>
		<div>
			<hr style="background:black;width: 44%;float: left;margin-left: 1%;margin-top: 5%;">
		</div>
		<div id= "detailmenu">
			<h1 style="margin-top:0px;width: 570px;">${read.p_name}</h1>
			<h2 style="margin-left:5px"><fmt:formatNumber value="${read.p_price}" pattern="###,###,###" /> 원</h2>
			<table style="width: 550px;">
				<tr><td>수량</td></tr>
				<tr>
					<td>
						<a href="#" id="decrease"><img src="/resources/minus.png" id="decrease"></a>
						<input readonly type="text" id="amount" value="1" style="width:30px; padding-top: 10px;font-size: 25;">
						<input type="hidden" value="${read.p_no}">
						<a href="#" id="increase"><img src="/resources/plus.png"></a>
						<input id="price" type="text" style="display:none" data-price="${read.p_price}">
						<h2 id="total" style="float: right;margin-top: 10px;">${read.p_price}</h2>
					</td>
				</tr>
			</table>
			 <form method="get" action="/mall/order/order">
			 		<input name="p_no" type="hidden" value="${read.p_no}">
			 		<input name="b_amount" id="amountForm" type="hidden" value="1">
					<button id="buybtn" type="submit" class="diagonal">구매</button>
				<div>
				</div>	
			</form>
		</div>
	</div>
</body>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	var total=$("#total")[0].innerText;
	
	$("#total")[0].innerText=Number(total).toLocaleString()+"원";
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
	
	$("#increase").click(function() {
		var amount = $("#amount").val();
		var price=$("#price")[0].dataset.price;
		amount = (Number(amount)+1);
		$("#amount").val(amount);
		$("#amountForm").val(amount);
		$("#total")[0].innerText=(Number(price)*amount).toLocaleString()+"원";
	})
	
	$("#decrease").click(function() {
		var amount = $("#amount").val();
		var price = $("#price")[0].dataset.price;
		amount = (Number(amount)-1);
		if(amount >= 0){
			$("#amount").val(amount);
			$("#amountForm").val(amount);
			$("#total")[0].innerText=(Number(price)*amount).toLocaleString()+"원";
		}
	})

	$("#buybtn").click(function(){
		if("${session}" != "yes"){
			alert("로그인이 필요합니다.");
			location.href="/mall/login/login";
		}
	})

/*
$("#buyProduct").click(function() {
	var b_totprice = $("#total")[0].innerText;
	var id = $("#idval").val();
	var amount = $("#amount").val();
	var p_no = $("#p_no").val();
	
	if("${session}" != "yes"){
		alert("로그인이 필요합니다.");
		location.href="/mall/login/login";
	}
	
	else{
		var data= {
				"b_totprice" : b_totprice,
				"id" : id,
				"b_amount" : amount,
				"p_no" : p_no
		};
		
		$.ajax ({
			type : "post",
			url : "/mall/category/order",
			data : data,
			success:function(){
				location.href="/mall/order/order";
			},
			error:function(){
				alert("구매 실패");
			}
		});
	}
}); */

</script>
</html>