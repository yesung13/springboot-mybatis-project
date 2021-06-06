<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Login page</title>
</head>
<body>

<form action="/doLogin" method="POST">
    <input type="text" name="id">
    <input type="password" name="pw">
    <input type="submit" value="Login">
</form>

<a href="<c:url value="/signUp"/>">회원가입</a>

</body>
</html>