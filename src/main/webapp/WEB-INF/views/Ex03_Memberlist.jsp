<%@page language="java" contentType="text/html; charset=UTF-8"
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
    <title>Tables - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	
	<script type="text/javascript">
         $(function(){
            
        	 $('#search').keyup(function() {
                 const data = {"search" : $('#search').val()}
                 
                 console.log(data);
                 
                 $.post("Ex03_MemberSearch.do", data, function(responsedata){
                    //응답이 왔고 정상 건 이라면
                    console.log(responsedata);
                    
                    $('tbody').remove();
                    $('#datatablesSimple').append(responsedata);
                 });
              });
         });
   </script>


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
                        <h1 class="mt-4">회원관리 페이지</h1>
                        <!-- <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol> -->
                        <div class="card mb-4"><!-- 
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div> -->
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable User
                            </div>
                            <div class="card-body">
                            <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>IP</th>
                                            <th>NAME</th>
                                            <th colspan="2">관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        
                                    </tfoot>
			                                    <tbody>
			                                        <c:forEach var="memberlist" items="${memberlist}">
			                                 <tr>
			                                    <td>
			                                       <a href='Ex03_MemberDetail.do?id=${memberlist.id}'>${memberlist.id}</a>
			                                    </td>
			                                    <td>${memberlist.ip}</td>
			                                    <td>${memberlist.name}</td>
			                                    <td><a class="btn btn-primary" style="background-color: red" href="Ex03_MemberDelete.do?id=${memberlist.id}">삭제</a>
			                                    </td>
			                                    <td><a class="btn btn-primary" href="Ex03_MemberEdit.do?id=${memberlist.id}">수정</a>
			                                    </td>
			                                 </tr>
			                              </c:forEach>
			                                    </tbody>
                                </table>
                                <div class="dataTable-search">
                                	<input class="dataTable-input" id="search" name="search" placeholder="Search..." type="text">
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