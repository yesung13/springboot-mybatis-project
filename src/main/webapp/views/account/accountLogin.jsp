<%--
  Created by IntelliJ IDEA.
  User: blucean
  Date: 2020-06-01
  Time: 오후 4:48
  To change this template use File | Settings | File Templates.
--%>
<%-- 인프런 실습 시 사용--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>

    <title>로그인</title>
    <style>
        a img {
            width: 5.0rem;
            height: 3.0rem;
        }

        a span {
            font-stretch: expanded;
            font-size: 2.0rem;
        }

        .all {
            margin-top: 100px;
        }

        .col input {
            width: 300px;
            max-width: 300px;
        }

        .col button {
            width: 300px;
            max-width: 300px;
        }

        .alert {
            min-width: 300px;
            max-height: 60px;
            position: fixed;
            display: none;
        }

        .errorAlert {
            min-width: 300px;
            max-height: 60px;
            position: fixed;
            display: none;
            padding: 0.75rem 1.25rem;
            margin-bottom: 1rem;
            border: 1px solid transparent;
            border-radius: 0.25rem;
        }


    </style>
    <script type="text/javascript">

        $(document).ready(function () {
            let login_btn = $('#login_btn');
            let inputId = $('#accountUserId')
            let inputPw = $('#accountPassword');

            // 로그인 submit
            login_btn.click(function () {

                let accountUserId = $('input[name="accountUserId"]').val().replace(/ /g, ''); // 모든 공백 제거
                let accountPassword = $('input[name="accountPassword"]').val().replace(/ /g, '');

                if (isEmpty(accountUserId)) {
                    $('.alert').fadeIn(400).delay(1000).fadeOut(400); //fade out after 3 seconds
                    $('#alertMsg').html("아이디를 입력해 주세요!");
                    // alert("아이디를 입력해 주세요!");
                    inputId.val(null).focus();

                    return false;
                }

                if (isEmpty(accountPassword)) {
                    $('.alert').fadeIn(400).delay(1000).fadeOut(400); //fade out after 3 seconds
                    $('#alertMsg').html("패스워드를 입력해 주세요!");
                    // alert("패스워드를 입력해 주세요!");
                    inputPw.val(null).focus();
                    return false;
                }
            });

            // 로그인 후 실패 에러
            let errorMsg = '<c:out value="${requestScope.loginFailMsg}"/>';
            let getFlag = '<c:out value="${requestScope.flag}"/>';

            if (getFlag === "Y") {
                $('.errorAlert').fadeIn(400).delay(2000).fadeOut(400);
                $('#showError').html(errorMsg);
            }

        });

        // 값 체크
        let isEmpty = function (value) {
            return value === "" || value == null;
        }

    </script>
    <%-- end --%>
</head>
<body class="bg-light">
<div class="all">
    <div class="container">
        <div class="row justify-content-center">
            <%-- 유효성 검사 토스트 창 --%>
            <div class="alert alert-danger text-center" role="alert">
                <span id="alertMsg"></span>
            </div>
            <%-- //유효성 검사 토스트 창 --%>

            <%-- 로그인 후 실패 에러 창 --%>
            <div class="errorAlert alert-danger text-center">
                <span id="showError"></span>
            </div>
            <%-- //로그인 후 실패 에러 창 --%>

            <div class="row navbar navbar-light" style="padding-top: 80px">
                <a class="col navbar-brand" href="/home">
                    <img src="${pageContext.request.contextPath}/resources/images/spring-logo.png"
                         class="d-inline-block align-baseline" alt="logo">
                    <span class="d-inline-block align-bottom">Spring Demo</span>
                </a>
            </div>

        </div>
        <%--        <form id="form">  &lt;%&ndash;security 적용 전&ndash;%&gt;--%>
        <form id="loginForm" action="<c:url value="/nAccount/login"/>" method="POST">
            <div class="row justify-content-center">
                <div class="list-group row">
                    <div class="col">
                        <%--                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
                        <input type="text" class="list-group-item" id="accountUserId" name="accountUserId"
                               placeholder="아이디"/>
                        <input type="password" class="list-group-item" id="accountPassword" name="accountPassword"
                               placeholder="패스워드"/>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center mt-3">
                <div class="row">
                    <div class="col">
                        <%-- security 적용 전--%>
                        <%--                        <input type="button" id="login_btn" class="btn btn-secondary" value="L O G I N"/>--%>
                        <input type="submit" id="login_btn" class="btn btn-secondary" value="L O G I N"/>
                    </div>
                </div>
            </div>
        </form>
        <div class="row justify-content-center mt-3">
            <div class="row">
                <div class="col">
                    <a class="badge badge-light" href="javascript:void(0);">비밀번호 찾기</a>
                </div>
            </div>
            <div class="row ml-1">
                <div class="col">
                    <a class="badge badge-light" href="${pageContext.request.contextPath}/nAccount/signUp">회원가입</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
