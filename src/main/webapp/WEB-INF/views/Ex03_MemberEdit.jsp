<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   /* 
   회원정보 수정하기
   1.DB 쿼리 : 2개 (수정정보 : select , 수정정보반영 : update)
    1.1 : select * from koreamember where id=?
    1.2 : update koreamember set ename=? where id=?       
   2.화면 1개(기존에 입력내용 보여주는 것)-> 처리 1개 (수정처리)
    2.1  DB select 한 결과 화면 출력 
      <input type="text" value="rs.getString(id)">
         수정안하고 .. 화면 .. 전송(x) : <td>rs.getString("id")</td>
         수정안하고 .. 화면 .. 전송   : <input type="text" value="rs.getString(id)" readonly>
         수정하고 ..화면  ..전송   :  <input type="text" value="rs.getString(id)">
   
   */
%>   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Tables - SB Admin</title>
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
             <div id="layoutSidenav_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원정보 수정</h3></div>
                                    <div class="card-body">
                                        <form action="Ex03_MemberEditok.do" method="post"">
                                              <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input type="text" class="form-control" id="id" name="id" type="text"  value="${member.id}" readonly />
                                                        <label for="inputFirstName">ID</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input type="password" name="pwd" id="pwd" class="form-control" value="${member.pwd}" readonly />
                                                        <label for="pwd">password</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" name="email" id="email" class="form-control" value="${member.email}"/>
                                                <label for="inputEmail">Email address</label>
                                            </div>
                                            
                                              <div class="row mb-3">
                                               <div class="col-md-6">
                                                   <div class="form-floating mb-3 mb-md-0">
                                                       <input type="text" name="name" id="name" class="form-control" value="${member.name}"/>
                                                       <label for="name">name</label>
                                                   </div>
                                               </div>
                                             
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input type="text" name="age" id="age" maxlength="3"  class="form-control" value="${member.age}"/>
                                                        <label for="age">age</label>
                                                    </div>
                                                </div>
                                           		</div>
                                                
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        여 : <input type="radio" class="form" name="gender" id="gender" value="여" <c:if test="${member.gender == '여 '}">checked</c:if>><br>
                                             			남 : <input type="radio" class="form" name="gender" id="gender" value="남" <c:if test="${member.gender == '남 '}">checked</c:if>><br>
                                                    </div>
                                                </div>
                                                <br>
                                          <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="d-grid"><input type="submit" value="수정하기" class="btn btn-primary btn-block"></div>
                                          </div>

                                    <div class="col-md-6">
                                        <div class="d-grid"><input type="button" class="btn btn-primary" style="background-color: red" value="리스트로 돌아가기" onClick="location.href='Ex03_Memberlist.do'" class="btn btn-primary2 btn-block"></div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
</body>
</html>