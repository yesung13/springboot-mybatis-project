<%--
  Created by IntelliJ IDEA.
  User: blucean
  Date: 2020-04-29
  Time: 오후 7:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp"%>
<html>
<head>
    <title>home</title>

    <style>
        @import url('https://fonts.googleapis.com/css?family=Gothic+A1|Nanum+Gothic|Noto+Sans+KR&display=swap');

        .fakeimg {
            height: 200px;
            background: #aaa;
        }

        /* 구글 웹폰트 */

        #hr {
            display: block;
            margin-top: 0.5em;
            margin-left: auto;
            margin-right: auto;
            border: 1px solid #000;
        }

        .form-inline {
            font-size: 0.813rem;
        }

        .form-inline a:hover { /*클릭하지 않은 링크*/
            text-decoration: none;
        }

        .form-inline a img {
            vertical-align: middle;
            /* 	width: 2.0em;
            height: 2.0em; */
        }

        .snschat img {
            width: 2.0em;
            height: 2.0em;
        }

        .table th {
            font-family: 'Nanum Gothic', sans-serif;
            font-size: 0.938em;
            font-weight: 700;
        }

        .table td span {
            font-family: 'Gothic A1', sans-serif;
            font-size: 0.938em;
            font-weight: 600;
        }

        .table td a {
            font-family: 'Nanum Gothic', sans-serif;
            font-size: 0.938em;
            font-weight: 700;
            text-decoration: none;
        }

        .table .etc span {
            font-family: 'Gothic A1', sans-serif;
            font-size: 0.813em;
            font-weight: 600;
        }

        .userimg {
            width: 13.0em;
            height: 13.0em;
        }

        .profileimg img {
            width: 8em;
            height: 8em;
        }
    </style>
</head>
<body>
<%-- 헤더 --%>
<jsp:include page="/views/common/header.jsp"/>

<div class="container" style="margin-top:30px">
    <div><h2>${date}</h2></div>
    <div class="row">
        <div class="col-sm-4">
            <h2>About Me</h2>
            <h5>Photo of me:</h5>
            <div class="fakeimg">Fake Image</div>
            <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
            <h3>Some Links</h3>
            <p>Lorem ipsum dolor sit ame.</p>
            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Active</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                </li>
            </ul>
            <hr class="d-sm-none">
        </div>
        <div class="col-sm-8">
            <h2>TITLE HEADING</h2>
            <h5>Title description, Dec 7, 2017</h5>
            <div class="fakeimg">Fake Image</div>
            <p>Some text..</p>
            <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                ullamco.</p>
            <br>
            <h2>TITLE HEADING</h2>
            <h5>Title description, Sep 2, 2017</h5>
            <div class="fakeimg">Fake Image</div>
            <p>Some text..</p>
            <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                ullamco.</p>
        </div>
    </div>
</div>

<%--<footer>--%>
<%--    <div class="jumbotron text-center" style="margin-bottom:0">--%>
<%--        <p>Footer</p>--%>
<%--    </div>--%>
<%--</footer>--%>
<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>

</body>
</html>
