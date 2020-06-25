<%--
  Created by IntelliJ IDEA.
  User: berno
  Date: 2020-05-20
  Time: 오전 2:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>글수정:${boardListDetail.title}</title>
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

        div > input {
            width: 100px;
        }
    </style>
    <script type="text/javascript">
        // 초기화 버튼
        function reset_btn() {
            $("#title").val(null);
            $("#content").val(null);
        }

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
            return true;
        }

        // 글 입력 시 카운트
        $(document).on('keyup', '#content', function (e) {
            var textarea01 = $(this).val();
            $('#cntSPAN').text(getBytes(textarea01));
        });

        function getBytes(str) {
            var cnt = 0;
            for (var i = 0; i < str.length; i++) {
                cnt += (str.charCodeAt(i) > 128) ? 2 : 1;
            }
            return cnt;
        }

    </script>
</head>
<body class="body">

<%-- 헤더 --%>
<jsp:include page="/views/common/header.jsp"/>

<%-- 바디 --%>
<section>
    <div class="container mt-5">
        <h3 class="text-center">글수정</h3>
        <form action="${pageContext.request.contextPath}/board/setModify" method="POST"
              onsubmit="return writeCheck_btn()" enctype="multipart/form-data">
            <input type="hidden" name="boardId" value="${boardListDetail.boardId}">
            <table class="table table-bordered">
                <tr class="thead-light">
                    <th class="tcenter">
                        <label for="title">제목</label>
                    </th>
                    <td>
                        <input type="text" id="title" name="title" class="form-control" placeholder="40자 이내  작성하세요"
                               value="${boardListDetail.title}"/>
                    </td>
                </tr>
                <tr class="thead-light">
                    <th class="tcenter">
                        <label for="content">내용</label>
                    </th>
                    <td>
                    <textarea id="content" name="content" rows="8" class="form-control w-100"
                              placeholder="내용을 입력하세요...">${boardListDetail.content}</textarea>
                        <div>
                            <span id="cntSPAN">0</span>&nbsp;<span>bytes</span>
                        </div>
                    </td>
                </tr>
                <tr class="thead-light">
                    <th class="tcenter ">
                        <label for="file">첨부파일</label>
                    </th>
                    <td align="left">
                        <c:forEach var="file" items="${fileList}">
                            <p>
                                <input type="checkbox" name="checkFileNum" value="${file.fileId}"/>
                                <c:out value="${file.originFilename}"/>
                                <c:out value="(${file.fileSize} byte)"/>
                                <span class="date">&nbsp;&nbsp;*&nbsp; ✔-삭제</span>
                            </p>
                        </c:forEach>
                        <c:if test="${empty fileList}">
                            <span style="color: #A6A6A6; "> 첨부된 파일이 없습니다. </span>
                        </c:if>
                    </td>
                </tr>
                <tr class="thead-light">
                    <th class="tcenter ">
                        <label for="file">파일수정</label>
                    </th>
                    <td>
                        <input type="file" id="file" name="file" multiple/>
                        <span class="date">&nbsp;&nbsp;*&nbsp;파일명이 변경될 수 있습니다.</span>
                    </td>
                </tr>
            </table>
            <br/>
            <div class="row justify-content-center">
                <input type="button" value="초기화" class="btn btn-outline-secondary" onclick="reset_btn()"/>

                <input type="submit" value="수정" class="btn btn-outline-secondary mx-1"/>

                <input type="button" value="취소" class="btn btn-outline-secondary"
                       onclick="location.href='/board/detail?id='+${boardListDetail.boardId}"/>
            </div>
        </form>
    </div>
</section>

<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>
