<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
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
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Account</h3></div>
                                    <div class="card-body">
                                        <form action="${pageContext.request.contextPath}/Ex02_JDBC_JoinOK.do" method="post" name="joinForm" id="joinForm">
                                              <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input type="text" class="form-control" id="id" name="id" type="text" placeholder="Enter your id" />
                                                        <label for="inputFirstName">ID</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input type="password" name="pwd" id="pwd" class="form-control" placeholder="Enter your password" required />
                                                        <label for="pwd">password</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" name="email" id="email" class="form-control" placeholder="name@example.com" required />
                                                <label for="inputEmail">Email address</label>
                                            </div>
                                            
                                              <div class="row mb-3">
                                               <div class="col-md-6">
                                                   <div class="form-floating mb-3 mb-md-0">
                                                       <input type="text" name="name" id="name" class="form-control" placeholder="이름" required/>
                                                       <label for="name">name</label>
                                                   </div>
                                               </div>
                                             
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input type="text" name="age" id="age" maxlength="3"  class="form-control" placeholder="나이를 숫자로 입력하세요" required/>
                                                        <label for="age">age</label>
                                                    </div>
                                                </div>
                                           		</div>
                                                
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        여 : <input type="radio" name="gender" id="gender" value="여" checked><br>
														남 : <input type="radio" name="gender"id="gender" value="남">
                                                    </div>
                                                </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><input type="submit" value="회원가입" class="btn btn-primary btn-block"></div>
                                          </div>

                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="Ex02_JDBC_Login.do">이미 회원이신가요? 로그인 하러 가기</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            <!-- footer include -->
    		<jsp:include page="/commonmodule/footer.jsp"></jsp:include>
    		<!-- footer include -->
            </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
