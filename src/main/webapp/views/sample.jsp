<%--
  Created by IntelliJ IDEA.
  User: blucean
  Date: 2020-07-24
  Time: 오후 3:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>Sample</title>
</head>
<body>
<h1>파일 업로드 예제</h1>
<form method="post" action="upload" enctype="multipart/form-data">
    <label for="email">email: </label>
    <input type="text" id="email" name="email">

    <br/>

    <label for="file1">파일: </label>
    <%-- 단일 파일 --%>
        <input type="file" id="file1" name="file1" multiple>
    <%-- 다중 파일 --%>
<%--    <input type="file" id="file1" name="files" multiple>--%>
    <br/>

    <input type="submit" value="upload">

</form>
</body>
</html>
