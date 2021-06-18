<%--
  Created by IntelliJ IDEA.
  User: yys
  Date: 2021-06-18
  Time: 오전 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Page</title>
</head>
<body>
<div class="container-fluid">
    <div class="pt-5 mt-5 text-center">
        <i class="fas fa-user-friends fa-7x my-5 text-success"></i>
        <form action="<c:url value='/home'/>" method="GET">
            <button class="btn btn-lg btn-info mb-5">Home</button>
        </form>
        <h4 class="text-light">Content Available Only <span class="text-danger">User</span>&nbsp;Role</h4>
    </div>
</div>
</body>
</html>
