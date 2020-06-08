<%--
  Created by IntelliJ IDEA.
  User: blucean
  Date: 2020-06-01
  Time: 오후 4:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>로그인</title>
    <style>
        a img {
            width: 2.0rem;
            height: 2.0rem;
        }

        a span {
            font-stretch: expanded;
            font-size: 2.0rem;
        }

        .all {
            margin-top: 10.0em;
        }

        .col input {
            width: 300px;
            max-width: 300px;
        }

        .col button {
            width: 300px;
            max-width: 300px;
        }


    </style>
</head>
<body onload="checkErrCode()" class="bg-light">
<div class="all">
    <div class="container">
        <div class="row justify-content-center">
            <div class="row navbar navbar-light">
                <a class="col navbar-brand" href="/">
                    <img src="${pageContext.request.contextPath}/resources/image/cubes-solid.svg"
                         class="d-inline-block align-baseline" alt="logo">
                    <span class="d-inline-block align-bottom">Blucean</span>
                </a>
            </div>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/account/getAccount">
            <div class="row justify-content-center">
                <div class="list-group row">
                    <div class="col">
                        <input type="text" class="list-group-item" id="accountEmail" name="accountEmail"
                               placeholder="아이디"/>
                        <input type="password" class="list-group-item" id="accountPassword" name="accountPassword"
                               placeholder="패스워드"/>

                        <%-- <input type="text" id="userId" name="userId" class="loginInput" value="${userId}" />  --%>
                        <!-- <input type="password" id="passwd" name="passwd" class="loginInput" /> -->
                    </div>
                </div>
            </div>
            <div class="row justify-content-center mt-3">
                <div class="row">
                    <div class="col">
                        <input type="submit" class="btn btn-secondary" value="L O G I N"/>
                    </div>
                </div>
            </div>
        </form>
        <div class="row justify-content-center mt-3">
            <div class="row">
                <div class="col">
                    <a class="badge badge-light" href="javascript:void(0);">비밀번호 찾기 </a>
                </div>
            </div>
            <div class="row ml-1">
                <div class="col">
                    <a class="badge badge-light" href="javascript:void(0);">회원가입</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
