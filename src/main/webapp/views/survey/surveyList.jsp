<%--
  Created by IntelliJ IDEA.
  User: yys
  Date: 2021-05-28
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>개발자 실태조사 설문</title>
    <style>
        #partTab .nav-link:hover {
            color: #a71d2a !important;
        }

        .spanCus {
            font-stretch: condensed;
            font-size: 1.0rem;
        }

        .itemTitle {
            font-family: "NanumBarunGothicBold", sans-serif !important;
            font-size: large;
            color: #0062cc;
        }
    </style>
</head>
<body>
<%-- 헤더(navbar) --%>
<c:import url="/views/common/header.jsp"/>
<%-- 바디 --%>
<section class="container mt-3">
    <div class="my-5"><h1>2021 개발자 실태 조사</h1></div>
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" id="partTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="part1_tab" data-toggle="tab" href="#part1" role="tab"
               aria-controls="part1" aria-selected="true">Part1. 개발자 정보</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="part2_tab" data-toggle="tab" href="#part2" role="tab" aria-controls="part2"
               aria-selected="false">Part2. 개발 시 사용하는 OS / DB / 에디터</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="part3_tab" data-toggle="tab" href="#part3" role="tab" aria-controls="part3"
               aria-selected="false">Part3. 프로그래밍 언어와 프레임워크 및 라이브러리</a>
        </li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <%-- part1. 개발자 정보 --%>
        <div class="tab-pane fade show active" id="part1" role="tabpanel" aria-labelledby="part1_tab">
            <%-- 질의 항목 --%>
            <div class="container jumbotron mt-1">

                <%-- p001 그룹 --%>
                <div class="mb-5">
                    <p class="itemTitle">Q1. 전공 / 비전공자인지 선택해주세요.</p>
                    <div class="form-group ml-4">

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="p001" id="major" value="MAJ">
                            <label class="form-check-label" for="major"><span class="spanCus">전공</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p001" id="nMajor" value="NMAJ">
                            <label class="form-check-label" for="nMajor"><span class="spanCus">비전공</span></label>
                        </div>

                    </div>
                </div>
                <%-- //p001 그룹 --%>

                <%-- p002 그룹 --%>
                <div class="mb-5">
                    <p class="itemTitle">Q2. 비전공자일 경우 학습하신 방법을 선택해주세요. <span class="text-danger">(비전공자만 선택)</span></p>
                    <div class="form-group ml-4">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="p002" id="academy" value="ACA">
                            <label class="form-check-label" for="academy"><span class="spanCus">학원</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p002" id="study" value="STU">
                            <label class="form-check-label" for="study"><span class="spanCus">스터디</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p002" id="onlineLecture"
                                   value="ONL">
                            <label class="form-check-label" for="onlineLecture"><span
                                    class="spanCus">온라인 강의</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p002" id="selfLearning" value="SEF">
                            <label class="form-check-label" for="selfLearning"><span
                                    class="spanCus">혼자 학습</span></label>
                        </div>

                    </div>
                </div>

                <%-- //p002 그룹 --%>

                <%-- p003 그룹 --%>
                <div class="mb-5">
                    <p class="itemTitle">Q3. 연령대를 선택해주세요.</p>
                    <div class="form-group ml-4">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="p003" id="ageUnder20" value="AGE1">
                            <label class="form-check-label" for="ageUnder20"><span class="spanCus">20세 미만</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p003" id="age2030" value="AGE2">
                            <label class="form-check-label" for="age2030"><span class="spanCus">20-30대</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p003" id="age3040" value="AGE3">
                            <label class="form-check-label" for="age3040"><span class="spanCus">30-40대</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p003" id="age4050" value="AGE4">
                            <label class="form-check-label" for="age4050"><span
                                    class="spanCus">40-50대</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p003" id="age50AndOver"
                                   value="AGE5">
                            <label class="form-check-label" for="age50AndOver"><span
                                    class="spanCus">50세 이상</span></label>
                        </div>

                    </div>
                </div>

                <%-- //p003 그룹 --%>

                <%-- p004 그룹 --%>
                <div class="mb-5">
                    <p class="itemTitle">Q4. 경력을 알려주세요. <span class="text-danger">(경력 개발자만 선택)</span></p>
                    <div class="form-group ml-4">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="p004" id="1stYear" value="CAR1">
                            <label class="form-check-label" for="1stYear"><span class="spanCus">1년차</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-3" type="radio" name="p004" id="2ndYear" value="CAR2">
                            <label class="form-check-label" for="2ndYear"><span class="spanCus">2년차</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-3" type="radio" name="p004" id="3rdYear" value="CAR3">
                            <label class="form-check-label" for="3rdYear"><span class="spanCus">3년차</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-3" type="radio" name="p004" id="4thYear" value="CAR4">
                            <label class="form-check-label" for="4thYear"><span class="spanCus">4년차</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-3" type="radio" name="p004" id="5thYear" value="CAR5">
                            <label class="form-check-label" for="5thYear"><span class="spanCus">5년차</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-3" type="radio" name="p004" id="6thYear" value="CAR6">
                            <label class="form-check-label" for="6thYear"><span class="spanCus">6년차</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-3" type="radio" name="p004" id="7thYear" value="CAR7">
                            <label class="form-check-label" for="7thYear"><span class="spanCus">7년차</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-3" type="radio" name="p004" id="8thYear" value="CAR8">
                            <label class="form-check-label" for="8thYear"><span class="spanCus">8년차</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-3" type="radio" name="p004" id="9thYearAndOver"
                                   value="CAR9">
                            <label class="form-check-label" for="9thYearAndOver">
                                <span class="spanCus">9년차 이상</span></label>
                        </div>

                    </div>
                </div>
                <%-- //p004 그룹 --%>

                <%-- p005 그룹 --%>
                <div class="mb-5">
                    <p class="itemTitle">Q5. 현재 연 소득 범위를 선택해주세요. <span class="text-danger">(경력 개발자만 선택)</span></p>
                    <div class="form-group ml-4">
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="radio" name="p005" id="incomeUnder2" value="INC1">
                            <label class="form-check-label" for="incomeUnder2">
                                <span class="spanCus">연소득 2천만원 미만</span></label>
                        </div>
                        <div class="form-check mb-2">
                            <input class="form-check-input" type="radio" name="p005" id="income23" value="INC2">
                            <label class="form-check-label" for="income23">
                                <span class="spanCus">연소득 2천만원 이상 3천만원 미만</span></label>
                        </div>

                        <div class="form-check mb-2">
                            <input class="form-check-input" type="radio" name="p005" id="income34" value="INC3">
                            <label class="form-check-label" for="income34">
                                <span class="spanCus">연소득 3천만원 이상 4천만원 미만</span></label>
                        </div>

                        <div class="form-check mb-2">
                            <input class="form-check-input" type="radio" name="p005" id="income45" value="INC4">
                            <label class="form-check-label" for="income45">
                                <span class="spanCus">연소득 4천만원 이상 5천만원 미만</span></label>
                        </div>

                        <div class="form-check mb-2">
                            <input class="form-check-input" type="radio" name="p005" id="income56" value="INC5">
                            <label class="form-check-label" for="income56">
                                <span class="spanCus">연소득 5천만원 이상 6천만원 미만</span></label>
                        </div>

                        <div class="form-check mb-2">
                            <input class="form-check-input" type="radio" name="p005" id="income67" value="INC6">
                            <label class="form-check-label" for="income67">
                                <span class="spanCus">연소득 6천만원 이상 7천만원 미만</span></label>
                        </div>

                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="p005" id="income7AndOver" value="INC7">
                            <label class="form-check-label" for="income7AndOver">
                                <span class="spanCus">연소득 7천만원 이상</span></label>
                        </div>
                    </div>
                </div>
                <%-- //p005 그룹 --%>

                <%-- p006 그룹 --%>
                <div class="mb-5">
                    <p class="itemTitle">Q6. 현재 직무는 무엇인가요? <span class="text-dark">[최대 2개 선택]</span></p>

                    <div class="card w-75 h-auto">
                        <div class="card-body">
                            <div class="form-group ml-4">
                                <%-- item1 --%>
                                <div class="form-check">
                                    <div class="form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="p006" id="backend"
                                               value="BAC">
                                        <label class="form-check-label" for="backend">
                                            <span class="spanCus">서버/백엔드</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p006" id="frontend"
                                               value="FRO">
                                        <label class="form-check-label" for="frontend">
                                            <span class="spanCus">프론트엔드</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p006" id="fullstack"
                                               value="FUL">
                                        <label class="form-check-label" for="fullstack">
                                            <span class="spanCus">풀스택</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p006"
                                               id="machineLearnAndAI" value="MAI">
                                        <label class="form-check-label" for="machineLearnAndAI">
                                            <span class="spanCus">머신러닝 및 인공지능</span></label>
                                    </div>
                                </div>
                                <%-- //item1 --%>

                                <%-- item2 --%>
                                <div class="form-check mt-3">
                                    <div class="form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="p006" id="android"
                                               value="AND">
                                        <label class="form-check-label" for="android">
                                            <span class="spanCus">Android</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p006" id="ios"
                                               value="IOS">
                                        <label class="form-check-label" for="ios">
                                            <span class="spanCus">ios</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p006" id="security"
                                               value="SEC">
                                        <label class="form-check-label" for="security">
                                            <span class="spanCus">보안</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p006" id="game"
                                               value="GAM">
                                        <label class="form-check-label" for="game">
                                            <span class="spanCus">게임</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p006" id="etc6"
                                               value="ETC6">
                                        <label class="form-check-label" for="etc6">
                                            <span class="spanCus">기타</span></label>
                                    </div>
                                </div>
                                <%-- //item2 --%>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- //p006 그룹 --%>
            </div>
            <%-- //질의 항목 --%>
        </div>
        <%-- //part1. 개발자 정보 --%>

        <%-- part2. 개발 시 사용하는 OS / DB / 에디터 --%>
        <div class="tab-pane fade" id="part2" role="tabpanel" aria-labelledby="part2_tab">
            <%-- 질의 항목 --%>
            <div class="container jumbotron mt-1">

                <%-- p007 그룹 --%>
                <div class="mb-5">
                    <p class="itemTitle">Q1. 주로 사용하는 OS는 무엇인가요?</p>
                    <div class="form-group ml-4">

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="p007" id="window" value="WIN">
                            <label class="form-check-label" for="window"><span class="spanCus">Window OS</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p007" id="mac" value="MAC">
                            <label class="form-check-label" for="mac"><span class="spanCus">Mac OS</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p007" id="linux" value="LNX">
                            <label class="form-check-label" for="linux"><span class="spanCus">Linux</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p007" id="etc7" value="ETC7">
                            <label class="form-check-label" for="etc7"><span class="spanCus">기타</span></label>
                        </div>

                    </div>
                </div>
                <%-- //p007 그룹 --%>

                <%-- p008 그룹 --%>
                <div class="mb-5">
                    <p class="itemTitle">Q2. 주로 사용하는 DB는 무엇인가요?</p>
                    <div class="form-group ml-4">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="p008" id="mysql" value="MYS">
                            <label class="form-check-label" for="mysql"><span class="spanCus">MySQL</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p008" id="oracle" value="ORC">
                            <label class="form-check-label" for="oracle"><span class="spanCus">Oracle</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p008" id="maria" value="MAR">
                            <label class="form-check-label" for="maria"><span class="spanCus">MariaDB</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p008" id="mongo" value="MOG">
                            <label class="form-check-label" for="mongo"><span class="spanCus">MongoDB</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p008" id="postgres" value="POS">
                            <label class="form-check-label" for="postgres">
                                <span class="spanCus">PostgreSQL</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p008" id="mssql" value="MSS">
                            <label class="form-check-label" for="mssql"><span class="spanCus">MS-SQL</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p008" id="etc8" value="ETC8">
                            <label class="form-check-label" for="etc8"><span class="spanCus">기타</span></label>
                        </div>

                    </div>
                </div>

                <%-- //p008 그룹 --%>

                <%-- p009 그룹 --%>
                <div class="mb-5">
                    <p class="itemTitle">Q3. 주로 사용하는 에디터는 무엇인가요?</p>
                    <div class="form-group ml-4">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="p009" id="eclipse" value="ECP">
                            <label class="form-check-label" for="eclipse"><span class="spanCus"></span>Eclipse</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p009" id="intellij" value="INJ">
                            <label class="form-check-label" for="intellij"><span class="spanCus">IntelliJ</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p009" id="vsCode" value="VSC">
                            <label class="form-check-label" for="vsCode"><span class="spanCus">VSCode</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p009" id="visualStudio" value="VIS">
                            <label class="form-check-label" for="visualStudio">
                                <span class="spanCus">VisualStudio</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p009" id="androidStudio"
                                   value="ADS">
                            <label class="form-check-label" for="androidStudio">
                                <span class="spanCus">AndroidStudio</span></label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input ml-5" type="radio" name="p009" id="etc9" value="ETC9">
                            <label class="form-check-label" for="etc9"><span class="spanCus">기타</span></label>
                        </div>

                    </div>
                </div>
                <%-- //p009 그룹 --%>
            </div>
            <%-- //질의 항목 --%>
        </div>
        <%-- //part2. 개발 시 사용하는 OS / DB / 에디터 --%>

        <%-- part3. 프로그래밍 언어와 프레임워크 및 라이브러리 --%>
        <div class="tab-pane fade" id="part3" role="tabpanel" aria-labelledby="part3_tab">
            <%-- 질의 항목 --%>
            <div class="container jumbotron mt-1">

                <%-- p0010 그룹 --%>
                <div class="mb-5">
                    <p class="itemTitle">Q1. 자신있는 프로그래밍 언어를 선택해주세요. <span class="text-dark">[최대 2개 선택]</span></p>

                    <div class="card w-75 h-auto">
                        <div class="card-body">
                            <div class="form-group ml-4">
                                <%-- item1 --%>
                                <div class="form-check">
                                    <div class="form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="p010" id="jav"
                                               value="JAV">
                                        <label class="form-check-label" for="jav">
                                            <span class="spanCus">Java</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="js" value="JAS">
                                        <label class="form-check-label" for="js">
                                            <span class="spanCus">JavaScript</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="pyh"
                                               value="PYH">
                                        <label class="form-check-label" for="pyh">
                                            <span class="spanCus">Python</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="cpp"
                                               value="CPP">
                                        <label class="form-check-label" for="cpp">
                                            <span class="spanCus">C++</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="coo"
                                               value="COO">
                                        <label class="form-check-label" for="coo">
                                            <span class="spanCus">C</span></label>
                                    </div>

                                </div>
                                <%-- //item1 --%>

                                <%-- item2 --%>
                                <div class="form-check mt-3">
                                    <div class="form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="p010" id="php"
                                               value="PHP">
                                        <label class="form-check-label" for="php">
                                            <span class="spanCus">PHP</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="kot"
                                               value="KOT">
                                        <label class="form-check-label" for="kot">
                                            <span class="spanCus">Kotlin</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="tys"
                                               value="TYS">
                                        <label class="form-check-label" for="tys">
                                            <span class="spanCus">TypeScript</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="etc10"
                                               value="ETC10">
                                        <label class="form-check-label" for="etc10">
                                            <span class="spanCus">기타</span></label>
                                    </div>
                                </div>
                                <%-- //item2 --%>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- //p010 그룹 --%>

                <%-- p0011 그룹 --%>
                <div class="mb-5">
                    <p class="itemTitle">Q2. 배워보고 싶은 프로그래밍 언어를 선택해주세요. <span class="text-dark">[최대 2개 선택]</span></p>

                    <div class="card w-75 h-auto">
                        <div class="card-body">
                            <div class="form-group ml-4">
                                <%-- item1 --%>
                                <div class="form-check">
                                    <div class="form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="p010" id="javl"
                                               value="JAVL">
                                        <label class="form-check-label" for="javl">
                                            <span class="spanCus">Java</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="jsl" value="JASL">
                                        <label class="form-check-label" for="jsl">
                                            <span class="spanCus">JavaScript</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="pyhl"
                                               value="PYHL">
                                        <label class="form-check-label" for="pyhl">
                                            <span class="spanCus">Python</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="cppl"
                                               value="CPPL">
                                        <label class="form-check-label" for="cppl">
                                            <span class="spanCus">C++</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="cool"
                                               value="COOL">
                                        <label class="form-check-label" for="cool">
                                            <span class="spanCus">C</span></label>
                                    </div>

                                </div>
                                <%-- //item1 --%>

                                <%-- item2 --%>
                                <div class="form-check mt-3">
                                    <div class="form-check-inline">
                                        <input class="form-check-input" type="checkbox" name="p010" id="phpl"
                                               value="PHPL">
                                        <label class="form-check-label" for="phpl">
                                            <span class="spanCus">PHP</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="kotl"
                                               value="KOTL">
                                        <label class="form-check-label" for="kotl">
                                            <span class="spanCus">Kotlin</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="tysl"
                                               value="TYSL">
                                        <label class="form-check-label" for="tysl">
                                            <span class="spanCus">TypeScript</span></label>
                                    </div>

                                    <div class="form-check-inline ml-2">
                                        <input class="form-check-input" type="checkbox" name="p010" id="etc11"
                                               value="ETC11">
                                        <label class="form-check-label" for="etc11">
                                            <span class="spanCus">기타</span></label>
                                    </div>
                                </div>
                                <%-- //item2 --%>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- //p011 그룹 --%>
            </div>
            <%-- //질의 항목 --%>
        </div>
        <%-- //part3. 프로그래밍 언어와 프레임워크 및 라이브러리 --%>
    </div>

</section>
<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>
