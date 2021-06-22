<%--
  Created by IntelliJ IDEA.
  User: yoonjaeseung
  Date: 2021/06/06
  Time: 9:56 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>설문조사 참여</title>
    <style>
        #loading-mask {
            position: absolute;
            top: auto;
            left: 840px;
            opacity: 0.90;
            filter: alpha(opacity=80);
            z-index: 30000;
            display: none;
            width: 100px;
            height: 100px;
            background: url("../../resources/images/loading.gif") no-repeat;
            background-size: 100px;

        }
    </style>
    <script type="text/javascript">
        $(function () {
            const accountId = jQuery('#accountId').val();
            console.log("accountId:::", accountId);
            // console.log("accountId:::", accountId);

            $('#surveyResult_btn').click(function () {
                window.location.replace("/survey/surveyResults");
            });

            $('#surveyStart_btn').click(function () {
                surveyJoinCk(accountId);
;
            });
        });

        function surveyJoinCk(accountId) {
            if (accountId === "") {
                alert("로그인 후 참여해주세요.")
            } else {
                var data = {};
                data.accountId = accountId;
                data = JSON.stringify(data);
                console.log("data:", data);

                $.ajax({
                    type: "POST",
                    url: "/survey/surveyJoinCk",
                    data: data,
                    dataType: "json",
                    timeout: 3000,
                    contentType: "application/json",
                    beforeSend: function () {
                        // jQuery(this).ajaxStart(function () {
                        //     jQuery("#loading-mask").show();
                        // });
                        // jQuery("#loading-mask").show();
                        jQuery("#loading-mask").fadeIn(400);
                    },
                    success: function (res) {
                        jQuery("#loading-mask").fadeOut(600);
                        console.log("survey join Check result", res);
                        if(res.result === "Y"){
                            alert(res.message);
                        }else if(res.result === "N"){
                            let confirmRes = confirm(res.message);
                            if(confirmRes){
                                window.location.replace("/survey/list")
                            }else{
                                window.location.reload();
                            }
                        }

                    },
                    error: function (xhr) {
                        alert("설문 참여 여부 체크 에러!", xhr);
                    }
                });
            }
        }
    </script>
</head>
<body>
<%-- 헤더(navbar) --%>
<c:import url="/views/common/header.jsp"/>
<%-- security 계정 정보 --%>
<sec:authentication property="principal" var="userInfo"/>
<%-- //security 계정 정보 --%>

<section class="container my-5 py-5">

    <div class="container jumbotron mt-5">
        <div class="align-content-center">
            <div class="row justify-content-center mt-5">
                <div class="col-auto">
                    <div class=""><h1>2021 개발자 실태 설문 조사</h1></div>
                </div>
            </div>
            <div class="row justify-content-center mt-5">
                <div class="d-flex align-content-center">
                    <div class="mr-1">
                        <button type="button" id="surveyStart_btn" class="btn btn-block btn-lg btn-outline-primary">참여하기
                        </button>
                    </div>
                    <div>
                        <button type="button" id="surveyResult_btn" class="btn btn-block btn-lg btn-outline-success">
                            결과보기
                        </button>
                    </div>
                    <input type="hidden" value="${userInfo.accountId}" id="accountId" name="accountId">
                </div>
            </div>
            <div id="loading-mask"></div>
        </div>
    </div>
</section>
</body>
</html>
