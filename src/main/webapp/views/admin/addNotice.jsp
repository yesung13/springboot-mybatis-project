
<%--
  Created by IntelliJ IDEA.
  User: SAMSUNG
  Date: 2020-08-03
  Time: 오후 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>[admin]공지사항 등록</title>
    <style>
        .table td span {
            font-family: 'Gothic A1', sans-serif;
            font-size: 0.813em;
            font-weight: 500;
            color: gray;
        }

        .table td a {
            font-family: 'Nanum Gothic', sans-serif;
            font-size: 0.938em;
            font-weight: 700;
            text-decoration: none;
            color: #4374D9;
        }

        .uploadResult {
            width: 100%;
            /*background-color: gray;*/
        }

        .uploadResult ul {
            display: flex;
            flex-flow: column;
            justify-content: center;
            align-items: center;
        }

        .uploadResult ul li {
            list-style: none;
            padding: 10px;
        }


        .uploadResult ul li img {
            width: 30px;
        }

        .bigPicture {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .bigPicture img {
            width: 600px;
        }

        /*div > input {*/
        /*    width: 100px;*/
        /*}*/
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#write_btn').click(function () {
                writeCheck_btn();
            });

            $('#back_btn').click(function () {
                window.location.href = '/admin/main';
            });

        }); // end doc ready


        // 공지사항 제목, 내용 유효성 검사
        function writeCheck_btn() {
            let title = $("#title").val();
            let content = $("#content").val();
            if (title == null || title === "") {
                alert("제목을 입력해 주세요!");
                $("#title").focus();
                return false;
            }

            if (content == null || content === "") {
                alert("내용을 입력해 주세요!");
                $("#content").focus();
                return false;
            }
            return write_btn();
        }

        // 공지사항 등록
        function write_btn() {
            let form = $('#form')[0];
            let data = new FormData(form);

            console.log("Insert Request Data:", data);

            $.ajax({
                type: "POST",
                url: '/admin/addNotice',
                // url: '/board/setWrite',
                data: data,
                processData: false,
                contentType: false,
                // cache: false,
                // timeout: 600000,
                success: function (response) {
                    console.log("Insert Response Data:", response);
                    if (response.resCode === 600) {
                        alert(response.resMsg);
                        location.replace('/board/list');
                    } else if (response.resCode === 601) {
                        alert(response.resMsg);
                    } else if (response.resCode === 607) {
                        alert(response.resMsg);
                    }
                },
                error: function (xhr, e, response) {
                    console.log("Insert Error:", xhr, e, response);
                    alert("에러!!")
                }
            });
        }

        // 글 입력 시 카운트
        function fnCheckByte(obj) {
            let maxByte = 100; // 최대 입력 바이트 수
            let str = obj.value;
            console.log("obj ", obj.value)
            let str_len = str.length;

            console.log("length: ", str)
            console.log("length: ", str_len)


            let rbyte = 0;
            let rlen = 0;
            let one_char = "";
            let str2 = "";

            for (let i = 0; i < str_len; i++) {
                one_char = str.charAt(i);

                if (escape(one_char).length > 4) {
                    rbyte += 2; // 한글 2byte
                } else {
                    rbyte++; // 영문 등 나머지 1byte
                }

                if (rbyte <= maxByte) {
                    rlen = i + 1; //return할 문자열 갯수
                }
            }

            if (rbyte > maxByte) {
                alert("한글 " + (maxByte / 2) + "자 / 영문 & 특수문자 " + maxByte + " 자를 초과 입력할 수 없습니다.");
                str2 = str.substr(0, rlen); // 문자열 자르기
                obj.value = str2;
                fnCheckByte(obj, maxByte);
            } else {
                $("#byteInfo").text(rbyte);
            }

        }

    </script>
</head>
<body>
<%-- security 계정 정보 --%>
<sec:authentication property="principal" var="userInfo"/>
<%-- //security 계정 정보 --%>

<%-- 바디 --%>
<section>
    <div class="container mt-5">
        <h3 class="text-center">[admin] 공지사항 등록</h3>
        <%--        <form id="form" role="form" action="${pageContext.request.contextPath}/board/register" method="post">--%>
        <form id="form" role="form">
            <input type="hidden" value="${userInfo.accountId}" name="accountId">
            <input type="hidden" value="${userInfo.accountUserNm}" name="writer">
            <table class="table table-bordered">
                <tr>
                    <th class="tcenter bg-info">
                        <label for="title" class="text-white">제목</label>
                    </th>
                    <td>
                        <input type="text" id="title" name="title" class="form-control" placeholder="40자 이내  작성하세요"
                               maxlength="40"/>
                    </td>
                </tr>
                <tr>
                    <th class="tcenter bg-info">
                        <label for="content" class="text-white">내용</label>
                    </th>
                    <td>
                    <textarea id="content" name="content" rows="8" class="form-control w-100 mb-1"
                              onkeyup="fnCheckByte(this)" placeholder="내용을 입력하세요..."></textarea>

                        <div class="d-inline ">
                            <span id="byteInfo" class="font-weight-bold">0</span>&nbsp;<span class="font-weight-bold">bytes</span>
                            &nbsp;&nbsp;<span style="font-weight: lighter;"> ※ 최대 입력 가능 글자수 100 byte </span>
                        </div>
                    </td>
                </tr>
<%--                <tr class="thead-light">--%>
<%--                    <th class="tcenter ">--%>
<%--                        <label for="file">첨부파일</label>--%>
<%--                    </th>--%>
<%--                    <td>--%>
<%--                        <div class="uploadDiv">--%>
<%--                            <input type="file" id="file" name="uploadFile" multiple/>--%>
<%--                            <span class="date">&nbsp;&nbsp;※&nbsp;jpg, png, zip, hwp, docx, pdf 확장자만 첨부 가능 </span>--%>
<%--                        </div>--%>
<%--                        <div class="uploadResult">--%>
<%--                            <ul></ul>--%>
<%--                        </div>--%>
<%--                    </td>--%>
<%--                </tr>--%>

            </table>
            <br/>
            <div class="row justify-content-center">
                <button type="reset" class="btn btn-outline-secondary">초기화</button>
                <button type="button" id="write_btn" class="btn btn-outline-secondary mx-1">작성</button>
                <%--                <button type="submit" class="btn btn-outline-secondary mx-1">작성</button>--%>
                <button type="button" id="back_btn" class="btn btn-outline-secondary">취소</button>
            </div>
        </form>
    </div>

</section>
</body>
</html>
