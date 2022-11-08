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
<meta name="description" content="" />
<meta name="author" content="" />
<title>메인 기본페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
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

		<div id="layoutSidenav_content" class="bg-light">
			<main>
			<header class="masthead text-black text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <img class="masthead-avatar mb-5" src="https://media3.giphy.com/media/eBfDbigsqba5A0nYoe/giphy.gif?cid=790b76113eb726ec42c7684684b725a55e3d39ed3bca3e14&rid=giphy.gif&ct=s" alt="..." />
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">
				
				<c:set var="userid" value="${member}" />
				<c:if test="${!empty userid}">
               		${param.userid} 회원님 방가방가^^<br>
					<c:if test="${userid.id == 'admin'}">
						<a href='Ex03_Memberlist.do'>회원관리</a>
					</c:if>
				</c:if>
				<c:if test="${empty userid}">
               		사이트 방문을 환영합니다 ^^ <br>회원가입 좀 하지 ...
            	</c:if>

				</h1>
                <!-- Icon Divider-->
                <div class="divider-custom ">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
