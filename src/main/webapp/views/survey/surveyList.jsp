<%--
  Created by IntelliJ IDEA.
  User: yys
  Date: 2021-05-28
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html lang="en">
<head>
    <title>개발자 실태조사 설문</title>
    <style>
        #partTab .nav-link:hover {
            color: #0062cc !important;
        }

        .spanCus {
            font-stretch: condensed;
            font-size: 1.0rem;
        }

        .itemTitle {
            font-family: "NanumBarunGothicBold", sans-serif !important;
            font-size: large;
            color: #000000;
        }

        .itemTitle span {
            font-size: small;
            color: #0062cc;
        }

        .itemTitle .required {
            font-size: xx-large;
            color: #dc3545;
        }

        .btnCus {
            width: 200px;
        }

        #title img {
            width: 2.7em;
            height: 2.7em;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            console.log("start");
            getSurveyList();


        });

        /* tab 페이지 컨트롤 */
        function pageCtrl_btn(btn_id) {
            console.log(btn_id);
            const $PART1_TAB = jQuery('#part1_tab');
            const $PART2_TAB = jQuery('#part2_tab');
            const $PART3_TAB = jQuery('#part3_tab');

            if (btn_id === 'next_1') {
                $PART1_TAB.click();
            } else if (btn_id === 'next_2') {
                $PART2_TAB.click();
            } else if (btn_id === 'next_3') {
                $PART3_TAB.click();
            } else if (btn_id === 'back_1') {
                $PART1_TAB.click();
            } else if (btn_id === 'back_2') {
                $PART2_TAB.click();
            } else if (btn_id === 'next_end') {
                saveSurveyList();
            }
        }

        /* checkbox 최대 갯수 체크 */
        function ckBxCtrl(groupCd) {
            console.log("groupCode: ", groupCd);
            if (groupCd === "P106") {
                let $count = jQuery('input:checkbox[name ="P106"]:checked');
                if ($count.length > 1) {
                    $count.prop("checked", false);
                    alert("1개만 선택 가능");
                }
            } else if (groupCd === "P301") {
                let $count = jQuery('input:checkbox[name ="P301"]:checked');
                if ($count.length > 2) {
                    $count.prop("checked", false);
                    alert("최대 2개까지만 선택 가능");
                }
            } else if (groupCd === "P302") {
                let $count = jQuery('input:checkbox[name ="P302"]:checked');
                if ($count.length > 2) {
                    $count.prop("checked", false);
                    alert("최대 2개까지만 선택 가능");
                }
            }
        }/* //checkbox 최대 갯수 체크 */

        /* 설문 항목 가져오기 */
        function getSurveyList() {
            $.ajax({
                method: 'GET',
                url: '/survey/listProc',
                dataType: 'json',
                success: function (res) {
                    console.log("success: ", res);
                    //변수 선언
                    let part101 = '';
                    let part102 = '';
                    let part103 = '';
                    let part104 = '';
                    let part105 = '';
                    let part106 = '';
                    let part201 = '';
                    let part202 = '';
                    let part203 = '';
                    let part301 = '';
                    let part302 = '';

                    $.each(res, function (idx, item) {
                        let groupCd = item.groupCd;
                        let itemCd = item.itemCd;
                        let itemNm = item.itemNm;
                        let itemComm = item.itemComm;

                        /* Part1. 개발자 정보 */
                        if (groupCd === 'P101') {
                            part101 += '<div class="form-check form-check-inline ml-4">'
                                + '<input class="form-check-input" type="radio" name="' + groupCd + '" id="' + itemComm + '" value="' + itemCd + '">'
                                + '<label class="form-check-label" for="' + itemComm + '"><span class="spanCus">' + itemNm + '</span></label>'
                                + '</div>';
                        } else if (groupCd === 'P102') {
                            part102 += '<div class="form-check form-check-inline ml-4">'
                                + '<input class="form-check-input" type="radio" name="' + groupCd + '" id="' + itemComm + '" value="' + itemCd + '">'
                                + '<label class="form-check-label" for="' + itemComm + '"><span class="spanCus">' + itemNm + '</span></label>'
                                + '</div>';
                        } else if (groupCd === 'P103') {
                            part103 += '<div class="form-check form-check-inline ml-4">'
                                + '<input class="form-check-input" type="radio" name="' + groupCd + '" id="' + itemComm + '" value="' + itemCd + '">'
                                + '<label class="form-check-label" for="' + itemComm + '"><span class="spanCus">' + itemNm + '</span></label>'
                                + '</div>';
                        } else if (groupCd === 'P104') {
                            part104 += '<div class="form-check form-check-inline ml-4">'
                                + '<input class="form-check-input" type="radio" name="' + groupCd + '" id="' + itemComm + '" value="' + itemCd + '">'
                                + '<label class="form-check-label" for="' + itemComm + '"><span class="spanCus">' + itemNm + '</span></label>'
                                + '</div>';
                        } else if (groupCd === 'P105') {
                            part105 += '<div class="form-check mb-2">'
                                + '<input class="form-check-input" type="radio" name="' + groupCd + '" id="' + itemComm + '" value="' + itemCd + '">'
                                + '<label class="form-check-label" for="' + itemComm + '"><span class="spanCus">' + itemNm + '</span></label>'
                                + '</div>';
                        } else if (groupCd === 'P106') {
                            part106 += '<div class="form-check form-check-inline mx-4 my-2">'
                                + '<input class="form-check-input" type="checkbox" name="' + groupCd + '" id="' + itemComm + '" value="' + itemCd + '" onclick=ckBxCtrl("' + groupCd + '")>'
                                + '<label class="form-check-label" for="' + itemComm + '"><span class="spanCus">' + itemNm + '</span></label>'
                                + '</div>';

                        }/* //Part1. 개발자 정보 */

                        /* Part2. 개발 시 사용하는 OS / DB / 에디터  */
                        else if (groupCd === 'P201') {
                            part201 += '<div class="form-check form-check-inline ml-4">'
                                + '<input class="form-check-input" type="radio" name="' + groupCd + '" id="' + itemComm + '" value="' + itemCd + '">'
                                + '<label class="form-check-label" for="' + itemComm + '"><span class="spanCus">' + itemNm + '</span></label>'
                                + '</div>'
                        } else if (groupCd === 'P202') {
                            part202 += '<div class="form-check form-check-inline ml-4">'
                                + '<input class="form-check-input" type="radio" name="' + groupCd + '" id="' + itemComm + '" value="' + itemCd + '">'
                                + '<label class="form-check-label" for="' + itemComm + '"><span class="spanCus">' + itemNm + '</span></label>'
                                + '</div>'
                        } else if (groupCd === 'P203') {
                            part203 += '<div class="form-check form-check-inline ml-4">'
                                + '<input class="form-check-input" type="radio" name="' + groupCd + '" id="' + itemComm + '" value="' + itemCd + '">'
                                + '<label class="form-check-label" for="' + itemComm + '"><span class="spanCus">' + itemNm + '</span></label>'
                                + '</div>'
                        }/* //Part2. 개발 시 사용하는 OS / DB / 에디터  */

                        /* Part3. 개발 시 사용하는 프로그래밍 언어  */
                        else if (groupCd === 'P301') {
                            part301 += '<div class="form-check form-check-inline mx-4 my-2">'
                                + '<input class="form-check-input" type="checkbox" name="' + groupCd + '" id="' + itemComm + '" value="' + itemCd + '" onclick=ckBxCtrl("' + groupCd + '")>'
                                + '<label class="form-check-label" for="' + itemComm + '"><span class="spanCus">' + itemNm + '</span></label>'
                                + '</div>';
                        } else if (groupCd === 'P302') {
                            part302 += '<div class="form-check form-check-inline mx-4 my-2">'
                                + '<input class="form-check-input" type="checkbox" name="' + groupCd + '" id="' + itemComm + '" value="' + itemCd + '" onclick=ckBxCtrl("' + groupCd + '")>'
                                + '<label class="form-check-label" for="' + itemComm + '"><span class="spanCus">' + itemNm + '</span></label>'
                                + '</div>';
                        } else {/* //Part3. 개발 시 사용하는 프로그래밍 언어  */
                            console.error("Response Error")
                            alert("데이터가 없습니다.")
                            return false;
                        }

                    });//each end
                    $('.itemOutput101').html(part101);
                    $('.itemOutput102').html(part102);
                    $('.itemOutput103').html(part103);
                    $('.itemOutput104').html(part104);
                    $('.itemOutput105').html(part105);
                    $('.itemOutput106').html(part106);
                    $('.itemOutput201').html(part201);
                    $('.itemOutput202').html(part202);
                    $('.itemOutput203').html(part203);
                    $('.itemOutput301').html(part301);
                    $('.itemOutput302').html(part302);

                },
                error: function (xhr, e, response) {
                    console.log("Error:", xhr, e, response);
                    alert("에러!!")
                }

            });//ajax end
        }/* //설문 항목 가져오기 */

        /* 설문 항목 저장 */
        function saveSurveyList() {
            let form = $('#form').serializeArray();
            let data = JSON.stringify(form);

            console.log("Insert Request data:", data);
            console.log("Insert Request form:", form);
            $.ajax({
                type: "POST",
                url: "/survey/saveListProc",
                data: data,
                dataType: 'json',
                contentType: "application/json",
                // timeout: 6000,
                success: function (response) {
                    console.log("Insert Response Data:", response);
                    if (response.resCode === 200) {
                        alert(response.resMsg);
                        location.replace('/');
                    } else if (response.resCode === -1) {
                        alert(response.resMsg);
                    }
                },
                error: function (xhr, e, response) {
                    console.log("Insert Error:", xhr, e, response);
                    alert("에러!!")
                }
            });
        }/* //설문 항목 저장 */
    </script>

