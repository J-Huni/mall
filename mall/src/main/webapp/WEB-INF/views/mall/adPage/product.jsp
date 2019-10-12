<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>Food Wide</title>
<style>
hr {
	height: 70%;
	float: left;
	width: 1px;
	margin-left: 3%;
}

.button-one {
	text-align: center;
	cursor: pointer;
	font-size: 19px;
	margin: 0 0 0 100px;
}

/*Button One*/
.button-one {
	padding: 10px 40px;
	outline: none;
	background-color: #27ae60;
	border: none;
	border-radius: 5px;
	box-shadow: 0 9px #95a5a6;
}

.button-one:hover {
	background-color: #2ecc71;
}

.button-one:active {
	background-color: #2ecc71;
	box-shadow: 0 5px #95a5a6;
	transform: translateY(4px);
}
</style>

</head>
<body>
	<%@ include file="../thema.jsp"%>
	<div style="float: left; margin-top: 3%">
		<div>
			<button class="button-one">회원 관리</button>
		</div>
		<div>
			<button class="button-one" style="margin-top: 10%">재고 관리</button>
		</div>
		<div>
			<button class="button-one" style="margin-top: 10%">판매 관리</button>
		</div>
	</div>
	<hr>
	<div style="width: 70%; float: right; margin-right: 5%;">
		<table style="text-align: center;">
			<tr>
				<td>상품 사진</td>
				<td>상품명</td>
				<td>가격</td>
				<td>재고</td>
				<td>카테고리</td>
			</tr>

			<c:forEach var="product" items="${product}">
				<tr>
					<td><img style="width:40%" src="/resources/picture/${product.p_picture}"></td>
					<td>${product.p_name}</td>
					<td>${product.p_price}</td>
					<td>${product.p_amount}</td>
					<td>${product.p_category}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	
</script>
</html>
