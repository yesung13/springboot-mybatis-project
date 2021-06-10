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

        #accountSignUpForm {
            min-width: 760px;
            width: 700px;
            height: 100%;
        }

        .alert {
            min-width: 300px;
            max-height: 60px;
            position: fixed;
            display: none
        }
    </style>

    <%-- boostrap tooltip 사용--%>
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
    <%-- //bootstrap tooltip --%>

    <script type="text/javascript">
        /* 중복체크 확인 여부 변수 선언 */
        let idCk = 'N';

        /* 브라우저가 DOM트리 생성한 직후 실행 */
        //  $(document).ready(function (){} 와 동일
        $(document).ready(function () {
            $('#signUp_btn').click(function () {
                let inputUserId = $('input[name="accountUserId"]').val().replace(/ /g, '');
                let inputUserNm = $('input[name="accountUserNm"]').val().replace(/ /g, '');
                let inputPassword = $('input[name="accountPassword"]').val().replace(/ /g, '');
                let inputEmail = $('input[name="accountEmail"]').val().replace(/ /g, '');

                if (common.isEmpty(inputUserId)) {
                    $('#toast').fadeIn(400).delay(1000).fadeOut(400); //fade out after 3 seconds
                    $('#alertMsg').html("아이디를 입력해 주세요!");
                    $('#accountUserId').val(null).focus();
                    return false;
                }
                if (common.isEmpty(inputUserNm)) {
                    $('#toast').fadeIn(400).delay(1000).fadeOut(400); //fade out after 3 seconds
                    $('#alertMsg').html("이름을 입력해 주세요!");
                    $('#accountUserNm').val(null).focus();
                    return false;
                }
                if (common.isEmpty(inputEmail)) {
                    $('#toast').fadeIn(400).delay(1000).fadeOut(400); //fade out after 3 seconds
                    $('#alertMsg').html("이메일을 입력해 주세요!");
                    $('#accountEmail').val(null).focus();
                    return false;
                }

                if (common.isEmpty(inputPassword)) {
                    $('#toast').fadeIn(400).delay(1000).fadeOut(400); //fade out after 3 seconds
                    $('#alertMsg').html("패스워드를 입력해 주세요!");
                    $('#accountPassword').val(null).focus();
                    return false;
                }

                if (!$('input:checked[name="devCheck"]').is(':checked')) {
                    $('#toast').fadeIn(400).delay(1000).fadeOut(400); //fade out after 3 seconds
                    $('#alertMsg').html("개발자 구분을 선택해주세요.");
                    return false;
                }
                if (!isUserId(inputUserId)) {
                    $('#toast').fadeIn(400).delay(1000).fadeOut(400); //fade out after 3 seconds
                    $('#alertMsg').html("아이디는 영어 소문자,숫자 4-12자리");
                    $('#accountUserId').val(null).focus();
                    return false;
                }

                if (!isName(inputUserNm)) {
                    $('#toast').fadeIn(400).delay(1000).fadeOut(400); //fade out after 3 seconds
                    $('#alertMsg').html("이름은 한글만 입력 가능합니다.");
                    $('#accountUserNm').val(null).focus();
                    return false;
                }

                if (!isEmail(inputEmail)) {
                    $('#toast').fadeIn(400).delay(1000).fadeOut(400); //fade out after 3 seconds
                    $('#alertMsg').html("이메일 형식이 올바르지 않습니다.");
                    $('#accountEmail').val(null).focus();
                    return false;
                }

                if (!isPasswd(inputPassword)) {
                    $('#toast').fadeIn(400).delay(1000).fadeOut(400); //fade out after 3 seconds
                    $('#alertMsg').html("패스워드는 최소 4자리 숫자, 문자, 특수문자 각각 1개 이상 포함.");
                    $('#accountPassword').val(null).focus();
                    return false;
                }

                /* 중복 체크 확인 */
                return signUp(idCk);

            });

            $('#overlap_btn').click(function () {
                let inputUserId = $('#accountUserId').val();
                if (inputUserId.replace(/\s| {2}/gi, "").length === 0) { // 미입력 또는 공백 입력 방
                    alert("아이디를 입력해주세요");
                    $('input[name="accountUserId"]').focus();
                    return false;
                } else {
                    userIdOverlap(inputUserId);
                }
            });

        });

        /* 아이디 중복체크 */
        function userIdOverlap(findUserId) {
            console.log("findUserId: ", findUserId)
            let data = {userId: findUserId};
            $.ajax({
                type: "POST", // 데이터 전송 타입
                url: "/nAccount/userIdOverlap", //데이터를 주고받을 파일 주소 입력
                data: data, // 보내는 데이터
                // processData: false, // 데이터를 queryString 형태로 보내지 않고 DOM 또는 다른 형태로 보낼때 false
                // dataType: "json", // 지정한 형식으로 받기
                contentType: "application/x-www-form-urlencoded; charset=UTF-8", // 필수
                success: function (response) {
                    console.log("Response Data:", response);
                    if (response === 0) {
                        alert("아이디가 존재합니다.\n다른 아이디를 입력해주세요");
                        $('input[name="accountUserId"]').focus();
                        return false;
                    } else if (response === 1) {
                        alert("사용 가능한 아이디 입니다.");
                        idCk = "Y"; // 중복검사 확인 여부: Y
                        console.log("IdCheck:", idCk);
                    }
                },
                error: function (xhr, e, response) {
                    console.log("Error:", xhr, e, response);
                    alert("에러!!")
                }
            });
        }

        /* 아이디 유효성 검사 */
        function isUserId(id) {
            var regex = /^[a-z][a-z\d]{4,12}$/; // 영어 소문자,숫자 4-12자리
            return regex.test(id);
        }

        /* 이름 유효성 검사 */
        function isName(name) {
            var regex = /[가-힣]{2,}/;
            return regex.test(name)
        }

        /* 이메일 유효성 검사 */
        function isEmail(asValue) {
            let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
            return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
        }

        /* 패스워드 유효성 검사 */
        function isPasswd(pw) {
            // var regex = /^[A-Za-z\d]{8,12}$/; // 영어 소문자,숫자 4-12자리
            var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{4,}$/; // 최소 4자리에 숫자, 문자, 특수문자 각각 1개 이상 포함
            return regex.test(pw);
        }

        /* 회원가입 완료하여 데이터 전송 */
        function signUp(idCk) {


            console.log("IdCheck:", idCk);

            if (idCk === "N") {
                alert("아이디 중복체크를 해주세요");
                return false;
            } else if (idCk === "Y") {
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
                            location.replace('/nAccount/login');
                        }
                    },
                    error: function (xhr, e, response) {
                        console.log("Insert Error:", xhr, e, response);
                        alert("에러!!")
                    }
                });
            }
        }

        var common = {
            isNotEmpty: function (_str) {
                obj = String(_str);
                if (obj == null || obj == undefined || obj == 'null' || obj == 'undefined' || obj == '') return false;
                else return true;
            },
            isEmpty: function (_str) {
                return !common.isNotEmpty(_str);
            }
        }

    </script>

