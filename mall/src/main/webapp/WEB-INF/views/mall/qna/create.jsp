<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>FoodWide</title>
<style>
</style>
</head>
<link rel="stylesheet" href="/resources/Nevi.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="/resources/main.css" type="text/css"
	media="screen" />
<body>
	<%@ include file="../thema.jsp" %>
	<h2 style="margin-left: 17%;">Q & A 글 작성</h2>
	<hr style="width:70%">
	<div style="margin-left:20%">
		<form action="/mall/qna/create" method="POST">
			<div>
				<label>제목</label> <input type="text" name="c_title" style="width: 67%; border: solid 1px">
			</div>
			<input type="hidden" name="c_writer" value="${sessionScope.id}">
			<div style="margin-top:1%">
				<label>내용</label>
				<textarea style="width: 67%;height: 20%;" name="c_content"></textarea>
			</div>
			<div>
				<button type="submit" style="float: right;margin-right: 30%;">작성하기</button>
			</div>
		</form>
	</div>
</body>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
</script>
</html>