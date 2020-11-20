<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>회원 정보</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources2/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources2/bootstrap/dist/css/adminlte.min.css">
<!-- jQuery -->
<script src="${pageContext.request.contextPath }/resources2/bootstrap/plugins/jquery/jquery.min.js"></script>

<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath }/resources2/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath }/resources2/bootstrap/dist/js/adminlte.min.js"></script>
	
	
<script>
$(document).ready(function(){
	

	$('#editbtn').on('click', function(){
		a = $('#userId').text()
		console.log(a);		
		//document.location="/memberUpdate?userid=${memberVo.userid}"
	})

	$('#profileDownBtn').on('click', function(){
		document.location="${pageContext.request.contextPath }/member/profileDownload?userid=${memberVo.userid}"
	})

	$('#registBtn').on('click', function(){
		document.location="${pageContext.request.contextPath }/member/memberupdateview?userid=${memberVo.userid}"
		
	})
	$('#delBtn').on('click', function(){
		
		if(confirm("정말 삭제하시겠습니까??") == true){

			document.location="${pageContext.request.contextPath }/member/memberdelete?userid=${memberVo.userid}"
		}
	})

	
	
});

</script>	
<style>
	#user_id{
	
		color: white;
	}
</style>

</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#" class="nav-link">HOME</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="${pageContext.request.contextPath }/member/memberlist" class="nav-link">회원관리</a></li>
			</ul>

			<!-- SEARCH FORM -->
			<form class="form-inline ml-3">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-navbar" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</form>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link" data-toggle="dropdown" href="#"> <i class="far fa-comments"></i> <span class="badge badge-danger navbar-badge">3</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="${pageContext.request.contextPath }/resources2/bootstrap/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Brad Diesel <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">Call me whenever you can...</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="${pageContext.request.contextPath }/resources2/bootstrap/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										John Pierce <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">I got your message bro</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="${pageContext.request.contextPath }/resources2/bootstrap/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Nora Silvester <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">The subject goes here</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
					</div></li>
				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown">
					<a class="nav-link" data-toggle="dropdown" href="#">
						<i class="far fa-bell"></i> <span class="badge badge-warning navbar-badge">15</span>
					</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-header">15 Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-envelope mr-2"></i> 4 new messages <span class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-users mr-2"></i> 8 friend requests <span class="float-right text-muted text-sm">12 hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i> 3 new reports <span class="float-right text-muted text-sm">2 days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#"><i class="fas fa-th-large"></i></a></li>
			</ul>
		</nav>
		<!-- /.navbar -->


		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="/" class="brand-link">
				<img src="${pageContext.request.contextPath }/resources2/images/line.png" class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">회원 관리</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
				<c:choose>
					<c:when test="${S_MEMBER != null}">	
					<div class="image">
						
						<img src="${pageContext.request.contextPath }/profile/${S_MEMBER.userid}.png" class="img-circle elevation-2" alt="User Image">
						
					</div>
					<div class="info">
						<div class="row">
							
								<span id ="user_id">${S_MEMBER.userid}/${S_MEMBER.alias}</span>						
							
						</div>
					</div>
					</c:when>	
				</c:choose>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column subMenuList" data-widget="treeview" data-accordion="false">

					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>

			<!-- /.sidebar -->
		</aside>


		<div id="if_list_div" style="position: relative; padding: 0; overflow: hidden;">
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">

				<!-- Main content -->
				<section class="content register-page" style="height:100%;">
					<div class="container-fluid">
						<div class="login-logo">
							<b>회원 등록</b>
						</div>
						<!-- form start -->
						<div class="card">
							<div class="register-card-body">
								<form role="form" class="form-horizontal" >
								
								<c:if test="${memberVo.realfilename ne null }" >		
									<div class="input-group mb-3">
										<div class="mailbox-attachments clearfix" style="text-align: center; width:100%;">
											<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid green; height: 200px; width: 140px; margin: 0 auto;">
