<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tbody>
       <c:forEach var="memberlist" items="${memberserch}">
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