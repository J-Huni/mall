<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ page session="true"%>
<html>
<head>
<title>Food Wide</title>
<style>
</style>
<link rel="stylesheet" href="/resources/Nevi.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="/resources/main.css" type="text/css"
	media="screen" />
</head>
<body>
	<%@ include file="../thema.jsp"%>
	<div style="margin-left: 20%;">
		<h2 style="margin-bottom: 1%;">Q & A 수정</h2>
		<hr style="width: 65%; float: left; margin-right: 50%;">
		
		<form method="post" action="/mall/qna/update">
			<label>제목 : 
				<input type="text" name="c_title" value="${update.c_title}" style="width: 60%;"><p>
			</label>
			 	<input type="hidden" name="c_no" value="${update.c_no}">
			<label style="vertical-align: top;">내용 : </label>
				<textarea style="width:60%; height:50%" name="c_content">
				<c:out value="${update.c_content}"></c:out>
			</textarea>
			<button type="submit" style="float: right;margin-right: 36%;margin-top: 1%;">수정 완료</button>
		</form>	
	</div>
</body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
</script>
</html>