<!-- 												<img id="pictureViewImg" style="width:100%; height:100%;"/> -->
													<img src="${pageContext.request.contextPath }/member/profileImg?userid=${memberVo.userid}"/><br>
											</div>
											<div class="mailbox-attachment-info">
												<div class="input-group input-group-sm">
<!-- 													<input id="picture" class="form-control" -->
<!-- 														   type="file" name="picture" accept=".gif, .jpg, .png" style="height:37px;"/> -->
														 

													
													<c:if test="${memberVo.realfilename ne null }" >				
														<input id ="profileDownBtn" type="button" class="btn btn-default" value ="다운로드 ${memberVo.realfilename }"/>	   
													</c:if>
												</div>
											</div>
										</div>
										<br />
									</div>
								</c:if>	
									
									<div class="form-group row">
										
										<div class="col-sm-9 input-group-sm">
											<label class="col-sm-3" style="font-size: 0.9em;">사용자 아이디</label>
<!-- 											<input name="id" type="text" class="form-control" id="id" placeholder="회원 id"> -->
											<span class="input-group-append-sm">${memberVo.userid }</span>
										</div>
									</div>
									
									
									<div class="form-group row">										
										<div class="col-sm-9 input-group-sm">
										<label class="col-sm-3" style="font-size: 0.9em;">사용자 비밀번호</label>
<!-- 											<input class="form-control" name="pwd" type="password" class="form-control" id="pwd" placeholder="비밀번호" /> -->
											<span class="input-group-append-sm">${memberVo.pass }</span>
										</div>
									</div>
									
									<div class="form-group row">
<!-- 										<label for="name" class="col-sm-3" style="font-size: 0.9em;"> -->
<!-- 											<span style="color: red; font-weight: bold;">*</span>이 름 -->
											
<!-- 										</label> -->
										<div class="col-sm-9 input-group-sm">
												<label class="col-sm-3" style="font-size: 0.9em;">사용자 이름</label>
												<span class="input-group-append-sm">${memberVo.usernm }</span>
<!-- 											<input class="form-control" name="name" type="text" id="name" placeholder="이름" /> -->
										</div>

									</div>
									<div class="form-group row">
										<div class="col-sm-9 input-group-sm">
												<label class="col-sm-3" style="font-size: 0.9em;">사용자 별명</label>
												<span class="input-group-append-sm">${memberVo.alias }</span>
<!-- 											<input class="form-control" name="alias" type="text" id="alias" placeholder="별명"> -->
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-9 input-group-sm">
											<label class="col-sm-3" style="font-size: 0.9em;">사용자 주소</label>
<!-- 											<input name="addr1" type="text" class="form-control" id="addr1" placeholder="주소" readonly> -->
												<span class="input-group-append-sm">${memberVo.addr1 } </span>
										</div>
										<div class="col-sm-9 input-group-sm">
											<label class="col-sm-3" style="font-size: 0.9em;"></label>
<!-- 											<input name="addr1" type="text" class="form-control" id="addr1" placeholder="주소" readonly> -->
												<span class="input-group-append-sm">${memberVo.addr2 }</span>
										</div>
										
									</div>
									
									<div class="card-footer">
										<div class="row">
											<div class="col-sm-6">
												<button type="button" id="registBtn" class="btn btn-info">수정</button>
											</div>
											
											<div class="col-sm-6">
												
												<button type="button" id="delBtn" onclick="CloseWindow();" class="btn btn-default float-right">&nbsp;&nbsp;&nbsp;삭 &nbsp;&nbsp;제&nbsp;&nbsp;&nbsp;</button>
											
											</div>

										</div>
									</div>
									
								</form>
							</div>
							<!-- register-card-body -->
						</div>
					</div>
				</section>
				<!-- /.content -->
			</div>
			<!-- /.content-wrapper -->
		</div>
	</div>

	<!-- Main Footer -->
	<footer class="main-footer">
		<!-- To the right -->
		<div class="float-right d-none d-sm-inline">Anything you want</div>
		<!-- Default to the left -->
		<strong>Copyright &copy; 2014-2019 <a href="https://adminlte.io">AdminLTE.io</a>.
		</strong> All rights reserved.
	</footer>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->


	
</body>
</html>







     