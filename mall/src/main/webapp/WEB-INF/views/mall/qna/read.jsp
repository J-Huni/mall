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
</head>
<body>
	<%@ include file="../thema.jsp"%>
	<div style="margin-top: 20; margin-left: 200;">
		<div>
			<div>
				<h2>Q & A</h2>
				<hr style="width: 70%; float: left; margin-right: 50%">
			</div>
			<c:choose>
				<c:when test='${sessionScope.id == read.c_writer}'>
					<div style="float: right; margin-right: 30%;">
						<form method="post" action="/mall/qna/delete">
							<input type="hidden" name="c_no" value="${read.c_no}">
							<button type="submit" style="margin-left: 10px">삭제</button>
						</form>
					</div>
					<div style="float: right">
						<form method="get" action="/mall/qna/update">
							<input type="hidden" name="c_no" value="${read.c_no}">
							<button type="submit">수정</button>
						</form>
					</div>
				</c:when>
			</c:choose>
		</div>

		<div>
			<label>제목 : </label> <input type="text"
				style="border: white; font-size: 17px;" readonly
				value="${read.c_title}">
			<p>
				<label>작성자 : </label> <input type="text"
					style="border: white; font-size: 17px;" readonly
					value="${read.c_writer}">
			<p>
		</div>
	</div>
	<hr
		style="width: 60%; float: left; margin-left: 200; margin-right: 50%">
	<label style="margin-left: 16%;">내용 : </label>
	<input type="text" style="border: white; font-size: 17px;" readonly
		value="${read.c_content}">
</body>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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
		if ($('#myList').attr('class') == 'rolldown-list') {
			$('#myList').removeClass('rolldown-list');
			$('#myList').css('display', 'none');
		} else {
			$('#myList').addClass('rolldown-list');
			$('#myList').css('display', 'block');
		}
	});
</script>
</html>
