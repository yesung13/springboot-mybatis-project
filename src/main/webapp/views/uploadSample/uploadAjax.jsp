<%--
  Created by IntelliJ IDEA.
  User: blucean
  Date: 2020-07-28
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/views/common/htmlHead.jsp" %>
<html>
<head>
    <title>Upload with Ajax</title>
</head>
<body>
<h1>Upload with Ajax</h1>
<div class="uploadDiv">
    <input type="file" name="uploadFile" multiple>
</div>
<button id="uploadBtn">Upload</button>
<script type="text/javascript">
    $(document).ready(function () {
        // #파일 업로드 상세처리
        // 정규 표현식(regex)
        let regex = new RegExp("(.*?)\.(exe|sh|zip|alz|pdf)$");
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
        // end 파일 업로드 상세처리

        $("#uploadBtn").on("click", function (e) {
            let formData = new FormData();
            let inputFile = $("input[name='uploadFile']");
            let files = inputFile[0].files;

            console.log(files);

            //add filedate to formdata
            for (let i = 0; i < files.length; i++) {
                // 파일 업로드 상세처리 메서드 사용
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }

                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                url: '/uploadAjaxAct',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                success: function (result) {
                    alert("Uploaded");
                }

            }); // $.ajax
        });
    });

</script>
</body>
</html>
