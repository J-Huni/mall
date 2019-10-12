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
#amountUD {
 	text-align:center;
}

#amountUD img{
	width: 10%;
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
	<h2>구매자 정보</h2>
	<hr>
		<table>
			<tr>
				<td>구매자 이름</td>
				<td><input type="text" id="b_name"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="b_address"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" id="b_pnum"></td>
			</tr>
		</table>
	</div>
	<div>
		<h2 style="margin-top:5%;">상품 정보</h2>
		<hr>
		<table>
			<tr>
				<td style="width:10%"><img src="/resources/picture/${order.p_picture}"></td>
				<td><h2>${order.p_name}</h2></td>
				<td id="amountUD">
				<a href="#" id="decrease"><img src="/resources/minus.png" id="decrease"></a>
				<input readonly type="text" id="b_amount" value="${b_amount}" style="width:30px; padding-top: 10px;font-size: 25;">
				<a href="#" id="increase"><img src="/resources/plus.png"></a></td>
				<td><input readonly style="font-size: 25;font-weight: bold;width: 170px;" 
				type="text" value="${order.p_price}" id="totprice"></td>
			</tr>
		</table>
	</div>
	<input type="hidden" id="formamount" value="">
	<input type="hidden" id="formprice" value="">
	<input type="hidden" id="p_no" value="${order.p_no}">
	<input type="hidden" id="s_id" value="${sessionScope.id}">
	<button id="orderResult">구매 결정</button>
</body>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	var total = $("#b_amount").val() * $("#totprice").val();
	var f_amount = $("#b_amount").val()
	$("#totprice").val(total);
	$("#formprice").val(total);
	$("#formamount").val(f_amount);

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
		var amount = $("#b_amount").val();
		amount = (Number(amount)+1);
		var tot = ${order.p_price} * amount;
		
		$("#b_amount").val(amount);
		$("#formamount").val(amount);
		$("#totprice").val(tot);
		$("#formprice").val(tot);
	});
	
	$("#decrease").click(function() {
		var amount = $("#b_amount").val();
		amount = (Number(amount)-1);
		if(amount >= 1){
			var tot = ${order.p_price} * amount;
			$("#b_amount").val(amount);
			$("#formamount").val(amount);
			$("#totprice").val(tot);
			$("#formprice").val(tot);
		}
	});
	
 
	$("#orderResult").click(function() {
		var b_totprice = $("#formprice").val();
		var id = $("#s_id").val();
		var b_amount = $("#formamount").val();
		var p_no = $("#p_no").val();
		var b_address = $("#b_address").val();
		var b_name = $("#b_name").val();
		var b_pnum = $("#b_pnum").val();
		
		if(!$("#b_address").val() || !$("#b_name") || !$("#b_pnum")){
			alert("구매자 정보를 입력해주세요.");
/* 			location.reload(); */
			}
		else{
			var data= {
					"b_totprice" : b_totprice,
					"id" : id,
					"b_amount" : b_amount,
 					"p_no" : p_no,
					"b_address" : b_address,
					"b_name" : b_name,
					"b_pnum" : b_pnum
			};
			
			console.log(data);
			$.ajax ({
				type : "post",
				url : "/mall/order/order",
				data : data,
				success:function(){
					location.href="/";
				},
				error:function(){
					alert("구매 실패");
				}
			});
		}
	});
</script>
</html>
