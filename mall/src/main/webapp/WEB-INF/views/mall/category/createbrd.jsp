<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>Food Wide</title>
<style>
</style>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css"
	rel="stylesheet">

</head>
<body>
	<%@ include file="../thema.jsp"%>
	<div style="margin-left: 22%;">
		<div style="width: 70%">
			<h3>상품 등록</h3>
			<hr>
			<form id="frm" action="/mall/category/createbrd" method="post"
				enctype="multipart/form-data">
				<span style="margin-left: 9%">이미지 <img id="img"
					src="/resources/test.png"> <input type="file" name="file"
					id="p_picture">
					<button type="button" id="imgbtn">등록</button>
				</span>
			</form>
			<hr style="border: 1px solid #842A00;">
		</div>
		<div>
			<table style="width: 70%">
				<tr style="border-bottom: 2px solid #842A00;">
					<td style="text-align: center;">상품명</td>
					<td><input type="text" name="p_name" id="p_name"
						style="width: 80%;"></td>
				</tr>
				<tr style="border-bottom: 2px solid #842A00;">
					<td style="text-align: center;">가격</td>
					<td><input type="text" name="p_price" id="p_price"
						style="width: 80%;"></td>
				</tr>
				<tr style="border-bottom: 2px solid #842A00;">
					<td style="text-align: center;">수량</td>
					<td><input type="text" name="p_amount" id="p_amount"
						style="width: 80%;"></td>
				</tr>
				<tr style="border-bottom: 2px solid #842A00;">
					<td style="text-align: center;">분류</td>
					<td><select name="p_category" id="p_category"
						style="width: 80%; height: 25px">
							<option value="1">일본</option>
							<option value="2">중국</option>
							<option value="3">미국</option>
							<option value="4">유럽</option>
					</select></td>
				</tr>
			</table>
			<div style="margin-left: 21.5%;">
				<textarea class="form-control" id="summernote" name="content"
					placeholder="content" maxlength="140" rows="7"></textarea>
			</div>
			<input type="submit"
				style="float: right; margin-right: 30%; margin-top: 1%;" value="등록"
				id="addBtn">
		</div>
	</div>
</body>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<script type="text/javascript">
 		$('#summernote').summernote({
			height : 300,
			minHeight : null,
			maxHeight : null,
			focus : true,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					sendFile(files[0], editor, welEditable);
				}
			}
		});

	function sendFile(file, editor, welEditable) {
		console.log(files);
		var data = new FormData();
		data.append('file', file);
		var $note = $(this);
		$.ajax({
			data : data,
			type : "POST",
			url : '/mall/category/createDetail',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(url) {
				$note.summernote('insertImage', url);
				}
		});
	}
</script>
<script>
	var filename = null;

	/* 
	$("#addBtn").click(function() {
		var p_name;
		var p_price;
		var p_amount;
		var p_category;
		var p_picture;

		p_name = $("#p_name").val();
		p_price = $("#p_price").val();
		p_amount = $("#p_amount").val();
		p_category = $("#p_category").val();
		p_picture = filename;

		var data = {
			"p_name" : p_name,
			"p_price" : p_price,
			"p_amount" : p_amount,
			"p_category" : p_category,
			"p_picture" : p_picture
		};

		$.ajax({
			type : "post",
			url : "/mall/category/createDetail",
			data : data,
			success : function(result) {
				alert("상품이 등록되었습니다.");
				location.href="/";
			},
			error : function() {
				alert("상품 등록에 실패하였습니다.");
			}
		});
	})
	 */
	$("#imgbtn").click(
			function() {
				var form = $('#frm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "/mall/category/createbrd",
					type : "post",
					processData : false,
					contentType : false,
					data : data,
					success : function(result) {
						if (!result) {
							alert("사진 업로드가 실패했습니다.");
						} else {
							filename = result.name;
							console.log(filename);
							console.log($("#img").attr("src",
									"/resources/picture/" + result.name));
						}
					}
				});
			});

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