</head>
<body class="bg-light">
<div class="all">
    <div class="container_custom">
        <div class="row navbar navbar-light" style="padding-top: 20px">
            <a class="col navbar-brand" href="/">
                <img src="${pageContext.request.contextPath}/resources/images/cubes-solid.svg"
                     class="d-inline-block align-baseline" alt="logo">
                <span class="d-inline-block align-bottom">Spring Demo</span>
            </a>
        </div>

        <div class="row justify-content-center pb-5">
            <h1>회원가입</h1>
        </div>
        <div class="row mb-5  justify-content-center">
            <%-- 유효성 검사 토스트 창 --%>
            <div class="alert alert-danger text-center" role="alert" id="toast">
                <span id="alertMsg"></span>
            </div>
            <%-- //유효성 검사 토스트 창 --%>
        </div>

        <div class="row justify-content-center">
            <%-- form --%>
            <form id="accountSignUpForm" class="border-top border-bottom pl-5">
                <%-- 아이디 --%>
                <div class="row mb-4 pt-4">
                    <div class="col-3 text-left">
                        <button type="button" class="btn mb-2" data-toggle="tooltip" data-placement="top"
                                title="영어 소문자,숫자 4-12자리">
                            <img src="${pageContext.request.contextPath}/resources/images/exclamation-circle-fill.svg"
                                 alt="ref">
                        </button>
                        <span class="spanCus">아이디</span>
                    </div>
                    <div class="col-5">
                        <input type="text" class="inputCus form-control" id="accountUserId" name="accountUserId">
                    </div>
                    <div class="col-4">
                        <button type="button" id="overlap_btn" class="btn btn-warning">중복체크</button>
                    </div>
                </div>
                <%-- //아이디 --%>

                <%-- 이름 --%>
                <div class="row mb-4">
                    <div class="col-3 text-left">
                        <button type="button" class="btn mb-2" data-toggle="tooltip" data-placement="top"
                                title="한글만 사용 가능합니다.">
                            <img src="${pageContext.request.contextPath}/resources/images/exclamation-circle-fill.svg"
                                 alt="ref">
                        </button>
                        <span class="spanCus">이름</span>
                    </div>
                    <div class="col-5">
                        <input type="text" class="inputCus form-control" name="accountUserNm" id="accountUserNm">
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
                        <input type="text" class="inputCus form-control" name="accountEmail" id="accountEmail">
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
                        <input type="password" class="inputCus form-control" name="accountPassword"
                               id="accountPassword">
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
