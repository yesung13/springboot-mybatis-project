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
    <table class="table table-borderless" style="float: right">
        <tr>
            <td>
                <button class="btn btn-link" style="float: right" onclick="location.href='/boardVO/write'">글쓰기</button>
            </td>
        </tr>
    </table>
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

    <%-- paigng --%>
    <ul class="pagination justify-content-center">
        <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getBoardList(0)">1</a></li>
        <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getBoardList(1)">2</a></li>
        <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getBoardList(2)">3</a></li>
        <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getBoardList(3)">4</a></li>
    </ul>
</section>

<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>
