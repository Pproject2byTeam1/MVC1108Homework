<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="author" content="" />
<title>Login</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<!-- nav include -->
	<jsp:include page="/commonmodule/nav.jsp"></jsp:include>
	<!-- nav include -->
	<div id="layoutSidenav">
		<!-- side include -->
		<jsp:include page="/commonmodule/side.jsp"></jsp:include>
		<!-- side include -->
		<div id="layoutSidenav_content">
			<main>
					<!-- login bootstrap -->
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-5">
								<div class="card shadow-lg border-0 rounded-lg mt-5">
									<div class="card-header">
										<h3 class="text-center font-weight-light my-4">Login</h3>
									</div>
									<div class="card-body">
										<div class="form-floating mb-3">
										
										<form action="${pageContext.request.contextPath}/Ex02_JDBC_loginok.do" method="post" name="loginForm" id="loginForm">
										<div>
											<input type="text" class="form-control" id="id" name="id" placeholder="ID"> 
											<label for="id"></label>
										</div>
										<div class="form-floating">
											<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password"> 
												<label for="pwd">Password</label>
										</div>
										<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small" href=""></a> 
											<input type="submit" value="로그인" class="btn btn-primary">
										</div>
										</form>

									</div>
									<div class="card-footer text-center py-3">
										<div class="small">
											<a href="Ex02_JDBC_JoinForm.do">회원가입하기</a>
										</div>
									</div>
			</main>
			<!-- footer include -->
			<jsp:include page="/commonmodule/footer.jsp"></jsp:include>
			<!-- footer include -->
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
