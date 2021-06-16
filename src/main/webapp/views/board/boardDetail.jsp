
<%--
  Created by IntelliJ IDEA.
  User: berno
  Date: 2020-07-31
  Time: 오후 16:08
  To change this template use File | Settings | File Templates.
--%>
<%--
    애로사항
    - 글 삭제 시 disk 파일 삭제 안됨.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>글보기:${boardListDetail.title}</title>
    <style>
        .uploadResult {
            width: 100%;
            /*background-color: gray;*/
        }

        .uploadResult ul {
            display: flex;
            flex-flow: row;
            justify-content: start;
            align-items: start;
        }

        .uploadResult ul li {
            list-style: none;
            padding: 10px;
            align-content: center;
            text-align: start;
        }

        .uploadResult ul div span {
            text-align: left;
        }

        .uploadResult ul li img {
            width: 100px;
        }

        .uploadResult ul li span {
            color: blue;
            text-align: left;
        }

        .bigPictureWrapper {
            position: absolute;
            display: none;
            justify-content: center;
            align-items: center;
            top: 0%;
            width: 100%;
            height: 100%;
            background-color: gray;
            z-index: 100;
            background: rgba(255, 255, 255, 0.5);
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
    </style>
    <script type="text/javascript">
        const boardId = ${boardListDetail.boardId};
        $(document).ready(function () {
            $('#list_btn').click(function () {
                window.location.href = "/board/list";
            });
            $('#modify_btn').click(function () {
                if (confirm("게시글을 수정 하시겠습니까?")) {
                    location.href = "/board/modify?id=" + boardId;
                }
            });
            $('#delete_btn').click(function () {
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
                            if (res.resCode === 604) {
                                alert(res.resMsg);
                                location.replace('/board/list');
                            } else if (res.resCode === 605) {
                                alert(res.resMsg);
                                location.reload();
                            }


                        }, error: function (xhr, e, data) {
                            console.log("Response Error", data);
                            alert("에러!!");
                            window.location.reload(true); // 캐시 제거 후 새 파일 로드 HTTP 200
                        }
                    });
                }
            });
            $('#replyWrite_btn').click(function () {
                // 댓글 유효성 검사
                let replyContent = $('#replyContent').val();
                if (replyContent == null || replyContent === "") {
                    alert("댓글을 입력하세요");
                    return false;
                }
                return replyWrite_btn();
            });

            //추가
            // jquery.getJSON(url, data, success) => ajax 간단하게 표현
            $.getJSON("/board/getAttachList", {boardId: boardId}, function (arr) {

                console.log("arr: ", arr);
                console.log("arr: ", arr.length);

                let str = "";
                if (arr.length > 0) {
                    $(arr).each(function (i, attach) {

                        //image type
                        if (attach.fileType) {
                            let fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);

                            str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
                            str += "<img class='rounded' src='/board/display?fileName=" + fileCallPath + "'>";
                            str += "</div>";
                            str += "</li>";
                        } else {

                            str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
                            str += "<span> " + attach.fileName + "</span><br/>";
                            str += "<img src='/resources/images/attach.png'></a>";
                            str += "</div>";
                            str += "</li>";
                        }
                    });

                    $(".uploadResult ul").html(str);
                } else {
                    str += "<span style='color: #A6A6A6'>첨부된 파일이 없습니다.</span>"

                    $(".uploadResult div").html(str);

                }


            });//end getjson

            // 파일 이벤트(섬네일 이미지 보기, 일반파일 다운로드)
            $(".uploadResult").on("click", "li", function (e) {

                console.log("view image");

                let liObj = $(this);

                let path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));

                if (liObj.data("type")) {
                    showImage(path.replace(new RegExp(/\\/g), "/"));
                } else {
                    //download
                    // self.location = "/board/download?fileName=" + path
                    window.location.assign("/board/download?fileName=" + path);
                }


            });

            function showImage(fileCallPath) {

                // alert(fileCallPath);

                $(".bigPictureWrapper").css("display", "flex").show();

                $(".bigPicture")
                    .html("<img src='/board/display?fileName=" + fileCallPath + "' >")
                    .animate({width: '100%', height: '100%'}, 1000);

            }

            $(".bigPictureWrapper").on("click", function (e) {
                $(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
                setTimeout(function () {
                    $('.bigPictureWrapper').hide();
                }, 1000);
            });

        }); //end document ready

        // 댓글 쓰기
        function replyWrite_btn() {
            let form = $('#boardDetailForm')[0];
            let data = new FormData(form);
            $.ajax({
                url: '/board/replyWrite',
                type: 'POST',
                data: data,
                processData: false,
                contentType: false,
                success: function (response) {
                    console.log("Insert Response Data:", response);
                    if (response.resCode === 200) {
                        alert(response.resMsg);
                        location.replace('/board/detail?id=' + boardId);
                    } else if (response.resCode === -1) {
                        alert(response.resMsg);
                    }
                },
                error: function (xhr, e, response) {
                    console.log("Insert Error:", xhr, e, response);
                    alert("에러!!")
                }
            });
        }

        // 댓글 수정 폼
        let replyUpdate_form = function (boardId, replyId, replyWriter, replyContent) {
            // 기존 댓글 목록 제거
            $("#replyList").children().empty();
            if (replyId != null || replyId !== "" || replyId !== undefined) {
                var html = "";
                html += "<th class='tcenter'>" + "<div class='pt-2'>" + "<strong class='text-muted'>" + replyWriter + "</strong>" + "</div>" + "</th>"
                html += "<th>"
                html += "<div class='form-inline'>"
                html += "<textarea id='replyContentUpdate' rows='1' name='cur' class='form-control rounded w-75' placeholder='댓글을 수정 중...' >" + replyContent + "</textarea>"
                html += "<button class='btn btn-light btn-sm ml-2' type='button' onclick='replyUpdate_btn(\"" + replyId + "\", \"" + replyWriter + "\")'>" + "수정" + "</button>"
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
        function replyUpdate_btn(replyId, replyWriter) {
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
                            window.location.reload();
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
        let replyDelete_btn = function (replyId, boardId) {
            if (confirm("해당 댓글을 삭제 하시겠습니까?")) {
                var data = {};
                data.replyId = replyId;
                data.boardId = boardId;
                data = JSON.stringify(data);
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
                            window.location.reload();
                        } else if (res === -1) {
                            alert("댓글을 삭제할 수 없습니다.")
                            window.location.reload();
                        }
                    }, error: function (xhr, e, data) {
                        console.log("Response Error", data);
                        alert("에러!!")
                    }
                });
            } else {
                return void (0);
            }
        }
    </script>
