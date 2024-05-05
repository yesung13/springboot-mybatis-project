# springboot-mybatis-project
    | Mybatis를 이용한 게시판
  - **환경**
    * Spring boot(_Gradle 5.4.1_)
    * MariaDB 10.5 -> 10.10(230125)
    * jQuery
    
  - **기능** (`reference file` 폴더 참조)
    * 게시물 등록 / 수정 / 삭제
    * 게시물 검색(제목 / 내용 / 작성자)
    * 댓글 등록 / 수정 / 삭제
    * 파일 업로드 및 다운로드 (이미지 / 일반)
        * 이미지 파일: 섬네일 이미지 브라우저에 노출
        * 일반 파일: 파일 다운로드
    
    * 로그인 성공된 사용자만 게시글 열람 가능
    * 설문조사 등록 (0614)
        * 로그인 된 회원만 가능
    * Spring Security 적용 (0615)
  - **ETC**
       * logback
       * log4jdbc.log4j2
  - **테스트 계정**
       * 모든 테스트 계정 암호: new1234!

       
    
