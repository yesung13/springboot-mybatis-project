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
    <title>글보기:${boardListDetail.title}</title>
    <%--    <c:if test="${errCode == null}">--%>
    <%--        <c:set var="errCode" value="\"\"">--%>
    <%--        </c:set>--%>
    <%--    </c:if>--%>
    <script type="text/javascript">
        // 글 수정
        function modify_btn(boardId) {
            if (confirm("게시글을 수정 하시겠습니까?")) {
                location.href = "/board/update?id=" + boardId;
            }
        }
        // 글 삭제
        function delete_btn(boardId) {
            if (confirm("게시글을 삭제 하시겠습니까?")) {
                var requestUrl = '/board/delete';
                var data = {}
                data.boardId = boardId;
                data = JSON.stringify(data);
                $.ajax({
                    type: 'post',
                    url: requestUrl,
                    data: data,
                    dataType: 'json',
                    contentType: 'application/json',
                    success: function (res) {
                        console.log("Response Data:", res);
                        if (res === 0) {
                            alert("게시글이 삭제 되었습니다.");
                        } else if (res !== 0) {
                            alert("게시글을 삭제할 수 없습니다.");
                        }
                        location.replace('/board/list');

                    }, error: function (xhr, e, data) {
                        console.log("Response Error", data);
                        alert("에러!!");
                        location.reload();
                    }
                });

            }
        }

        // 댓글 유효성 검사
        function replyCheck() {
            let replyContent = $('#replyContent').val();
            if (replyContent == null || replyContent === "") {
                alert("댓글을 입력하세요");
                location.reload();
                return false;
            }
            return true;
        }

        // 댓글 수정 폼
        var replyUpdate_form = function (boardId, replyId, replyWriter, replyContent) {
            // 기존 댓글 목록 제거
            $("#replyList").children().empty();
            if (replyId != null || replyId !== "" || replyId !== undefined) {
                var html = "";
                html += "<th class='tcenter'>" + "<div class='pt-2'>" + "<strong class='text-muted'>" + replyWriter + "</strong>" + "</div>" + "</th>"
                html += "<th>"
                html += "<div class='form-inline'>"
                html += "<textarea id='replyContentUpdate' rows='1' name='cur' class='form-control rounded w-75' placeholder='댓글을 수정 중...' >" + replyContent + "</textarea>"
                html += "<button class='btn btn-light btn-sm ml-2' type='button' onclick='replyUpdate_btn(\"" + replyId + "\", \"" + replyWriter + "\", \"" + replyContent + "\")'>" + "수정" + "</button>"
                html += "<button class='btn btn-light btn-sm ml-2' type='button' onclick='location.href=\"/board/detail?id=\"+\"" + boardId + "\"'>" + "취소" + "</button>"
                html += "</div>"
                html += "</th>"
                $("#changeUpdateForm").html(html);

                // 글자 맨 마지막에 focus 맞춤
                $.fn.setCursorPosition = function (pos) {
                    this.each(function (index, elem) {
                        if (elem.setSelectionRange) {
                            elem.setSelectionRange(pos, pos);
                        } else if (elem.createTextRange) {
                            var range = elem.createTextRange();
                            range.collapse(true);
                            range.moveEnd('character', pos);
                            range.moveStart('character', pos);
                            range.select();
                        }
                    });
                    return this;
                };
                $("#replyContentUpdate").focus().setCursorPosition($("textarea[name=cur]").val().length);
                //  focus 맞춤끝;
            }
        }

        // 댓글 수정
        function replyUpdate_btn(replyId, replyWriter, replyContent) {
            // 수정 댓글 유효성 검사
            let replyContentUpdate = $('#replyContentUpdate').val();
            if (replyContentUpdate == null || replyContentUpdate === "") {
                alert("수정할 내용을 입력해주세요.");
            } else {
                var data = {};
                data.replyId = replyId;
                data.replyWriter = replyWriter;
                data.replyContent = replyContentUpdate;
                data = JSON.stringify(data);
                console.log("data", data);
                $.ajax({
                    type: 'post',
                    url: '/board/replyUpdate',
                    data: data,
                    dataType: 'json',
                    contentType: 'application/json',
                    success: function (res) {
                        if (res === 0) {
                            alert("해당 댓글이 수정되었습니다.")
                            location.reload();
                        } else if (res !== 0) {
                            alert("해당 댓글 수정을 실패하였습니다.")
                        }
                    }, error: function (xhr, e, res) {
                        console.log("Response Error", res);
                        alert("에러!!")
                    }
                });
            }
        }

        // 댓글 삭제
        let replyDelete_btn = function (replyId) {
            if (confirm("해당 댓글을 삭제 하시겠습니까?")) {
                var data = {};
                data.replyId = replyId;
                data = JSON.stringify(data);
                // decreaseReplyCnt();
                $.ajax({
                    type: 'post',
                    url: '/board/replyDelete',
                    data: data,
                    dataType: 'json',
                    contentType: 'application/json',
                    success: function (res) {
                        console.log("Response Data:", res);
                        if (res === 0) {
                            alert("댓글이 삭제되었습니다.")
                            location.reload();
                        } else if (res === -1) {
                            alert("댓글을 삭제할 수 없습니다.")
                            location.reload();
                        }
                    }, error: function (xhr, e, data) {
                        console.log("Response Error", data);
                        alert("에러!!")
                    }
                });
            } else {
                return void (0);
            }

            // // 댓글 수 증가
            // function increaseReplyCnt(boardId) {
            //     var data = {}
            //     data.boardId = boardId;
            //     $.ajax({
            //         type: 'post',
            //         url: '/board/increaseReplyCnt',
            //         data: data,
            //         dataType: 'json'
            //     });
            // }
            //
            // // 댓글 수 감소
            // function decreaseReplyCnt() {
            //     var data = {}
            //     data.boardId = id;
            //     $.ajax({
            //         type: 'post',
            //         url: '/board/decreaseReplyCnt',
            //         data: data,
            //         dataType: 'json'
            //     });
            // }
        }
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
            <tbody>
            <tr class="text-left">
                <th colspan="2">
                    <div class="d-flex justify-content-start">
                        <h5 class="font-weight-bold">
                            댓글
                            <span class="text-info font-weight-bold" id="replyCnt">${boardListDetail.replyCnt}</span>
                        </h5>
                    </div>
                </th>
            </tr>
            <%-- 댓글 쓰기 --%>
            <tr class="tcenter" id="changeUpdateForm">
                <form action="${pageContext.request.contextPath}/board/replyWrite" method="post"
                      onsubmit="replyCheck()"><%-- onsubmit의 결과 값이 true 이면 submit --%>
                    <%-- 게시글 정보 hidden으로 넘기기 --%>
                    <input type="hidden" name="boardId" value="${boardListDetail.boardId}">
                    <th>
                        <div class="pt-2"><strong id="replyWriter" class="text-muted">댓글 작성자</strong></div>
                    </th>
                    <th>
                        <div class="form-inline">
                            <textarea id="replyContent" name="replyContent" rows="1" class="form-control rounded w-75"
                                      placeholder="댓글을 남겨보세요"></textarea>
                            <button class="btn btn-secondary ml-2" type="submit">등록</button>
                        </div>
                    </th>
                </form>
            </tr>
            </tbody>
            <%-- 댓글 목록 --%>
            <tbody id="replyList" class="border-top border-bottom">
            <c:choose>
                <c:when test="${fn:length(replyList) eq 0 || fn:length(replyList) eq null}">
                    <tr>
                        <td class="tcenter" colspan="2"><span class="text-black-50">댓글이 없습니다.</span></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="item" items="${replyList}">
                        <tr>
                            <th class="tcenter">
                                <div><strong>${item.replyWriter}</strong></div>
                            </th>
                            <th>
                                    <%--드롭다운 시작--%>
                                <div class="dropdown">
                                    <button class="float-right btn btn-link" id="dropdownBtn" type="button"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <img src="${pageContext.request.contextPath}/resources/image/more_vert-black-24dp.svg"
                                             alt="U/D icon">
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownBtn"
                                         style="width: 100px">
                                            <%-- onclick 사용 시 함수에 여러 파라미터 값을 보낼 때 데이터 타입에 맞게 홑따옴표를 사용해야 함 --%>
                                        <button class="dropdown-item" type="button"
                                                onclick="replyUpdate_form(${item.boardId},${item.replyId},'${item.replyWriter}','${item.replyContent}')">
                                            <small>수정</small></button>
                                        <button class="dropdown-item" type="button"
                                                onclick="replyDelete_btn('${item.replyId}')"><small>삭제</small></button>
                                    </div>
                                </div>
                                    <%--//드롭다운 끝--%>
                                <div><span>${item.replyContent}</span></div>
                                <div class="mt-3"><small class="text-muted">${item.replyDatetime}</small></div>
                            </th>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
            <%-- //댓글 목록 --%>
        </table>

        <%-- 게시글 버튼 --%>
        <div class="d-flex justify-content-end">
            <div class="mt-2">
                <input type="button" value="삭제" class="btn btn-outline-secondary"
                       onclick="delete_btn(${boardListDetail.boardId})"/>
                <input type="button" value="수정" class="btn btn-outline-secondary mx-1"
                       onclick="modify_btn(${boardListDetail.boardId})"/>
                <input type="button" value="목록" class="btn btn-outline-secondary"
                       onclick="location.href = '/board/list'"/>
            </div>
        </div>
</section>

<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>