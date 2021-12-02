<%--
  Created by IntelliJ IDEA.
  User: yys
  Date: 2021-12-02
  Time: 오후 1:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        $(document).ready(function () {

            // 파일 첨부 시 checkUploadFiles() 실행
            $('#uploadBtn').on('change', checkUploadFiles);
        });

        $(function () {
            $('.file_name').click(function (e) {
                e.preventDefault();
                $('#uploadBtn').click();
            });
        });

        let fileCount = 0; // 파일 현재 필드 숫자, totalcount랑 비교값
        let totalCount = 3; // 해당 숫자를 수정하여 전체 업로드 갯수를 정한다
        let fileNum = 0; // 파일 고유넘버
        let content_files = new Array();

        function checkUploadFiles(e) {
            let files = e.target().files;

            // 파일 배열 담기
            let filesArr = Array.prototype.slice.call(files);

            // 파일 개수 확인 및 제한
            if (fileCount + filesArr.length > totalCount) {
                alert("파일은 최대 " + totalCount + "개까지 업로드 할 수 있습니다.");
                $('.file__name').val("");
                $('#uploadBtn').val("");
                return false;
            } else {
                fileCount = fileCount + filesArr.length;
            }

            filesArr.forEach(function (f) {
                let reader = new FileReader();

                if (!checkExt(f.name, f.size)) {
                    $('.file__name').val("");
                    $('#uploadBtn').val("");
                    fileCount--;
                    return false;
                }
                reader.onload = function (e) {
                    content_files.push(f);
                    $('#fileList').append(
                        '<div id="file' + fileNum + '" class="file__list margin-top-base1">' + f.name +
                        '<button type="button" class="btn__base btn__base--line btn__file--del" onclick="fn_fileDelete(\'file' + fileNum + '\');">X</button>' +
                        '</div>'
                    );
                    fileNum++;
                };
                reader.readAsDataURL(f);
            });

            //초기화 한다
            $('.file__name').val("");
            $('#uploadBtn').val("");
        }

        function fn_fileDelete(fileNum) {
            let no = fileNum.replace(/[^0-9]/g, "");

            content_files.splice(no, 1);
            $('#' + fileNum).remove();
            $('.file__name').val("");
            fileCount--;
        }

        function checkExt(fileName, fileSize) {
            let _fileLen = fileName.length;
            let _lastDot = fileName.lastIndexOf('.');

            // 확장자명만 추출한 후 소문자로 변경
            fileName = fileName.substring(_lastDot, _fileLen).toLowerCase();

            // 정규 표현식 파일검사
            let fileExts = new RegExp("(.*?)\.(doc|docx|xlsx|ppt)$");
            let maxSize = 10 * 1024 * 1024 // 10MB

            if(fileSize >= maxSize) {
                alert("최대용량을 초과했습니다.");
                return false;
            }

            if(!fileExts.test(fileName)) {
                alert("첨부가능한 파일 확장자가 아닙니다.");
                return false;
            }
        }
    </script>
</head>
<body>
<div class="content">
    <div class="wrap__wr__agree">
        <table class="form__table">
            <col style="width: 185px" />
            <col />

            <tr>
                <th class="vertical--top">파일첨부</th>
                <td>
                    <div class="file__wrap">
                        <label for="uploadBtn" class="btn__file">파일선택</label>
                        <input type="text" class="file__name" readonly >
                        <input type="file" id="uploadBtn" class="upload__btn" multiple>
                    </div>
                    <p class="font--small font--color2 margin-top-base1">
                        * 최대 3개, 파일 용량 10MB
                    </p>
                    <div id="fileList"></div>
                </td>
            </tr>
        </table>
    </div>
</div>

</body>
</html>
