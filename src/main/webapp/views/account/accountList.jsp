<%--
  Created by IntelliJ IDEA.
  User: blucean
  Date: 2020-05-08
  Time: 오후 4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>

<html>
<head>
    <title>회원관리</title>
    <script type="text/javascript">
        // // 전체
        // function selectAll_btn() {
        //     var requestUrl = '/account/allAccount';
        //     var data = {} // 객체
        //     console.log("Select Request Data:", data);
        //     $.ajax({
        //         type: 'get',
        //         url: requestUrl,
        //         data: data,
        //         dataType: 'json',
        //         contentType: 'application/json',
        //         success: function (data) {
        //             console.log("Select Response Data:", data);
        //             console.log("data length", data.length);
        //             var html = "";
        //             $("#accountVOList")
        //             if (data.length > 0 || data.resultCode === 200) {
        //                 $.each(data, function (index, item) {
        //                     console.log("Select Response Id:", item.id);
        //                     html += "<tr>"
        //                     html += "<td>" + item.accountId + "</td>";
        //                     html += "<td>" + "<a href='#' class='text-decoration-none text-info' onclick='updateView_btn(" + item.accountId + ")'>" + item.accountEmail + "</a>" + "</td>";
        //                     html += "<td>" + item.userName + "</td>"
        //                     html += "<td>" + item.userPhoneNumber + "</td>"
        //                     html += "<td>" + item.birthDay + "</td>"
        //                     html += "<td>" + item.sexCode + "</td>"
        //                     html += "<td>" + item.createDatetime + "</td>"
        //                     html += "<td>" + "<button onclick='delete_btn(" + item.accountId + ")'>" + "삭제" + "</button>" + "</td>"
        //                     html += "</tr>"
        //                 })
        //             }
        //             $("#accountVOList").children().remove();
        //             $("#accountVOList").append(html);
        //         }, error: function (xhr, e, data) {
        //             console.log("Select Response Error", data);
        //         }
        //     });
        // }
        //
        // // Read
        // function select_btn() {
        //     var requestUrl = '/account/searchAccount'; // 변수선언
        //     // var data = {
        //     //     accountEmail: 'qwe', userPhoneNumber:'01000000000'
        //     // } // javascript 객체
        //     var data = {}; //javascript 객체
        //     data.accountEmail = $("#accountEmail").val(); // 객체의 속성 추가  controller의 RequestParam 속성네임과 요청한 속성과 매핑
        //     data.userPhoneNumber = $("#userPhoneNumber").val();
        //     console.log("Select Request Data:", data.accountEmail + " " + data.userPhoneNumber);
        //     $.ajax({
        //         type: 'get',
        //         url: requestUrl,
        //         data: data,
        //         // dataType   : 'json',
        //         // contentType: 'application/json',
        //         success: function (data) {
        //             console.log("Select Response Data:", data);
        //             console.log("data length", data.length);
        //             var html = "";
        //             if (data.length > 0) { //데이터를 object로 가져오는 제이슨의 사이즈
        //                 $("#noData").remove(html);
        //                 $.each(data, function (index, item) { //배열의 인덱스 [0]부터 시작, item에는 각각 배열 요소를 말한다.
        //                     console.log("Select Response Id:", item.accountId);
        //                     html += "<tr>"
        //                     html += "<td>" + "<a href='#' class='text-decoration-none text-info' onclick='updateView_btn(" + item.accountId + ")'>" + item.accountEmail + "</a>" + "</td>";
        //                     html += "<td>" + item.userName + "</td>"
        //                     html += "<td>" + item.userPhoneNumber + "</td>"
        //                     html += "<td>" + item.birthDay + "</td>"
        //                     html += "<td>" + item.sexCode + "</td>"
        //                     html += "<td>" + item.createDatetime + "</td>"
        //                     html += "<td>" + "<button onclick='delete_btn(" + item.accountId + ")'>" + "삭제" + "</button>" + "</td>";
        //                     html += "</tr>"
        //                 })
        //                 $("#accountVOList").html(html);
        //             } else if (data.length <= 0) {
        //                 alert("검색조건을 입력하세요.")
        //                 html += "<tr>";
        //                 html += "<td colspan='4' align='center'>" + "<span style='color: #666666;'>" + "검색 결과가 없습니다" + "</span>" + "</td>";
        //                 html += "</tr>";
        //                 $("#noData").html(html);
        //             }
        //         }, error: function (xhr, e, data) {
        //             console.log("Select Response Error", data);
        //         }
        //     });
        // }

    </script>
    <%--    <style>--%>
    <%--        /* 구글 웹폰트 */--%>
    <%--        @import url('https://fonts.googleapis.com/css?family=Gothic+A1|Nanum+Gothic|Noto+Sans+KR&display=swap');--%>

    <%--        #container {--%>
    <%--            margin: 20px;--%>
    <%--            /*margin: 0 auto; !* 가로로 중앙에 배치 *!*/--%>
    <%--        }--%>

    <%--        .table {--%>
    <%--            text-align: center;--%>
    <%--            /*font-size: 11pt;*/--%>
    <%--            /*font-family: "KoPubWorldDotum_Pro Light", serif;*/--%>
    <%--        }--%>

    <%--        #hr {--%>
    <%--            display: block;--%>
    <%--            margin-top: 0.5em;--%>
    <%--            margin-left: auto;--%>
    <%--            margin-right: auto;--%>
    <%--            border: 1px solid #000;--%>
    <%--        }--%>

    <%--        .navbar img {--%>
    <%--            vertical-align: middle;--%>
    <%--        }--%>

    <%--        .nav-link {--%>
    <%--            /* font-family: 'Nanum Gothic', sans-serif; */--%>
    <%--            font-size: 1.0em;--%>
    <%--            font-weight: 700;--%>
    <%--            color: black;--%>
    <%--        }--%>

    <%--        .nav-link:hover {--%>
    <%--            /* font-family: 'Nanum Gothic', sans-serif; */--%>
    <%--            font-size: 1.0em;--%>
    <%--            font-weight: 700;--%>
    <%--            color: #999999;--%>
    <%--        }--%>

    <%--        .form-inline {--%>
    <%--            font-size: 0.813rem;--%>
    <%--        }--%>

    <%--        .form-inline a:hover { /*클릭하지 않은 링크*/--%>
    <%--            text-decoration: none;--%>
    <%--        }--%>

    <%--        .form-inline a img {--%>
    <%--            vertical-align: middle;--%>
    <%--            /* 	width: 2.0em;--%>
    <%--            height: 2.0em; */--%>
    <%--        }--%>

    <%--        .snschat img {--%>
    <%--            width: 2.0em;--%>
    <%--            height: 2.0em;--%>
    <%--        }--%>

    <%--        .table th {--%>
    <%--            font-family: 'Nanum Gothic', sans-serif;--%>
    <%--            font-size: 0.938em;--%>
    <%--            font-weight: 700;--%>
    <%--        }--%>

    <%--        .table td span {--%>
    <%--            font-family: 'Gothic A1', sans-serif;--%>
    <%--            font-size: 0.938em;--%>
    <%--            font-weight: 600;--%>
    <%--        }--%>

    <%--        .table td a {--%>
    <%--            font-family: 'Nanum Gothic', sans-serif;--%>
    <%--            font-size: 0.938em;--%>
    <%--            font-weight: 700;--%>
    <%--            text-decoration: none;--%>
    <%--        }--%>

    <%--        .table .etc span {--%>
    <%--            font-family: 'Gothic A1', sans-serif;--%>
    <%--            font-size: 0.813em;--%>
    <%--            font-weight: 600;--%>
    <%--        }--%>

    <%--        .userimg {--%>
    <%--            width: 13.0em;--%>
    <%--            height: 13.0em;--%>
    <%--        }--%>

    <%--        .profileimg img {--%>
    <%--            width: 8em;--%>
    <%--            height: 8em;--%>
    <%--        }--%>
    <%--    </style>--%>
