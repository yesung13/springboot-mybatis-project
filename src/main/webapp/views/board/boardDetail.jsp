<%--
  Created by IntelliJ IDEA.
  User: berno
  Date: 2020-05-20
  Time: 오전 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>글보기</title>
    <script type="text/javascript">

        <%--        $(document).ready(function () {--%>
        <%--            getBoardView();--%>
        <%--            replyForm();--%>
        <%--            getReply();--%>
        <%--        })--%>

        <%--        // response get parameter--%>
        <%--        var getParameters = function (paramName) {--%>
        <%--            // 리턴값을 위한 변수 선언--%>
        <%--            var returnValue;--%>
        <%--            // 현재 URL 가져오기--%>
        <%--            var url = location.href;--%>
        <%--            // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔--%>
        <%--            var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');--%>
        <%--            // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return--%>
        <%--            for (var i = 0; i < parameters.length; i++) {--%>
        <%--                var varName = parameters[i].split('=')[0];--%>
        <%--                if (varName.toUpperCase() === paramName.toUpperCase()) {--%>
        <%--                    returnValue = parameters[i].split('=')[1];--%>
        <%--                    return decodeURIComponent(returnValue);--%>
        <%--                }--%>
        <%--            }--%>
        <%--        };--%>
        <%--        var id = getParameters('id');--%>
        <%--        console.log("Request Param boardId = ", id);--%>

        <%--        // 글 상세보기--%>
        <%--        var getBoardView = function () {--%>
        <%--            var requestUrl = '/boardVO/getBoardView';--%>
        <%--            var data = {}--%>
        <%--            data.boardId = id;--%>
        <%--            $.ajax({--%>
        <%--                type: 'get',--%>
        <%--                url: requestUrl,--%>
        <%--                data: data,--%>
        <%--                dataType: 'json',--%>
        <%--                contentType: 'application/json',--%>
        <%--                success: function (data) {--%>
        <%--                    console.log("Response Data:", data);--%>
        <%--                    console.log("Response Data:", data.title);--%>
        <%--                    $("#title").html(data.title);--%>
        <%--                    $("#content").html(data.content);--%>
        <%--                    $("#writer").html(data.writer);--%>
        <%--                    $("#boardDatetime").html(data.boardDatetime);--%>

        <%--                }, error: function (xhr, e, data) {--%>
        <%--                    console.log("Response Error", data);--%>
        <%--                }--%>
        <%--            });--%>
        <%--        }--%>


        // 글 삭제, 수정
        function moveAction(where) {
            switch (where) {
                case 1:
                    if (confirm("글을 삭제하시겠습니까?")) {
                        var requestUrl = '/board/getBoardDelete';
                        var data = {}
                        data.boardId = id;
                        data = JSON.stringify(data);
                        $.ajax({
                            type: 'post',
                            url: requestUrl,
                            data: data,
                            dataType: 'json',
                            contentType: 'application/json',
                            success: function (data) {
                                console.log("Response Data:", data);
                                if (data.resultCode === 200) {
                                    alert("게시글이 삭제되었습니다.");
                                }
                                location.replace('/boardVO/main');

                            }, error: function (xhr, e, data) {
                                console.log("Response Error", data);
                                alert("해당 작업을 실패하였습니다.");
                                location.reload();
                            }
                        });

                    }
                    break;
                case 2:
                    if (confirm("글을 수정하시겠습니까?")) {
                        location.href = "/board/update?id=" + id;
                    }
                    break;
                case 3:
                    location.href = "/board/list";
                    break;
            }
        }

        <%--        // 댓글 폼--%>
        <%--        var replyForm = function () {--%>
        <%--            var html = "";--%>
        <%--            html += "<th>" + "<div class='pt-2'>" + "<strong class='text-muted'>" + "댓글 작성자" + "</strong>" + "</div>" + "</th>"--%>
        <%--            html += "<th>"--%>
        <%--            html += "<div class='form-inline'>"--%>
        <%--            html += "<textarea id='replyContent' name='replyContent' rows='1' class='form-control rounded w-75' placeholder='댓글을 남겨보세요'></textarea>"--%>
        <%--            html += "<button class='btn btn-secondary ml-2' type='button' onclick='replyWrite()'>" + "등록" + "</button>"--%>
        <%--            html += "</div>"--%>
        <%--            html += "</th>"--%>
        <%--            $("#replyForm").html(html);--%>
        <%--        };--%>

        <%--        // 댓글 목록--%>
        <%--        var getReply = function () {--%>
        <%--            var requestUrl = '/boardVO/getReplyList';--%>
        <%--            var data = {};--%>
        <%--            data.boardId = id;--%>
        <%--            $.ajax({--%>
        <%--                type: 'get',--%>
        <%--                url: requestUrl,--%>
        <%--                data: data,--%>
        <%--                dataType: 'json',--%>
        <%--                contentType: 'application/json',--%>
        <%--                success: function (data) {--%>
        <%--                    console.log("res data: ", data);--%>
        <%--                    var html = "";--%>
        <%--                    if (data.length > 0) {--%>
        <%--                        // ArrayObject, callback function(index, item)--%>
        <%--                        $.each(data, function (index, item) {--%>
        <%--                            html += "<tr>"--%>
        <%--                            html += "<th class='tcenter'>" + "<div>" + "<strong>" + item.replyWriter + "</strong>" + "</div>" + "</th>"--%>
        <%--                            html += "<th id='replyItem'>"--%>
        <%--                            html += "<div class='dropdown'>" //드롭다운 시작--%>
        <%--                            html += "<button  class='float-right btn btn-link' id='dropdownBtn' type='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"--%>
        <%--                            html += "<img src='/resources/image/more_vert-black-24dp.svg' alt='U/D icon'>"--%>
        <%--                            html += "</button>"--%>
        <%--                            html += "<div class='dropdown-menu dropdown-menu-right'  aria-labelledby='dropdownBtn' style='width: 100px'>" +--%>
        <%--                                "<button class='dropdown-item' type='button' onclick='replyUpdateForm(\"" + item.replyId + "\", \"" + item.replyContent + "\", \"" + item.replyWriter + "\")'>" + "<small>" + "수정" + "</small>" + "</button>" +--%>
        <%--                                "<button class='dropdown-item' type='button' onclick='replyDelete(" + item.replyId + ")'>" + "<small>" + "삭제" + "</small>" + "</button>" +--%>
        <%--                                "</div>"--%>
        <%--                            // javascript 이스케이프 사용: \" \"--%>
        <%--                            html += "</div>" //드롭다운 끝--%>
        <%--                            html += "<div>" + "<span>" + item.replyContent + "</span>" + "</div>"--%>
        <%--                            html += "<div class='mt-3'>" + "<small class='text-muted'>" + item.replyDatetime + "</small>" + "</div>"--%>
        <%--                            html += "</th>"--%>
        <%--                            html += "</tr>"--%>
        <%--                        });--%>
        <%--                        $("#replyList").append(html);--%>
        <%--                    }--%>
        <%--                }--%>
        <%--            })--%>
        <%--        }--%>

        <%--        // 댓글 쓰기--%>
        <%--        var replyWrite = function () {--%>
        <%--            var requestUrl = '/boardVO/insertReplyWrite';--%>
        <%--            var data = {}--%>
        <%--            data.boardId = id;--%>
        <%--            data.replyContent = $("#replyContent").val();--%>
        <%--            data = JSON.stringify(data); // Post로 보낼 경우 Json 타입으로 변환 시킨다 {key : "value"}--%>
        <%--            increaseReplyCnt();--%>
        <%--            $.ajax({--%>
        <%--                type: 'post',--%>
        <%--                url: requestUrl,--%>
        <%--                data: data,--%>
        <%--                dataType: 'json',--%>
        <%--                contentType: 'application/json',--%>
        <%--                success: function (data) {--%>
        <%--                    console.log("Response Data:", data);--%>
        <%--                    if (data.resultCode === 200) {--%>
        <%--                        alert("댓글이 작성되었습니다.")--%>
        <%--                        location.reload();--%>
        <%--                    }--%>
        <%--                }, error: function (xhr, e, data) {--%>
        <%--                    console.log("Response Error", data);--%>
        <%--                    alert("해당 작업을 실패하였습니다.")--%>
        <%--                }--%>
        <%--            });--%>
        <%--        }--%>

        <%--        // 댓글 수정 폼--%>
        <%--        var replyUpdateForm = function (replyId, replyContent, replyWriter) {--%>
        <%--            // 기존 댓글 목록 제거--%>
        <%--            $("#replyItem").children().empty();--%>

        <%--            if (replyId != null || replyId !== "" || replyId !== undefined) {--%>
        <%--                var html = "";--%>
        <%--                html += "<th class='tcenter'>" + "<div class='pt-2'>" + "<strong class='text-muted'>" + replyWriter + "</strong>" + "</div>" + "</th>"--%>
        <%--                html += "<th>"--%>
        <%--                html += "<div class='form-inline'>"--%>
        <%--                html += "<textarea id='replyContentUpdate' rows='1' name='cur' class='form-control rounded w-75' placeholder='댓글을 수정 중...' >" + replyContent + "</textarea>"--%>
        <%--                html += "<button class='btn btn-light btn-sm ml-2' type='button' onclick='replyUpdate(\"" + replyId + "\", \"" + replyWriter + "\")'>" + "수정" + "</button>"--%>
        <%--                html += "</div>"--%>
        <%--                html += "</th>"--%>
        <%--                $("#replyList").html(html);--%>

        <%--                // 글자 맨 마지막에 focus 맞춤--%>
        <%--                $.fn.setCursorPosition = function (pos) {--%>
        <%--                    this.each(function (index, elem) {--%>
        <%--                        if (elem.setSelectionRange) {--%>
        <%--                            elem.setSelectionRange(pos, pos);--%>
        <%--                        } else if (elem.createTextRange) {--%>
        <%--                            var range = elem.createTextRange();--%>
        <%--                            range.collapse(true);--%>
        <%--                            range.moveEnd('character', pos);--%>
        <%--                            range.moveStart('character', pos);--%>
        <%--                            range.select();--%>
        <%--                        }--%>
        <%--                    });--%>
        <%--                    return this;--%>
        <%--                };--%>
        <%--                $("#replyContentUpdate").focus().setCursorPosition($("textarea[name=cur]").val().length);--%>
        <%--                //  focus 맞춤끝;--%>
        <%--            } else {--%>
        <%--                alert("해당 작업 실패");--%>
        <%--            }--%>
        <%--        }--%>

        <%--        // 댓글 수정--%>
        <%--        function replyUpdate(replyId, replyWriter) {--%>

        <%--            var data = {};--%>
        <%--            data.replyId = replyId;--%>
        <%--            data.replyContent = $('#replyContentUpdate').val();--%>
        <%--            data.replyWriter = replyWriter;--%>
        <%--            data = JSON.stringify(data);--%>
        <%--            $.ajax({--%>
        <%--                type: 'post',--%>
        <%--                url: '/boardVO/getReplyUpdate',--%>
        <%--                data: data,--%>
        <%--                dataType: 'json',--%>
        <%--                contentType: 'application/json',--%>
        <%--                success: function (data) {--%>
        <%--                    if (data.resultCode === 200) {--%>
        <%--                        alert("해당 댓글이 수정되었습니다.")--%>
        <%--                        location.reload();--%>
        <%--                    }--%>
        <%--                }, error: function (xhr, e, data) {--%>
        <%--                    console.log("Response Error", data);--%>
        <%--                    alert("해당 작업을 실패하였습니다.")--%>
        <%--                }--%>

        <%--            });--%>
        <%--        }--%>

        <%--        // 댓글 삭제--%>
        <%--        var replyDelete = function (replyId) {--%>
        <%--            if (confirm("해당 댓글을 삭제하시겠습니까?")) {--%>
        <%--                var data = {};--%>
        <%--                data.replyId = replyId;--%>
        <%--                data = JSON.stringify(data);--%>
        <%--                decreaseReplyCnt();--%>
        <%--                $.ajax({--%>
        <%--                    type: 'post',--%>
        <%--                    url: '/boardVO/getReplyDelete',--%>
        <%--                    data: data,--%>
        <%--                    dataType: 'json',--%>
        <%--                    contentType: 'application/json',--%>
        <%--                    success: function (data) {--%>
        <%--                        console.log("Response Data:", data);--%>
        <%--                        if (data.resultCode === 200) {--%>
        <%--                            alert("댓글이 삭제되었습니다.")--%>
        <%--                            location.reload();--%>
        <%--                        }--%>
        <%--                    }, error: function (xhr, e, data) {--%>
        <%--                        console.log("Response Error", data);--%>
        <%--                        alert("해당 작업을 실패하였습니다.")--%>
        <%--                    }--%>
        <%--                });--%>
        <%--            } else {--%>
        <%--                return void (0);--%>
        <%--            }--%>

        <%--        }--%>

        <%--        // 댓글 수 증가--%>
        <%--        function increaseReplyCnt() {--%>
        <%--            var data = {}--%>
        <%--            data.boardId = id;--%>
        <%--            $.ajax({--%>
        <%--                type: 'post',--%>
        <%--                url: '/boardVO/increaseReplyCnt',--%>
        <%--                data: data,--%>
        <%--                dataType: 'json'--%>
        <%--            });--%>
        <%--        }--%>

        <%--        // 댓글 수 감소--%>
        <%--        function decreaseReplyCnt() {--%>
        <%--            var data = {}--%>
        <%--            data.boardId = id;--%>
        <%--            $.ajax({--%>
        <%--                type: 'post',--%>
        <%--                url: '/boardVO/decreaseReplyCnt',--%>
        <%--                data: data,--%>
        <%--                dataType: 'json'--%>
        <%--            });--%>
        <%--        }--%>
    </script>
