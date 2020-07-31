<%--
  Created by IntelliJ IDEA.
  User: berno
  Date: 2020-05-20
  Time: 오전 2:05
  To change this template use File | Settings | File Templates.
--%>
<%--
    애로사항
    - 파일 첨부 시 [취소] 버튼 구현해야 됨
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>글쓰기</title>
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
                window.location.href = '/board/list';
            });
        });

        // 게시글 제목, 내용 유효성 검사
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

        function write_btn() {
            let requestUrl = '/board/setWrite';
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
        $(document).on('keyup', '#content', function (e) {
            let textarea01 = $(this).val();
            $('#cntSPAN').text(getBytes(textarea01));
        });

        function getBytes(str) {
            var cnt = 0;
            for (var i = 0; i < str.length; i++) {
                cnt += (str.charCodeAt(i) > 128) ? 2 : 1;
            }
            return cnt;
        }

        // 게시글 작성
        // #rest 방식
        // function write_btn() {
        //     let requestUrl = '/board/setWrite';
        //     let data = {};
        //     data.title = $("#title").val(); // 객체의 속성 추가
        //     data.content = $("#content").val();
        //     data = JSON.stringify(data); //자바스크립트 객체를 json 객체로 변환
        //     console.log("Insert Request Data:", data);
        //     $.ajax({
        //         type: 'post',
        //         url: requestUrl,
        //         data: data,
        //         dataType: 'json',
        //         contentType: 'application/json',
        //         success: function (response) {
        //             console.log("Insert Response Data:", response);
        //             if (response === 200) {
        //                 alert("생성을 성공했습니다.")
        //                 location.replace('/board/list');
        //             } else if (response !== 200) {
        //                 alert("생성을 실패했습니다.")
        //             }
        //         },
        //         error: function (xhr, e, response) {
        //             console.log("Insert Error:", xhr, e, response);
        //             alert("에러!!")
        //         }
        //     });
        // }
    </script>
</head>
<body>

<%-- 헤더 --%>
<jsp:include page="/views/common/header.jsp"/>

<%-- 바디 --%>
<section>
    <div class="container mt-5">
        <h3 class="text-center">글쓰기</h3>
        <%--        <form id="form" enctype="multipart/form-data">--%>
        <form id="form">
            <input type="hidden" value="${sessionScope.account.accountId}" name="accountId">
            <input type="hidden" value="${sessionScope.account.userName}" name="writer">
            <table class="table table-bordered">
                <tr class="thead-light">
                    <th class="tcenter ">
                        <label for="title">제목</label>
                    </th>
                    <td>
                        <input type="text" id="title" name="title" class="form-control" placeholder="40자 이내  작성하세요"
                               maxlength="40"/>
                    </td>
                </tr>
                <tr class="thead-light">
                    <th class="tcenter">
                        <label for="content">내용</label>
                    </th>
                    <td>
                    <textarea id="content" name="content" rows="8" class="form-control w-100"
                              placeholder="내용을 입력하세요..."></textarea>
                        <div>
                            <span id="cntSPAN">0</span>&nbsp;<span>bytes</span>
                        </div>
                    </td>
                </tr>
                <tr class="thead-light">
                    <th class="tcenter ">
                        <label for="file">첨부파일</label>
                    </th>
                    <td>
                        <input type="file" id="file" name="file" value="파일 선택" multiple/>
                        <span class="date">&nbsp;&nbsp;*&nbsp;임의로 파일명이 변경될 수 있습니다.</span>
                    </td>
                </tr>

            </table>
            <br/>
            <div class="row justify-content-center">
                <input type="reset" value="초기화" class="btn btn-outline-secondary"/>
                <input type="button" id="write_btn" value="작성" class="btn btn-outline-secondary mx-1"/>
                <input type="button" id="back_btn" value="취소" class="btn btn-outline-secondary"/>
            </div>
        </form>
    </div>

</section>

<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>
