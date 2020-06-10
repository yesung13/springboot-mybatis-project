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
    <title>게시판</title>
    <script type="text/javascript">
        // 페이징
        // function getPage(totalPages) {
        //     var paging = "";
        //     for (var i = 0; i < totalPages; i += 1) {
        //         paging +=
        //             "<li class='page-item'>" +
        //             "<a class='page-link' href=\"javascript:void(0);\" onclick='getBoardList(" + i + ")' >" + (i + 1) + "</a></li>";
        //     }
        //     $(".pagination").append(paging);
        //     $('.page-item').on('click', function () {
        //         $('.page-item').removeClass('active');
        //         $(this).addClass('active');
        //     });
        // }

        // 게시글 검색
        let search_btn = function () {
            let data = {};
            data.type = type;
        }

        // 게시글 상세보기 및 게시글 조회수 증가
        function detail_btn(boardId) {
            location.href = '/board/detail?id=' + boardId;

            //게시글 조회수
            var data = {};
            data.boardId = boardId;
            $.ajax({
                type: 'put',
                url: '/board/viewCnt',
                data: data,
            });
        }


        // $(document).ready(function(){
        //     $("#notice_regi").on("click",function(){
        //         location.href="/test/noticeRegi"
        //     });
        // });
        function fn_paging(curPage) {
            location.href = "/board/list?curPage=" + curPage;
        }

        function notice_push(notice_id) {
            alert(notice_id);
        }

    </script>

</head>
<body>
<%-- 헤더(navbar) --%>
<jsp:include page="/views/common/header.jsp"/>

<%-- 바디 --%>
<section id="container">
    <table>
        <tr>
            <th><h2>게시판</h2></th>
        </tr>
    </table>
    <!-- 검색창 -->
    <div class="d-flex justify-content-center mt-4">
        <div class="w-75">
            <form action="${pageContext.request.contextPath}/board/search" method="get">
                <div class="input-group shadow rounded mb-3" id="searchForm">
                    <select class="col-2 form-control input-group-prepend" name="type">
                        <option id="title" value="title">제목</option>
                        <option id="content" value="content">내용</option>
                        <option id="writer" value="writer">작성자</option>
                    </select>
                    <input type="text" class="col-10 form-control" placeholder="검색어를 입력하세요" name="keyword">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary form-control " type="submit">
                            <img src="${pageContext.request.contextPath}/resources/image/search-black-24dp.svg"
                                 alt="search_img"></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- //검색창  -->

    <%-- 게시판 --%>
    <div class="row mt-5 mb-2 pl-1">
        <div class="col-9">
            <span class="float-left">
             총 게시글 수 : ${pagination.listCnt } / 총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage }
            / 총 블럭 수 : ${pagination.rangeCnt } / 현재 블럭 : ${pagination.curRange }
            </span>
        </div>
        <div class="col-3">
            <button class="btn btn-success btn-sm float-right" onclick="location.href='/board/write'">글쓰기</button>
        </div>
    </div>

    <table class="table table-bordered table-striped table-hover">
        <thead class="thead-dark">
        <tr class="text-center">
            <th width="10%">번호</th>
            <th width="40%">제목</th>
            <th width="10%">작성자</th>
            <th width="10%">조회수</th>
            <th width="10%">댓글수</th>
            <th width="20%">작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${fn:length(boardList) == 0 || fn:length(boardList)==null}">
                <tr>
                    <td style="text-align: center" colspan="6"><span>게시글이 없습니다</span></td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="item" items="${boardList}">
                    <tr>
                        <td style="text-align: center">${item.no}</td>
                        <td>
                            <button type="button" class="btn btn-link text-decoration-none text-info"
                                    onclick="detail_btn(${item.boardId})">${item.title}</button>
                        </td>
                        <td style="text-align: center">${item.writer}</td>
                        <td style="text-align: center">${item.viewCnt}</td>
                        <td style="text-align: center">${item.replyCnt}</td>
                        <td style="text-align: center">${item.boardDatetime}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

    <%--
        **jstl 비교문법**
            == 또는 eq
            != 또는 ne
            < lt
            > gt
            <= le
            >= ge
            empty : list, map같은 객체가 비어있을 경우
    --%>
    <%-- 페이징 --%>
    <ul class="pagination pagination-sm justify-content-center">
        <li class="page-item">
            <c:if test="${pagination.curRange ne 1 }">
                <a href="javascript:void(0)" class="page-link" onClick="fn_paging(1)">[처음]</a>
            </c:if>
        </li>
        <li class="page-item">
            <c:if test="${pagination.curPage ne 1}">
                <a href="javascript:void(0)" class="page-link" onClick="fn_paging('${pagination.prevPage }')"
                   aria-label="previous">< 이전</a>
            </c:if>
        </li>
        <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
            <li class="page-item">
                <c:choose>
                    <c:when test="${pageNum eq  pagination.curPage}">
                    <span class="font-weight-bold">
                        <a href="javascript:void(0)" class="page-link"
                           onClick="fn_paging('${pageNum }')">${pageNum }</a>
                    </span>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:void(0)" class="page-link"
                           onClick="fn_paging('${pageNum }')">${pageNum }</a>
                    </c:otherwise>
                </c:choose>
            </li>
        </c:forEach>
        <li class="page-item">
            <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                <a href="javascript:void(0)" class="page-link" onClick="fn_paging('${pagination.nextPage }')"
                   aria-label="next">다음 ></a>
            </c:if>
        </li>
        <li class="page-item">
            <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                <a href="javascript:void(0)" class="page-link"
                   onClick="fn_paging('${pagination.pageCnt }')">[끝]</a>
            </c:if>
        </li>
    </ul>
</section>

<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>
