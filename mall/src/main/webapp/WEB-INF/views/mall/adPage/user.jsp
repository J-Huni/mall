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
	<div style="width: 70%; float: right; margin-right: 5%;margin-top: 2%;">
		<table style="text-align: center;">
			<tr style="background: grey;">
				<td>id</td>
				<td>이름</td>
				<td>email</td>
				<td>주소</td>
				<td>전화번호</td>
			</tr>

			<c:forEach var="user" items="${user}">
				<tr>
					<td>${user.id}</td>
					<td>${user.name}</td>
					<td>${user.email}</td>
					<td>${user.address}</td>
					<td>${user.pnum}</td>
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
