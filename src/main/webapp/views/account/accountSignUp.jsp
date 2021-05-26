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
        img {
            width: 1.2rem;
            height: 1.2rem;
        }

        .spanCus {
            font-stretch: expanded;
            font-size: 1.2rem;
        }

        .inputCus {
            width: 100%;
            height: 50px;

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

        .all {
            margin-top: 100px;
        }

        #form {
            min-width: 760px;
            width: 700px;
            height: 100%;
        }

        /*.alert {*/
        /*    min-width: 300px;*/
        /*    max-height: 60px;*/
        /*    position: fixed;*/
        /*    display: none*/
        /*}*/
    </style>

    <%-- boostrap tooltip 사용--%>
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
    <%-- //bootstrap tooltip --%>





    <script type="text/javascript">
        /* 브라우저가 DOM트리 생성한 직후 실행 */
        //  $(document).ready(function (){} 와 동일
        $(function (){
            $('#signUp_btn').click(function () {
                const userId = $('#userId_duplicateCheck');

               return signUp();
            });


        });
        /* 아이디 중복체크 */
        function userIdDuplicateCheck(){
            $.ajax({
                type: "POST",
                url: requestUrl,
                data: data,
                processData: false,
                contentType: false,
                // cache: false,
                // timeout: 600000,
                success: function (response) {
                    console.log("Insert Response Data:", response);

                    if (response.resCode === 1003) {
                        alert(response.resMsg);
                        location.replace('/account/login');
                    }
                },
                error: function (xhr, e, response) {
                    console.log("Insert Error:", xhr, e, response);
                    alert("에러!!")
                }
            });
        }


        /* 회원가입 완료하여 데이터 전송 */
        function signUp() {
            let requestUrl = '/nAccount/singUpProc';
            let form = $('#form')[0];
            let data = new FormData(form);
            console.log("Insert Request Data:", data);
            $.ajax({
                type: "POST",
                url: requestUrl,
                data: data,
                processData: false,
                contentType: false,
                // cache: false,
                // timeout: 600000,
                success: function (response) {
                    console.log("Insert Response Data:", response);

                    if (response.resCode === 1003) {
                        alert(response.resMsg);
                        location.replace('/account/login');
                    }
                },
                error: function (xhr, e, response) {
                    console.log("Insert Error:", xhr, e, response);
                    alert("에러!!")
                }
            });
        }

        /* 이메일 유효성 검사 */
        function isEmail(asValue) {
            let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
            return regExp.test(asValue); // 형식에 맞는 경우 true 리턴

        }

    </script>

</head>
<body class="bg-light">
<div class="all">
    <div class="container_custom">
        <div class="row navbar navbar-light" style="padding-top: 80px">
            <a class="col navbar-brand" href="/">
                <img src="${pageContext.request.contextPath}/resources/images/cubes-solid.svg"
                     class="d-inline-block align-baseline" alt="logo">
                <span class="d-inline-block align-bottom">Spring Demo</span>
            </a>
        </div>
        <div class="row justify-content-center" style="padding-bottom: 80px">
            <h1>회원가입</h1>
        </div>

        <div class="row justify-content-center">
            <%-- form --%>
            <form id="form" class="border-top border-bottom pl-5">
                <%-- 아이디 --%>
                <div class="row mb-4 pt-4">
                    <div class="col-3 text-left">
                        <button type="button" class="btn mb-2" data-toggle="tooltip" data-placement="top"
                                title="5~20자의 영문 소문자만 사용 가능합니다.">
                            <img src="${pageContext.request.contextPath}/resources/images/exclamation-circle-fill.svg"
                                 alt="ref">
                        </button>
                        <span class="spanCus">아이디</span>
                    </div>
                    <div class="col-5">
                        <input type="text" class="inputCus form-control" name="accountUserId">
                    </div>
                    <div class="col-4">
                        <button type="button" id="userId_duplicateCheck" class="btn btn-warning">중복체크</button>
                    </div>
                </div>
                <%-- //아이디 --%>

                <%--                <div class="row mb-3 border">--%>
                <%--                    <div class="col text-left">--%>
                <%--                        <span>* 이미 사용중인 아이디 입니다</span>--%>
                <%--                    </div>--%>
                <%--                </div>--%>

                <%-- 이름 --%>
                <div class="row mb-4">
                    <div class="col-3 text-left">
                        <button type="button" class="btn mb-2" data-toggle="tooltip" data-placement="top"
                                title="영문/한글만 사용 가능합니다.">
                            <img src="${pageContext.request.contextPath}/resources/images/exclamation-circle-fill.svg"
                                 alt="ref">
                        </button>
                        <span class="spanCus">이름</span>
                    </div>
                    <div class="col-5">
                        <input type="text" class="inputCus form-control" name="accountUserNm">
                    </div>
                </div>
                <%-- //이름 --%>

                <%-- 이메일 --%>
                <div class="row mb-4">
                    <div class="col-3 text-left">
                        <button type="button" class="btn mb-2" data-toggle="tooltip" data-placement="top"
                                title="이메일을 입력해주세요">
                            <img src="${pageContext.request.contextPath}/resources/images/exclamation-circle-fill.svg"
                                 alt="ref">
                        </button>
                        <span class="spanCus">E-Mail</span>
                    </div>
                    <div class="col-5">
                        <input type="text" class="inputCus form-control" name="accountEmail">
                    </div>
                </div>
                <%-- //이메일 --%>

                <%-- 패스워드 --%>
                <div class="row mb-4">
                    <div class="col-3 text-left">
                        <button type="button" class="btn mb-2" data-toggle="tooltip" data-placement="top"
                                title="영문 대 소문자, 특수문자 사용하세요.">
                            <img src="${pageContext.request.contextPath}/resources/images/exclamation-circle-fill.svg"
                                 alt="ref">
                        </button>
                        <span class="spanCus">패스워드</span>
                    </div>
                    <div class="col-5">
                        <input type="password" class="inputCus form-control" name="accountPassword">
                    </div>
                </div>
                <%-- //패스워드 --%>

                <%-- 개발자 구분 - 예비(P), 경력(C) --%>
                <div class="row justify-content-center mb-5 ml-5 pl-1">
                    <div class="col-4">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="devCheck" id="nonMajor" value="P">
                            <label class="form-check-label" for="nonMajor">
                                <span class="spanCus">예비 개발자</span>
                            </label>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="devCheck" id="major" value="C">
                            <label class="form-check-label" for="major">
                                <span class="spanCus">경력 개발자</span>
                            </label>
                        </div>
                    </div>
                </div>
                <%-- //개발자 구분 --%>

                <%-- 가입하기 버튼 --%>
                <div class="row justify-content-start mb-3">
                    <div class="col-3"></div>
                    <div class="col-5">
                        <input type="button" id="signUp_btn" class="inputCus btn btn-primary" value="가입하기"/>
                    </div>
                </div>
                <%-- //가입하기 버튼 --%>
            </form>
            <%-- //form--%>
        </div>

    </div>
    <%-- //div class=container_custom --%>
</div>
<%-- //div class=all --%>
</body>
</html>
