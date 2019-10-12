<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Food Wide</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png"
	href="/resources/loginCss/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="/resources/loginCss/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/loginCss/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/loginCss/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="/resources/loginCss/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/loginCss/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/loginCss/css/util.css">
<link rel="stylesheet" type="text/css"
	href="/resources/loginCss/css/main.css">
<style>
</style>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100" style = "padding-top: 50px">
				<div class="login100-pic js-tilt" data-tilt>
					<a href="/"><img src="/resources/loginCss/images/p2.png" alt="IMG" style="padding-top: 130px"></a>
				</div>

				<form class="login100-form validate-form">
					<span class="login100-form-title"> 회원가입 </span>

					<div class="wrap-input100 validate-input">
						<input id="registId" class="input100" type="text" name="registId"
							placeholder="아이디"> <span class="focus-input100"></span> <span
							class="symbol-input100"> <i class="fa fa-envelope"
							aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input id="registPw" class="input100" type="password"
							name="registPw" placeholder="비밀번호"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input">
						<input id="registPwck" class="input100" type="password"
							name="registPwck" placeholder="비밀번호 확인"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input id="registName" class="input100" type="text"
							name="registName" placeholder="이름"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input">
						<input id="registEmail" class="input100" type="text"
							name="registEmail" placeholder="이메일"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input">
						<input id="registAddress" class="input100" type="text"
							name="registAddress" placeholder="주소"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input">
						<input id="registPnum" class="input100" type="text"
							name="registPnum" placeholder="전화번호'-'없이 쓰세요"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="button"
							onclick="fncRegister()">회원가입</button>
					</div>


				</form>
			</div>
		</div>
	</div>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>
		$(function() {
			$('#registPw').keyup(function() {
				$('font[name=check]').text('');
			});

			$('#registPwck').keyup(function() {
/* 				console.log($('#registPw').val());
				console.log($('#registPwck').val()); */
				if ($('#registPw').val() != $('#registPwck').val()) {
					$('#registPw').css("background-color", "red");
					$('#registPwck').css("background-color", "red");
				} else {
					$('#registPw').css("background-color", "green");
					$('#registPwck').css("background-color", "green");
				}
			});
		});

		function fncRegister() {
			var id = $("#registId").val();
			var pw = $("#registPw").val();
			var name = $("#registName").val();
			var email = $("#registEmail").val();
			var pnum = $("#registPnum").val();
			var address = $("#registAddress").val();
			var data = {
				"id" : id,
				"pw" : pw,
				"name" : name,
				"email" : email,
				"pnum" : pnum,
				"address" : address
			};
			console.log("id : " + id);
			console.log("pw : " + pw);
			console.log("name : " + name);
			console.log("email : " + email);
			console.log("pnum : " + pnum);
			console.log("address : " + address);
			$.ajax({
				type : "post",
				url : "/mall/login/signup",
				data : data,
				success : function() {
					alert("회원가입에 성공하였습니다.");
					location.href= "/mall/login/login";
				},
				error : function() {
					alert("회원가입에 실패하였습니다.");
				}
			});
		}
	</script>
</body>
</html>


