<%--
  Created by IntelliJ IDEA.
  User: SAMSUNG
  Date: 2020-08-03
  Time: 오후 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>[admin]Main</title>
</head>
<body>
<table class="table table-borderless">
    <tr><h1>관리자 페이지</h1></tr>
    <tr>
        <td>
            <div>
            <button type="button" class="btn btn-info" id="addNotice_btn">공지사항 글쓰기</button>
            <button type="button" class="btn btn-info" id="userPage_btn">사용자 페이지</button>
            <button class="btn btn-info" disabled>button 3</button>
            </div>
        </td>
    </tr>
</table>
</body>
<script>
    $(document).ready(function () {
        $("#addNotice_btn").on('click', function (e) {
            window.location.assign("/admin/addNoticePage");
        });

        $("#userPage_btn").on('click', function (e) {
            window.location.assign("/")
        })
    });



</script>
</html>
