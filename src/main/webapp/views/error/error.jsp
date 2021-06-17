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
    <title>404 Page</title>
</head>
<body>
<div class="container">
    <h1>404</h1>
    <div class="pt-5 mt-5 text-center">
        <div>
            <c:choose>
                <c:when test="${errorCode eq '403'}">
                    <span>sdfsdfdsf</span>
                </c:when>
                <c:when test="${errorCode eq '404'}">
                    dksdfdsf
                </c:when>
            </c:choose>
        </div>


    </div>

</div>

</body>
</html>