</head>
<body>
<%-- 헤더 --%>
<jsp:include page="/views/common/header.jsp"/>
<section id="container">
    <table>
        <tr>
            <th><h2>회원목록</h2></th>
        </tr>
    </table>
    <table class="my-3">
        <tr>
            <div class="form-group row">
                <td><label for="accountEmail" class="col-form-label mr-1">계정이메일</label></td>
                <td><input type="text" class="form-control" id="accountEmail" placeholder="이메일"/></td>
                <td><label for="userPhoneNumber" class="col-form-label ml-4 mr-1">전화번호</label></td>
                <td><input type="text" class="form-control" id="userPhoneNumber" placeholder="01000000000"/></td>

            </div>
            <div class="form-group row">
                <td>
                    <button class="btn btn-outline-dark ml-3" onclick="select_btn()">검색</button>
                </td>
                <td>
                    <button class="btn btn-outline-dark ml-3" onclick="selectAll_btn()">전체</button>
                </td>
            </div>
        </tr>
    </table>

    <table class="table table-bordered table-striped table-hover">
        <thead class="thead-dark">
        <tr>
            <th width="5%">번호</th>
            <th width="20%">계정이메일</th>
            <th width="10%">사용자명</th>
            <th width="20%">전화번호</th>
            <th width="10%">생년월일</th>
            <th width="5%">성별</th>
            <th width="20%">가입일자</th>
            <th width="10%"></th>

        </tr>
        </thead>

        <tbody id="accountVOList">
        <c:choose>
            <c:when test="${fn:length(accountList)==0 || fn:length(accountList) == null}">
                <tr>
                    <td style="text-align: center" colspan="8"><span>등록된 회원이 없습니다</span></td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="item" items="${accountList}">
                    <tr>
                        <td>${item.accountId}</td>
                        <td>${item.accountEmail}</td>
                        <td>${item.userName}</td>
                        <td>${item.userPhoneNumber}</td>
                        <td>${item.birthDay}</td>
                        <td>${item.sexCode}</td>
                        <td>${item.createDatetime}</td>
                        <td>delete</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>

    </table>
</section>
<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>
