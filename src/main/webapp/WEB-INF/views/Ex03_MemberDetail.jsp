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
        <title>회원정보디테일</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
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
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원정보디테일 </h1>
                         <div class="card mb-4">
                        
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>비번</th>
                                            <th>이름</th>
                                            <th>나이</th>
                                            <th>성별</th>
                                            <th>이메일</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                           <th>아이디</th>
                                            <th>비번</th>
                                            <th>이름</th>
                                            <th>나이</th>
                                            <th>성별</th>
                                            <th>이메일</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                   
                                        <tr>
                                            <td>${member.id}</td>
                                            <td>${member.pwd}</td>
                                            <td>${member.name}</td>
                                            <td>${member.age}</td>
                                            <td>${member.gender}</td>
                                            <td>${member.email}</td>
                                        </tr>
                                        <tr>
                              <td colspan="6"><a href="Ex03_Memberlist.do">목록가기</a></td>
                              </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
         <!-- footer include -->
          <jsp:include page="/commonmodule/footer.jsp"></jsp:include>
          <!-- footer include -->
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>