</head>
<body class="body">
<%-- 헤더 --%>
<jsp:include page="/views/common/header.jsp"/>

<%-- 바디: 게시글 --%>
<section class="mt-2">
    <div class="container">
        <table class="table table-borderless">
            <tr class="tcenter thead-light">
                <th colspan="4">
                    <h4 class="font-weight-bold" id="title">${boardListDetail.title}</h4>
                </th>
            </tr>
            <tr class="tcenter border-bottom">
                <th>
                    <h6 class="font-weight-bold text-info">작성자</h6>
                </th>
                <td class="text-left">
                    <span id="writer">${boardListDetail.writer}</span>
                </td>
            </tr>
            <tr class="tcenter border-bottom">
                <th class="">
                    <span>첨부파일</span>
                </th>
                <td colspan="4" align="left">
                    <c:forEach var="file" items="${fileList}">
                        <a href="filedown.do?fileName=${file.ofilename}" class="fileview">
                            <span>${file.ofilename}</span>
                            <span>(${file.filesize}byte)</span><br>
                        </a>
                    </c:forEach>
                    <c:if test="${empty fileList}">
                        <span style="color: #A6A6A6; "> 첨부된 파일이 없습니다. </span>
                    </c:if>
                </td>
            </tr>
            <tr class="text-left">
                <td colspan="4" style="height: 200px; min-height: 200px; max-height: 500px; padding: 30px 50px;">
                    <span id="content" style="font-size: 1.2em;">${boardListDetail.content}</span>
                    <c:if test="${boardVO.writerId != userId}">
                        <div class="d-flex justify-content-end mt-5">
                            <button type="button" class="btn btn-light  mr-1" onclick="moveAction(4)">
                                <i class="far fa-heart"></i>&nbsp;&nbsp;${boardVO.recommendcnt}
                            </button>
                            <button type="button" class="btn btn-light mr-1" disabled="disabled">
                                <i class="fas fa-eye"></i>&nbsp;&nbsp;${boardVO.viewcnt}
                            </button>
                        </div>
                    </c:if>
                </td>
            </tr>

            <tr class="text-right thead-light border-bottom">
                <td colspan="4">
						<span>
							<small class="text-muted font-weight-bold"
                                   id="boardDatetime">${boardListDetail.boardDatetime}</small>
						</span>
                </td>
            </tr>
        </table>
    </div>
</section>

<%-- 바디: 댓글 --%>
<section>
    <div class="container">
        <table class="table table-borderless mt-4">
            <tr class="text-left">
                <th colspan="2">
                    <div class="d-flex justify-content-start">
                        <h5 class="font-weight-bold">
                            댓글
                            <span class="text-info font-weight-bold" id="replyCnt"></span>
                        </h5>
                    </div>
                </th>
            </tr>
            <%-- 댓글쓰기 --%>
            <tr class="tcenter" id="replyForm"></tr>
            <tbody id="replyList" class="border-top border-bottom"></tbody>
        </table>

        <div class="d-flex justify-content-end">
            <div class="mt-2">
                <input type="button" value="삭제" class="btn btn-outline-secondary" onclick="moveAction(1)"/>
                <input type="button" value="수정" class="btn btn-outline-secondary mx-1" onclick="moveAction(2)"/>
                <input type="button" value="목록" class="btn btn-outline-secondary" onclick="moveAction(3)"/>
            </div>
        </div>
    </div>
</section>

<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>