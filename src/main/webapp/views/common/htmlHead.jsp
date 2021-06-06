<%--
  Created by IntelliJ IDEA.
  User: blucean
  Date: 2020-05-29
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="viewport" content="width=device-width, initial-scale=1">

<%-- spring security 사용 시 Ajax 통신을 위한 코드 [방법1] --%>
<%--<meta name="_csrf" content="${_csrf.token}"/>--%>
<%-- //spring security 사용 시 Ajax 통신을 CSRF 위한 코드 --%>

<%-- favicon error --%>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<%-- //favicon error --%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">

<%-- bootstrap 드롭다운 사용 시 필요 --%>
<%--<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>--%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>

<%-- 이 순서대로 사용 --%>
<%--<script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.1.js"></script>--%>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<%-- //이 순서대로 사용 --%>

<%-- spring security 사용 시 Ajax 통신을 위한 코드 [방법2]--%>
<%--<script src="${pageContext.request.contextPath}/resources/js/csrf.js"></script>--%>
<%-- //spring security 사용 시 Ajax 통신을 CSRF 위한 코드 --%>




