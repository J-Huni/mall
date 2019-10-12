<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ page session="true"%>
<html>
<head>
<title>Food Wide</title>
<style>
body {
	font-family: "Open Sans", sans-serif;
	line-height: 1.25;
}

table {
	border: 1px solid #ccc;
	border-collapse: collapse;
	table-layout: fixed;
}

table caption {
	font-size: 1.5em;
	margin: .5em 0 .75em;
}

table tr {
	border: 1px solid #ddd;
	padding: .35em;
}

table tr:nth-child(even) {
	background: #f8f8f8;
}

table th, table td {
	padding: .625em;
	text-align: center;
}

table th {
	background: #A84E19;
	color: #fff;
	font-size: .85em;
	letter-spacing: .1em;
	text-transform: uppercase;
}

table td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
<link rel="stylesheet" href="/resources/Nevi.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="/resources/main.css" type="text/css"
	media="screen" />
</head>
<body>
	<%@ include file="../thema.jsp"%>
	<div style="margin-left: 18%">
		<h2>Q & A</h2>
		<table style="width: 70%">
			<thead>
				<tr>
					<th style="width: 50%">제목</th>
					<th style="width: 10%">작성자</th>
					<th style="width: 10%">날짜</th>
				</tr>
			</thead>

			<tbody>
				<c:choose>
					<c:when test="${!empty page}">
						<c:forEach items="${page}" var="CenterVO">
							<tr>
								<td style="text-align: left"><a
									style="text-decoration: none;"
									href="/mall/qna/read?c_no=${CenterVO.c_no}">${CenterVO.c_title }</a></td>
								<td>${CenterVO.c_writer}</td>
								<td><fmt:formatDate value="${CenterVO.c_date}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr style="text-align: center; height: 35px;">
							<td colspan="7">게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<button type="button" id="crtqna"
		style="float: right; margin-right: 25%; margin-top: 1%;">글 쓰기</button>
	<br />
	<c:if test="${pager.numberOfRecords != 0}">
		<div style="width: 50%; margin: 0 auto; text-align: center;">
			<c:if test="${pager.currentPageNo != 1}">
				<a
					href="javascript:page_locate(${pager.prevPageNo}, ${pager.maxPost})">이전</a>
			</c:if>
			&nbsp;
			<c:forEach var="i" begin="${pager.startPageNo}"
				end="${pager.endPageNo}" step="1">
				<c:choose>
					<c:when test="${i != pager.currentPageNo}">
						<a href="javascript:page_locate(${i}, ${pager.maxPost})"> <c:out
								value="${i}"></c:out>
						</a>&nbsp;
							</c:when>
					<c:otherwise>
						<c:out value="${i}"></c:out>
								&nbsp;
							</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pager.currentPageNo < pager.nextPageNo}">
				<a href="javascript:page_locate(${pager.nextPageNo}, ${pager.maxPost})">다음</a>
			</c:if>
		</div>
	</c:if>
	<br />
	<input type="hidden" value="${sessionScope.id}" id="hdid">
</body>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$("#crtqna").click(function() {
		var hidden = $('#hdid').val();
		if(!hidden){
			alert("로그인을 해주세요");
			location.href = "/mall/login/login";
		}else{
			location.href = "/mall/qna/create";	
		}
	});
	function page_locate(page, perpagenum) {
		href = "?currentPageNo=" + page + "&maxPost=" + perpagenum;
		href += "&search=" + "${search.search}" + "&searchType="
				+ "${search.searchType}";
		location.href = href;
	}
	function read_page_process(bno) {
		href = "/board/read?bno=" + bno;
		href += "&currentPageNo=" + $
		{
			pager.currentPageNo
		}
		+"&maxPost=" + $
		{
			pager.maxPost
		}
		;
		href += "&search=" + "${search.search}" + "&searchType="
				+ "${search.searchType}";
		location.href = href;
	}
	jQuery(document).ready(function() {

		var select = $("select#color");

		select.change(function() {
			var select_name = $(this).children("option:selected").text();
			$(this).siblings("label").text(select_name);
		});
	});
	$(document).ready(function() {
		var placeholderTarget = $('.textbox input[type="text"]');
		//포커스시
		placeholderTarget.on('focus', function() {
			$(this).siblings('label').fadeOut('fast');
		});
		//포커스아웃시
		placeholderTarget.on('focusout', function() {
			if ($(this).val() == '') {
				$(this).siblings('label').fadeIn('fast');
			}
		});
	});
	console.log('${pager.currentPageNo}');
	if ($('.textbox input[type="text"]').val() != '') {
		$('.textbox input[type="text"]').siblings('label').fadeOut('fast');
	};
	var target = "." + $
	{
		pager.currentPageNo
	}
	console.log(target);
	$(target).css("color", "#fff");
	$(target).css("background", "#1278ed");
	$(target).css("border", "#1px solid #4c8500");
</script>
</html>
