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
    <style type="text/css">
        .uploadResult {
            width: 100%;
            background-color: gray;
        }

        .uploadResult ul {
            display: flex;
            flex-flow: row;
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
            background: rgba(255, 255, 255, 0, 5);
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

            //업로드한 파일 이름 출력
            let uploadResult = $(".uploadResult ul");

            function showUploadedFile(uploadResultArr) {

                let str = "";

                $(uploadResultArr).each(function (i, obj) {
                    if (!obj.image) {
                        let fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);

                        let fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");

                        str += "<li><div><a href='/download?fileName=" + fileCallPath + "'>" +
                            "<img src='/resources/images/baseline_attachment_black_24dp.png'>" + obj.fileName + "</a>" +
                            "<span data-file=\'" + fileCallPath + "\' data-type='file'> x </span>" +
                            "<div></li>"

                        str += "<li><a href='/download?fileName=" + fileCallPath + "'>" +
                            "<img src='/resources/images/baseline_attachment_black_24dp.png'>" + obj.fileName + "</a></li>"
                    } else {

                        let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

                        let originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;

                        originPath = originPath.replace(new RegExp(/\\/g), "/");

                        str += "<li><a href=\"javascript:showImg(\'" + originPath + "\')\"><img src='/display?fileName=" + fileCallPath + "'></a>" +
                            "<span data-file=\'" + fileCallPath + "\' data-type='image'> x </span>" +
                            "</li>";
                    }
                });

                uploadResult.append(str);
            }
            // end 업로드한 파일 이름 출력

            // 파일 삭제 이벤트
            $(".uploadResult").on("click", "span", function (e) {
                let targetFile = $(this).data("file");
                let type = $(this).data("type");
                console.log(targetFile);
                $.ajax({
                    url: 'deleteFile',
                    data: {fileName: targetFile, type:type},
                    dataType: 'text',
                    type: 'POST',
                    success: function (result) {
                        alert(result);
                    }
                }); //$.ajax

            });
            let cloneObj = $(".uploadDiv").clone();
            $("#uploadBtn").on("click", function (e) {
                let formData = new FormData();
                let inputFile = $("input[name='uploadFile']");
                let files = inputFile[0].files;

                console.log(files);

                //add filedata to formdata
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
                    dataType: 'json',
                    success: function (result) {
                        console.log(result);

                        showUploadedFile(result);

                        $(".uploadDiv").html(cloneObj.html());
                    }

                }); // $.ajax
            });


        });

        // 섬네일 이미지 클릭 시 원본 이미지 출력
        function showImg(fileCallPath) {
            // alert(fileCallPath);
            $(".bigPictureWrapper").css("display", "flex").show();
            $(".bigPicture").html("<img src = '/display?fileName=" + encodeURI(fileCallPath) + "'>")
                .animate({width: '100%', height: '100%'}, 1000);

            $(".bigPictureWrapper").on("click", function (e) {
                $(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
                // setTimeout(() => {$(this).hide();}, 1000); // ES6의 화살표 함수. 크롬 브라우저만 작동함
                setTimeout(function () {
                    $(".bigPictureWrapper").hide();
                }, 1000);
            });
        }
        // end 섬네일 이미지 클릭 시 원본 이미지 출력

    </script>
</head>
<body>
<h1>Upload with Ajax</h1>
<div class="uploadDiv">
    <input type="file" name="uploadFile" multiple>
</div>
<div class="uploadResult">
    <ul></ul>
</div>

<div class="bigPictureWrapper">
    <div class="bigPicture"></div>

</div>
<button id="uploadBtn">Upload</button>

</body>
</html>
