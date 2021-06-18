<%--
  Created by IntelliJ IDEA.
  User: yys
  Date: 2021-06-17
  Time: 오후 5:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <c:choose>
        <c:when test="${errorCode eq '403'}">
            <title>403 Page</title>
        </c:when>
        <c:when test="${errorCode eq '404'}">
            <title>404 Page</title>
        </c:when>
    </c:choose>
    <style>
        body{
            background: #043041;
            height: 100vh;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="pt-5 mt-5 text-center">
        <div>
            <c:choose>
                <c:when test="${errorCode eq '404'}">
                    <i class="fas fa-times-circle fa-7x my-5 text-danger"></i>
                </c:when>
                <c:when test="${errorCode eq '403'}">
                    <i class="fas fa-hand-paper fa-7x my-5 text-danger"></i>
                </c:when>
                <c:otherwise>
                    <i class="fas fa-bomb fa-7x my-5 text-danger"></i>
                </c:otherwise>
            </c:choose>
        </div>
        <h1 class="display-2 text-danger"><c:out value="${errorCode}"/> Error Occurred! </h1>
        <h5 class="text-light mb-5"><c:out value="${errorMessage}"/>&nbsp;An error has occurred. Please contact th
            administrator</h5>
        <button id="error-back" class="btn btn-lg btn-info mb-5">Back</button>
    </div>
</div>
<script>
    $('#error-back').on('click', function () {
        window.history.back();
    });
</script>
</body>
</html>
