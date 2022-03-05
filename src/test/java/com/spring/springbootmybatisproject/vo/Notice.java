package com.spring.springbootmybatisproject.vo;

/**
 * Created by berno579@gmail.com on 2021/10/18
 * Github : http://github.com/bee0113
 */
public class Notice {

    private int seq;
    private String title;
    private String contents;
    private String noticeType;

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getNoticeType() {

        return noticeType;
    }

    public void setNoticeType(String noticeType) {
        this.noticeType = noticeType;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "seq=" + seq +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", noticeType='" + noticeType + '\'' +
                '}';
    }
}
