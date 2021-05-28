<%--
  Created by IntelliJ IDEA.
  User: berno
  Date: 2020-05-31
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="footer bg-light container-fluid sticky-top">
    <div class="container mt-5">
        <div class="row">
            <div>
                <p class="small">
                    <strong>고객센터 &gt;</strong>
                </p>
                <div class="sns-fill">
                    <ul class="nav nav-pills float-right">
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <img src="/resources/images/facebook.svg" alt="facebook">
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <img src="/resources/images/twitter.svg" alt="twitter">
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <img src="/resources/images/instagram.svg" alt="instgram">
                            </a>
                        </li>
                    </ul>
                </div>
                <p>
                    <label style="font-size: 1.7rem">
                        <strong>1544-1004</strong>
                    </label>
                    <br>
                    <span style="font-size: 0.9rem; margin-top: -20px;">평일 10:00~18:00(점심시간 12:00~13:00/주말&공휴일 제외)</span>
                </p>
                <address class="small">상호명(주)0000 이메일0000@0000.net 대표이사 0000 사업자등록번호0000-0000-0000
                    통신판매업신고번호제2018-서울서초-0000호
                    주소서울특별시 서초구 서초대로 0000
                </address>

                <p>Copyright © 2019 by ooo Republic</p>
            </div>
            <div class="text-right">
                <a href="${pageContext.request.contextPath}/admin/main">
                    <span class="small">관리자</span>
                </a>
            </div>
        </div>
    </div>
</footer>