</head>
<body>
<%-- 헤더(navbar) --%>
<c:import url="/views/common/header.jsp"/>
<%-- 바디 --%>
<section class="container-xl mt-3">
    <input id="sessionUid" type="hidden" value="${sessionScope.account.accountId}" name="accountId">
    <div class="my-5"><h1>2021 개발자 실태 조사</h1></div>
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" id="partTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="part1_tab" data-toggle="tab" href="#part1" role="tab"
               aria-controls="part1" aria-selected="true">Part1. 개발자 정보
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="part2_tab" data-toggle="tab" href="#part2" role="tab" aria-controls="part2"
               aria-selected="false">Part2. 개발 시 사용하는 OS / DB / 에디터</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="part3_tab" data-toggle="tab" href="#part3" role="tab" aria-controls="part3"
               aria-selected="false">Part3. 개발 시 사용하는 프로그래밍 언어</a>
        </li>
    </ul>

    <!-- Tab panes -->
    <form id="form">
        <input type="hidden" value="${sessionScope.account.accountId}" name="accountId">
        <div class="tab-content">


            <%-- part1. 개발자 정보 --%>
            <div class="tab-pane fade show active" id="part1" role="tabpanel" aria-labelledby="part1_tab">
                <%-- 질의 항목 --%>
                <div class="container jumbotron mt-1">
                    <%-- 타이틀 --%>
                    <div id="title"><img src="<c:url value="/resources/images/people.svg"/>" alt="people">
                        <h2>Part1. 개발자 정보</h2>
                    </div>
                    <%-- //타이틀 --%>

                    <div class="mt-5 mb-3"><span class="text-danger">* 필수</span></div>

                    <%-- P101 그룹 --%>
                    <div class="mb-5">
                        <p class="itemTitle">Q1. 전공 / 비전공자인지 선택해주세요. <span class="required">*</span></p>
                        <div class="itemOutput101 form-group"></div>
                    </div>
                    <%-- //P101 그룹 --%>

                    <%-- P102 그룹 --%>
                    <div class="mb-5">
                        <p class="itemTitle">Q2. 비전공자일 경우 학습하신 방법을 선택해주세요. <span>[비전공자만 선택]</span></p>
                        <div class="itemOutput102 form-group"></div>
                    </div>
                    <%-- //P102 그룹 --%>

                    <%-- P103 그룹 --%>
                    <div class="mb-5">
                        <p class="itemTitle">Q3. 연령대를 선택해주세요. <span class="required">*</span></p>
                        <div class="itemOutput103 form-group"></div>
                    </div>
                    <%-- //P103 그룹 --%>

                    <%-- P104 그룹 --%>
                    <div class="mb-5">
                        <p class="itemTitle">Q4. 경력을 알려주세요. <span>[경력 개발자만 선택]</span></p>
                        <div class="itemOutput104 form-group"></div>
                    </div>
                    <%-- //P104 그룹 --%>

                    <%-- P105 그룹 --%>
                    <div class="mb-5">
                        <p class="itemTitle">Q5. 현재 연 소득 범위를 선택해주세요. <span>[경력 개발자만 선택]</span></p>
                        <div class="itemOutput105 form-group ml-4"></div>
                    </div>
                    <%-- //p105 그룹 --%>

                    <%-- P106 그룹 --%>
                    <div class="mb-5">
                        <p class="itemTitle">Q6. 현재 직무는 무엇인가요? <span>[경력 개발자만 선택]</span></p>
                        <div class="card w-75 h-auto">
                            <div class="card-body">
                                <div class="itemOutput106 form-group"></div>
                            </div>
                        </div>
                    </div>
                    <%-- //P106 그룹 --%>
                    <%-- button --%>
                    <div class="row justify-content-end mt-5">
                        <div class="col-5 mt-5">
                            <button type="button" class="btnCus btn btn-lg btn-primary float-right" id="next_2"
                                    onclick="pageCtrl_btn(this.id)"><span>다음</span>
                            </button>
                        </div>
                    </div>
                    <%-- //button --%>
                </div>
                <%-- //질의 항목 --%>

            </div>
            <%-- //part1. 개발자 정보 --%>

            <%-- part2. 개발 시 사용하는 OS / DB / 에디터 --%>
            <div class="tab-pane fade" id="part2" role="tabpanel" aria-labelledby="part2_tab">
                <%-- 질의 항목 --%>
                <div class="container jumbotron mt-1">
                    <%-- 타이틀 --%>
                    <div id="title"><img src="<c:url value="/resources/images/gear.svg"/>" alt="people">
                        <h2>Part2. 개발 시 사용하는 OS / DB / 에디터</h2>
                    </div>
                    <%-- //타이틀 --%>

                    <div class="mt-5 mb-3"><span class="text-danger">* 필수</span></div>

                    <%-- P201 그룹 --%>
                    <div class="mb-5">
                        <p class="itemTitle">Q1. 주로 사용하는 OS는 무엇인가요? <span class="required">*</span></p>
                        <div class="itemOutput201 form-group"></div>
                    </div>
                    <%-- //P201 그룹 --%>

                    <%-- P202 그룹 --%>
                    <div class="mb-5">
                        <p class="itemTitle">Q2. 주로 사용하는 DB는 무엇인가요? <span class="required">*</span></p>
                        <div class="itemOutput202 form-group"></div>
                    </div>
                    <%-- //P202 그룹 --%>

                    <%-- P203 그룹 --%>
                    <div class="mb-5">
                        <p class="itemTitle">Q3. 주로 사용하는 에디터는 무엇인가요? <span class="required">*</span></p>
                        <div class="itemOutput203 form-group"></div>
                    </div>
                    <%-- //P203 그룹 --%>
                    <%-- button --%>
                    <div class="row justify-content-end mt-5">
                        <div class="col-5 mt-5">
                            <button type="button" class="btnCus btn btn-lg btn-secondary" id="back_1"
                                    onclick="pageCtrl_btn(this.id)"><span>이전</span></button>
                            <button type="button" class="btnCus btn btn-lg btn-primary float-right" id="next_3"
                                    onclick="pageCtrl_btn(this.id)"><span>다음</span></button>
                        </div>
                    </div>
                    <%-- //button --%>
                </div>
                <%-- //질의 항목 --%>
            </div>
            <%-- //part2. 개발 시 사용하는 OS / DB / 에디터 --%>

            <%-- part3. 개발 시 사용하는 프로그래밍 언어 --%>
            <div class="tab-pane fade" id="part3" role="tabpanel" aria-labelledby="part3_tab">
                <%-- 질의 항목 --%>
                <div class="container jumbotron mt-1">
                    <%-- 타이틀 --%>
                    <div id="title"><img src="<c:url value="/resources/images/lang.svg"/>" alt="people">
                        <h2>Part3. 개발 시 사용하는 프로그래밍 언어</h2>
                    </div>
                    <%-- //타이틀 --%>

                    <div class="mt-5 mb-3"><span class="text-danger">* 필수</span></div>

                    <%-- P301그룹 --%>
                    <div class="mb-5">
                        <p class="itemTitle">Q1. 자신있는 프로그래밍 언어를 선택해주세요. <span
                                class="required">*</span><span>[최대 2개 선택]</span></p>
                        <div class="card w-75 h-auto">
                            <div class="card-body">
                                <div class="itemOutput301 form-group"></div>
                            </div>
                        </div>
                    </div>
                    <%-- //P301 그룹 --%>

                    <%-- P302 그룹 --%>
                    <div class="mb-5">
                        <p class="itemTitle">Q2. 배워보고 싶은 프로그래밍 언어를 선택해주세요. <span
                                class="required">*</span><span>[최대 2개 선택]</span></p>
                        <div class="card w-75 h-auto">
                            <div class="card-body">
                                <div class="itemOutput302 form-group"></div>
                            </div>
                        </div>
                    </div>
                    <%-- //P302 그룹 --%>
                    <%-- button --%>
                    <div class="row justify-content-end mt-5">
                        <div class="col-5 mt-5">
                            <button type="button" class="btnCus btn btn-lg btn-secondary" id="back_2"
                                    onclick="pageCtrl_btn(this.id)"><span>이전</span></button>
                            <button type="button" class="btnCus btn btn-lg btn-primary float-right " id="next_end"
                                    onclick="pageCtrl_btn(this.id)"><span>완료</span></button>
                        </div>
                    </div>
                    <%-- //button --%>
                </div>
                <%-- //질의 항목 --%>
            </div>
            <%-- //part3. 개발 시 사용하는 프로그래밍 언어 --%>

        </div>
    </form>


</section>
<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>
