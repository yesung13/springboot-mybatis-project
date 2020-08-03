<%--
  Created by IntelliJ IDEA.
  User: berno
  Date: 2020-07-31
  Time: 오후 15:32
  To change this template use File | Settings | File Templates.
--%>
<%--
    애로사항
    - 글쓰기 시 파일첨부 후 초기화 버튼을 누르면 'byte' 글자가 상세보기 페이지에서 보임
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
            // $("button[type='submit']").click(function () {
            //     writeCheck_btn();
            // });
            $('#back_btn').click(function () {
                window.location.href = '/board/list';
            });

            // let formObj = $("form[role='form']");
            //
            // $("button[type='submit']").on("click", function (e) {
            //
            //     e.preventDefault();
            //
            //     console.log("submit clicked");
            //
            //     let str = "";
            //
            //     $(".uploadResult ul li").each(function (i, obj) {
            //
            //         let jobj = $(obj);
            //
            //         console.dir(jobj);
            //         console.log("-------------------------");
            //         console.log(jobj.data("filename"));
            //
            //
            //         str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
            //         str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
            //         str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
            //         str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
            //
            //     });
            //
            //     console.log(str);
            //
            //     formObj.append(str).submit();
            //
            // });

            // 정규 표현식(regex). 파일 검사
            let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
            let maxSize = 225443840; //215MB

            function checkExtension(fileName, fileSize) {

                if (fileSize >= maxSize) {
                    alert("파일 사이즈 초과");
                    return false;
                }

                if (regex.test(fileName)) {
                    alert("해당 종류의 파일은 업로드 할 수 없습니다.")
                    return false;
                }
                return true;

            }

            // end 정규 표현식(regex). 파일 검사

            // 파일 업로드 상세처리
            $("input[type='file']").change(function (e) {
                let formData = new FormData();

                let inputFile = $("input[name='uploadFile']");

                let files = inputFile[0].files;

                //add filedata to formdata
                for (let i = 0; i < files.length; i++) {
                    if (!checkExtension(files[i].name, files[i].size)) {
                        return false;
                    }
                    formData.append("uploadFile", files[i]);
                }
                $.ajax({
                    url: '/board/uploadAjaxAct',
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    dataType: 'json',
                    success: function (result) {
                        console.log(result);
                        showUploadResult(result); //업로드 결과 처리 함수
                    }
                }); //$.ajax

            });

            //업로드 한 파일 이름 출력
            function showUploadResult(uploadResultArr) {
                if (!uploadResultArr || uploadResultArr.length === 0) {
                    return;
                }

                let uploadUL = $(".uploadResult ul");

                let str = "";

                $(uploadResultArr).each(function (i, obj) {

                    // image type
                    if (obj.image) {
                        let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
                        str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>" +
                            "<span> " + obj.fileName + "</span>" +
                            "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-warning rounded-circle'><span aria-hidden='true'>&times;</span></button><br>" +
                            "<img class='rounded' src='/board/display?fileName=" + fileCallPath + "'>" +
                            "</div></li>";
                    } else {

                        let fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);

                        let fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");

                        str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>" +
                            "<span> " + obj.fileName + "</span>" +
                            "<button type='button'  data-file=\'" + fileCallPath + "\' data-type='file' class='btn btn-warning rounded-circle'><span aria-hidden='true'>&times;</span></button><br>" +
                            "<img src='/resources/images/attach.png'></a>" +
                            "<div></li>"
                    }
                });

                uploadUL.append(str);
            }

            // end 업로드한 파일 이름 출력


            // 파일삭제 'x' 버튼 이벤트
            $(".uploadResult").on("click", "button", function (e) {

                console.log("delete file");

                let targetFile = $(this).data("file");
                let type = $(this).data("type");

                let targetLi = $(this).closest("li");

                $.ajax({
                    url: '/board/deleteFile',
                    data: {fileName: targetFile, type: type},
                    dataType: 'text',
                    type: 'POST',
                    success: function (result) {
                        alert(result);
                        targetLi.remove();
                        // location.reload();
                    }
                }); //$.ajax
            });
            // end 파일삭제 'x' 버튼 이벤트


        }); // end doc ready


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

        // 게시글 등록
        function write_btn() {
            // let form = $('#form')[0];
            // let data = new FormData(form);
            let formObj = $("form[role='form']");

            let str = "";

            $(".uploadResult ul li").each(function (i, obj) {

                let jobj = $(obj);

                console.dir(jobj);
                console.log("-------------------------");
                console.log(jobj.data("filename"));


                str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
                str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";

            });

            console.log(str);

            // formObj.append(str).submit();
            formObj.append(str);

            let data = new FormData(formObj[0]);

            console.log("Insert Request Data:", data);

            $.ajax({
                type: "POST",
                url: '/board/register',
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

<%-- 헤더 --%>
<jsp:include page="/views/common/header.jsp"/>

<%-- 바디 --%>
<section>
    <div class="container mt-5">
        <h3 class="text-center">글쓰기</h3>
        <%--        <form id="form" role="form" action="${pageContext.request.contextPath}/board/register" method="post">--%>
        <form id="form" role="form">
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
                    <textarea id="content" name="content" rows="8" class="form-control w-100 mb-1"
                              onkeyup="fnCheckByte(this)" placeholder="내용을 입력하세요..."></textarea>

                        <div class="d-inline ">
                            <span id="byteInfo" class="font-weight-bold">0</span>&nbsp;<span class="font-weight-bold">bytes</span>
                            &nbsp;&nbsp;<span style="font-weight: lighter;"> ※ 최대 입력 가능 글자수 100 byte </span>
                        </div>
                    </td>
                </tr>
                <tr class="thead-light">
                    <th class="tcenter ">
                        <label for="file">첨부파일</label>
                    </th>
                    <td>
                        <div class="uploadDiv">
                            <input type="file" id="file" name="uploadFile" multiple/>
                            <span class="date">&nbsp;&nbsp;※&nbsp;jpg, png, zip, hwp, docx, pdf 확장자만 첨부 가능 </span>
                        </div>
                        <div class="uploadResult">
                            <ul></ul>
                        </div>
                    </td>
                </tr>

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

<%-- 푸터 --%>
<jsp:include page="/views/common/footer.jsp"/>
</body>
</html>