</head>
<body class="body">
<%-- 헤더 --%>
<jsp:include page="/views/common/header.jsp"/>
<%-- security 계정 정보 --%>
<sec:authentication property="principal" var="userInfo"/>
<%-- //security 계정 정보 --%>

<%-- 바디: 게시글 --%>
<section class="mt-2">
    <div class="container">
        <table class="table table-borderless">
            <tr class="tcenter thead-light">
                <th colspan="4">
                    <h4 class="font-weight-bold" id="title">${boardListDetail.title}</h4>
                </th>
            </tr>
            <tr class="border-bottom">
                <th class="tcenter">
                    <h6 class="font-weight-bold text-info">작성자</h6>
                </th>
                <td class="text-left">
                    <span id="writer">${boardListDetail.writer}</span>
                </td>
            </tr>
            <tr class="border-bottom">
                <th class="tcenter">
                    <span>첨부파일</span>
                </th>
                <td colspan="4">
                    <div class="uploadResult">
                        <div></div> <%-- 첨부파일 없을 경우 출력--%>
                        <ul></ul>
                    </div>
                </td>
            </tr>
            <tr class="text-left">
                <td colspan="4" style="height: 200px; min-height: 200px; max-height: 500px; padding: 30px 50px;">
                    <span id="content" style="font-size: 1.2em;">${boardListDetail.content}</span>
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
                            <c:choose>
                                <c:when test="${boardListDetail.replyCnt > 0}">
                                    <span class="text-info font-weight-bold"
                                          id="replyCnt">${boardListDetail.replyCnt}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-info font-weight-bold" id="replyCnt">0</span>
                                </c:otherwise>
                            </c:choose>
                        </h5>

                    </div>
                </th>
            </tr>
            <%-- 댓글 쓰기 --%>
            <tr class="tcenter" id="changeUpdateForm">
                <form id="boardDetailForm">
                    <%-- 게시글 정보 hidden으로 넘기기 --%>
                    <input type="hidden" name="boardId" value="${boardListDetail.boardId}">
                    <input type="hidden" name="accountId" value="${userInfo.accountId}">
                    <input type="hidden" name="replyWriter" value="${userInfo.accountUserNm}">
                    <th>
                        <div class="pt-2"><strong id="replyWriter" class="text-muted">댓글 작성자</strong></div>
                    </th>
                    <th>
                        <div class="form-inline">
                            <textarea id="replyContent" name="replyContent" rows="1" class="form-control rounded w-75"
                                      placeholder="댓글을 남겨보세요"></textarea>
                            <button class="btn btn-secondary ml-2" type="button" id="replyWrite_btn">등록</button>
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
                                <c:if test="${userInfo.accountId eq item.accountId}">
                                    <%--드롭다운 시작--%>
                                    <div class="dropdown">
                                        <button class="float-right btn btn-link" id="dropdownBtn" type="button"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <img src="${pageContext.request.contextPath}/resources/images/more_vert-black-24dp.svg"
                                                 alt="U/D icon">
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownBtn"
                                             style="width: 100px">
                                                <%-- onclick 사용 시 함수에 여러 파라미터 값을 보낼 때 데이터 타입에 맞게 홑따옴표를 사용해야 함 --%>
                                            <button class="dropdown-item" type="button"
                                                    onclick="replyUpdate_form(${item.boardId},${item.replyId},'${item.replyWriter}','${item.replyContent}')">
                                                <small>수정</small></button>
                                            <button class="dropdown-item" type="button"
                                                    onclick="replyDelete_btn('${item.replyId}',${item.boardId})">
                                                <small>삭제</small></button>
                                        </div>
                                    </div>
                                    <%--//드롭다운 끝--%>
                                </c:if>
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
                <c:choose>
                    <c:when test="${userInfo.accountId eq boardListDetail.accountId}">
                        <input type="button" value="삭제" class="btn btn-outline-secondary" id="delete_btn"/>
                        <input type="button" value="수정" class="btn btn-outline-secondary mx-1" id="modify_btn"/>
                        <input type="button" value="목록" id="list_btn" class="btn btn-outline-secondary"/>
                    </c:when>
                    <c:otherwise>
                        <input type="button" value="목록" id="list_btn" class="btn btn-outline-secondary"/>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
</section>
<%-- 추가: 파일 원본 이미지 출력--%>
<div class="bigPictureWrapper">
    <div class="bigPicture"></div>
</div>
<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>