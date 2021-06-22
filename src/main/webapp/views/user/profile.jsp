<%--
  Created by IntelliJ IDEA.
  User: yys
  Date: 2021-06-18
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>마이페이지</title>
</head>
<style>
    body {
        background: #043041;
        height: 100vh;
    }

    img {
        width: 3rem;
        height: 2rem;
    }

    .spanCus {
        font-stretch: expanded;
        font-size: 1.2rem;
        color: #f8f9fa;
    }

    .inputCus {
        width: 100%;
        height: 50px;

    }

    #accountInfoForm {
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
<body>
<%-- security 계정 정보 --%>
<sec:authentication property="principal" var="userInfo"/>
<%-- //security 계정 정보 --%>
<div class="container-fluid">
    <div class="row navbar navbar-light" style="padding-top: 20px">
        <a class="col navbar-brand" href="/">
            <img src="${pageContext.request.contextPath}/resources/images/spring-logo.png"
                 class="d-inline-block align-baseline" alt="logo">
            <span class="d-inline-block align-bottom text-light">Spring Demo</span>
        </a>
    </div>
    <div class="pt-5 mt-5 text-center">
        <i class="fas fa-user-friends fa-7x my-5 text-success"></i>
        <div class="row justify-content-center text-light">
            <h1>회원 프로필</h1>
        </div>

    </div>
    <div>
        <div>
            <div class="row justify-content-center pt-3">
                <%-- form --%>
                <form id="accountInfoForm" class="border-top border-bottom pl-5">
                    <input type="hidden" value="${userInfo.accountId}" name="accountId">
                    <%-- 아이디 --%>
                    <div class="row mb-4 pt-4">
                        <div class="col-3 text-left">
                            <span class="spanCus">아이디</span>
                        </div>
                        <div class="col-5">
                            <input type="text" class="inputCus form-control" id="accountUserId" name="accountUserId"
                                   value="${userInfo.username}" readonly>
                        </div>
                        <div class="col-4">
                            <c:if test="${userInfo.devCheck eq 'C'}">
                                <h3 class="text-primary">[경력개발자]</h3>
                            </c:if>
                            <c:if test="${userInfo.devCheck eq 'P'}">
                                <h3 class="text-primary">[예비개발자]</h3>
                            </c:if>

                        </div>
                    </div>
                    <%-- //아이디 --%>

                    <%-- 패스워드 --%>
                    <%--                    <div class="row mb-4">--%>
                    <%--                        <div class="col-3 text-left">--%>
                    <%--                            <span class="spanCus">패스워드</span>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="col-5">--%>
                    <%--                            <input type="password" class="inputCus form-control" name="accountPassword"--%>
                    <%--                                   id="accountPassword" readonly>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <%-- //패스워드 --%>

                    <%-- 이름 --%>
                    <div class="row mb-4">
                        <div class="col-3 text-left">
                            <span class="spanCus">이름</span>
                        </div>
                        <div class="col-5">
                            <input type="text" class="inputCus form-control" name="accountUserNm" id="accountUserNm"
                                   value="${userInfo.accountUserNm}" readonly>
                        </div>
                    </div>
                    <%-- //이름 --%>

                    <%-- 이메일 --%>
                    <div class="row mb-4">
                        <div class="col-3 text-left">
                            <span class="spanCus">E-Mail</span>
                        </div>
                        <div class="col-5">
                            <input type="text" class="inputCus form-control" name="accountEmail" id="accountEmail"
                                   value="${userInfo.accountEmail}" readonly>
                        </div>
                    </div>
                    <%-- //이메일 --%>

                    <%-- 회원탈퇴 버튼 --%>
                    <div class="row justify-content-start mb-3">
                        <div class="col-3"></div>
                        <div class="col-5">
                            <input type="button" id="delAccount_btn" class="inputCus btn btn-danger" value="회원탈퇴"/>
                        </div>
                    </div>
                    <%-- //회원탈퇴 버튼 --%>

                </form>
                <%-- //form--%>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $('#delAccount_btn').click(function () {
        if (confirm("회원 탈퇴를 진행하시겠습니까?")) {
            return delAccount();
        } else {
            return false;
        }
    });

    function delAccount() {
        let requestUrl = '/nAccount/delAccountProc';
        let form = $('#accountInfoForm')[0];
        let data = new FormData(form);
        console.log("Insert Request Data:", data);
        $.ajax({
            type: "POST",
            url: requestUrl,
            data: data,
            processData: false,
            contentType: false,
            // cache:"false", // 브라우저 캐쉬 막기
            success: function (response) {
                console.log("Delete Account Response Data:", response);

                if (response.resCode === 1004) {
                    alert(response.resMsg);
                    location.replace('/nAccount/login');
                } else if (response.resCode === -1) {
                    alert(response.resMsg);
                    location.reload();
                }
            },
            error: function (xhr, e, response) {
                console.log("Delete Account Error:", xhr, e, response);
                if (response.resCode === -1) {
                    alert(response.resMsg);
                }
            }
        });
    }

</script>
