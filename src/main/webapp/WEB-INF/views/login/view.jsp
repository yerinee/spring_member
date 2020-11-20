<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources2/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources2/bootstrap/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources2/bootstrap/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<!-- jQuery -->
<script src="${pageContext.request.contextPath }/resources2/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script
	src="${pageContext.request.contextPath }/resources2/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath }/resources2/bootstrap/dist/js/adminlte.min.js"></script>	
	

<style>
body.login-page {
	background-image: url('${pageContext.request.contextPath }/resources/images/intro.jpg');
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

<script>

$(function(){

	$('#userid').val("${userid}")

	
	if(getCookieValue("REMEMBERME") == "Y"){
		console.log("remember")
		$('#checkbox').attr("checked","checked")
		$('#userid').val(getCookieValue("USERNM"))
	}	
	
	
	$('#button').on('click',function(){
		if($('#checkbox').prop("checked")){
			val = $('#userid').val()		
			setCookie("REMEMBERME","Y")
			setCookie("USERNM",val)
		}else{
			deleteCookieValue("REMEMBERME")
			deleteCookieValue("USERNM")
		}

// 		alert("클릭")
	 	$('#form').submit();
	 	
		
		
	})
	
	
	if($('#checkbox').prop("checked")){
		console.log("체크")
	}else{
		console.log("노체크")
	}
	  
})
	// 쿠키 확인
	function getCookieValue(cookieName){

		var cookies = document.cookie.split("; ")
		var cookiess;
	res = "";

	
	for(i = 0; i < cookies.length;i++){

		cookiess = cookies[i].split("=");
		
		if(cookiess[0] == cookieName) {
			res = cookiess[1];
		}
	}
	
	return res;
	
	}


// 쿠키설정
function setCookie(cookieName, cookieValue , expires){

	var today = new Date();
	
	// 현재날짜에서 미래로 + expires만큼 한 날짜 구하기
	today.setDate(today.getDate() + expires); //오늘 날짜에서 expires일을 더한것
					
	document.cookie = cookieName + "=" + cookieValue + "; path=/; expires=" + today.toGMTString();
	
	console.log(document.cookie);
}

// 쿠키 삭제 _ 해당쿠키의 expires속성을 과거날짜로 변경
function deleteCookieValue(cookieName){

	setCookie(cookieName, "", -1);	
	
}

</script>


</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="#"><b>관리자 로그인</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">Sign in to start your session</p>

				<form id="form" action="${pageContext.request.contextPath }/login/process" method="post">
					<div class="form-group has-feedback">
						<input type="text" class="form-control" name="userid"
							placeholder="아이디를 입력하세요." id ="userid" value=""> <span
							class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" class="form-control" name="pass"
							placeholder="패스워드를 입력하세요." value="brownPass"> <span
							class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="row">
						<div class="col-sm-8">
							<div class="checkbox icheck">
								<label> <input id="checkbox" type="checkbox" name="rememberMe"
									value="remember-me"> Remember Me
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-sm-4">
							<button type="button" id="button" class="btn btn-primary btn-block btn-flat">로그인</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

			</div>
			<!-- /.login-box-body -->
		</div>
	</div>
	<!-- /.login-box -->

	


</body>
</html>








