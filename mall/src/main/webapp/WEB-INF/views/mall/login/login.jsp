<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Food Wide</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="/resources/loginCss/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/resources/loginCss/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginCss/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginCss/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginCss/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginCss/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginCss/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginCss/css/main.css">
<style>

</style>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<a href = "/"> <img src="/resources/loginCss/images/p2.png" alt="IMG"></a>
				</div>

				<form class="login100-form validate-form">
					<span class="login100-form-title">
						로그인
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input id="loginId" class="input100" type="text" name="loginId" placeholder="아이디">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input id="loginPw" class="input100" type="password" name="loginPw" placeholder="비밀번호">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="button" onclick="fncLogin()">
							로그인
						</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="/mall/login/signup">
							회원가입
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
        
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="/resources/loginCss/js/main.js"></script>
<script>
/* 	$(function(){
		$('#registPw').keyup(function(){
			$('font[name=check]').text('');
		});
	
	$('#registPwck').keyup(function(){
		console.log($('#registPw').val());
		console.log($('#registPwck').val());
			if($('#registPw').val()!=$('#registPwck').val()){
				$('#registPw').css("background-color","red");
				$('#registPwck').css("background-color","red");
			}else{
				$('#registPw').css("background-color","green");
				$('#registPwck').css("background-color","green");
			}
		});
	});

	$("#boardEnt").click(function(){
		if("{session}" != "yes"){
			alert("로그인이 필요합니다!!");
			return;
		}
		location.href = "/mall/main"
	}) */
	/* 
	 function success() {
		var result = '<c:out value="${success}"></c:out>';
		console.log("${success}");
		if(result == 'success')
			alert("로그인에 성공하셧습니다.");	
	}
	function check() {
		var result = '<c:out value="${check}"></c:out>';
		if(result == 'no')
			alert("아이디나 패스워드가 틀립니다.");			
	}
	
	function init() {
		check();
		success();
	} */
	function fncLogin(){
		var id;
		var pw;
		if($("#loginId").val() == "" || $("#loginId").val() == null){
			alert("아이디를 입력해주세요.");
			$("#loginId").focus();
			return false;
		}
		if($("#loginPw").val() == "" || $("#loginPw").val() == null){
			alert("비밀번호를 입력해주세요.");
			$("#loginPw").focus();
			return false;
		}
		
		id = $("#loginId").val();
		pw = $("#loginPw").val();
		
		var data = {
			"id" : id,
			"pw" : pw
		};
		
		console.log(id +" / "+ pw);
		$.ajax({
			type:"post",
			url:"/mall/login/login",
			data:data,
			success:function(response){
				if(response == 1){
					location.href="/";
				}else if(response == 2){
					alert("");
				}else{
					
				}
			},
			error:function(){
				alert("로그인 중 오류가 발생하였습니다.");
			}
		});
	}
/* 	function fncRegister(){
		var id = $("#registId").val();
		var pw = $("#registPw").val();
		var name = $("#registName").val();
		var data = {
				"id" : id,
				"pw" : pw,
				"name" : name
		}
		console.log("json 데이터 : "+data);
		$.ajax({
			type:"post",
			url:"/login/register",
			data:data,
			success:function(){
				alert("회원가입에 성공하였습니다.");
				location.reload();
			},
			error:function(){
				alert("회원가입에 실패하였습니다.");
			}
		}); 
	}*/
</script>          
</body>

</html>


