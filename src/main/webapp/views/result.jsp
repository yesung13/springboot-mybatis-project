<%--
  Created by IntelliJ IDEA.
  User: blucean
  Date: 2020-07-24
  Time: 오후 4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload completed</title>
</head>
<body>
<h1>Upload completed</h1>
<div class = "result-img">
    <img src="${pageContext.request.contextPath}${url}" style="width: 150px" alt="...">
</div>
<p><a href="/sample">다시 업로드 하기</a> </p>
</body>
</html>
