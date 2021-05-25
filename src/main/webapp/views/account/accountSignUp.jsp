<%--
  Created by IntelliJ IDEA.
  User: yys
  Date: 2021-05-25
  Time: 오후 2:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>회원가입</title>
    <style>

        span {
            font-stretch: expanded;
            font-size: 1.2em;
        }

        .inputCus {
            width:300px;
        }
        .container_custom {
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;

        }

        @media (min-width: 768px) {
            .container_custom {
                width: 750px;
            }
        }

        @media (min-width: 992px) {
            .container_custom {
                width: 940px;
            }
        }

        /*사실 이 블럭은 없어도 된다*/
        @media (min-width: 1200px) {
            .container_custom {
                width: 940px;
            }

        }

        .all {
            margin-top: 100px;
        }

        /*.col input {*/
        /*    width: 300px;*/
        /*    max-width: 300px;*/
        /*}*/

        /*.col button {*/
        /*    width: 300px;*/
        /*    max-width: 300px;*/
        /*}*/

        /*.alert {*/
        /*    min-width: 300px;*/
        /*    max-height: 60px;*/
        /*    position: fixed;*/
        /*    display: none*/
        /*}*/


    </style>
</head>
<body class="bg-light">
<div class="all">
    <div class="container_custom">
        <div class="row justify-content-center" style="padding-bottom: 80px">
            <h1>회원가입</h1>
        </div>
        <div class="row justify-content-center">
            <form id="form">

                <div class="row mb-3">
                    <div class="col-3 text-right">
                        <span>아이디</span>
                    </div>
                    <div class="col-3">
                        <input type="text" class="inputCus form-control" placeholder="">
                    </div>
                    <div class="col-6">
                        <button type="button" class="btn btn-warning">중복체크</button>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-3 text-right">
                        <span>이름</span>
                    </div>
                    <div class="col-5">
                        <input type="text" class="inputCus form-control" placeholder="">
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-3 text-right">
                        <span>E-Mail</span>
                    </div>
                    <div class="col-5">
                        <input type="text" class="inputCus form-control" placeholder="">
                    </div>
                </div>

                <div class="row mb-4">
                    <div class="col-3 text-right">
                        <span>패스워드</span>
                    </div>
                    <div class="col-5">
                        <input type="text" class="inputCus form-control" placeholder="">
                    </div>
                </div>

                <div class="row mb-5">
                    <div class="col-5">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="nonMajor" id="nonMajor" value="P">
                            <label class="form-check-label" for="nonMajor">
                                <span>예비 개발자</span>
                            </label>
                        </div>
                    </div>
                    <div class="col-5">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="major" id="major" value="C">
                            <label class="form-check-label" for="major">
                                <span>경력 개발자</span>
                            </label>
                        </div>
                    </div>
                </div>


                <div class="row mb-3">
                    <div class="col">
                        <input type="button" class="btn btn-secondary" value="돌아가기"/>
                        <input type="button" class="btn btn-primary" value="가입하기"/>
                    </div>
                </div>


            </form>
        </div>
    </div>
    <%--div class=container_custom end--%>
</div>
<%--div class=all end--%>
</body>
</html>
