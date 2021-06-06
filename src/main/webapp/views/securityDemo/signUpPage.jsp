<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yoonjaeseung
  Date: 2021/06/06
  Time: 12:18 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
<h1>회원가입</h1>
<form action="/signUpProc" method="post">
  <input type="text" name="name">
  <input type="password" name="password">
  <input type="submit" value="Sign Up">

</form>
</body>
</html>
