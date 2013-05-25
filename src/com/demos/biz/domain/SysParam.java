package com.demos.biz.domain;

public class SysParam {
    private Integer sid;

    private String paraName;

    private String paraFile;

    private String thumbnail;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getParaName() {
        return paraName;
    }

    public void setParaName(String paraName) {
        this.paraName = paraName == null ? null : paraName.trim();
    }

    public String getParaFile() {
        return paraFile;
    }

    public void setParaFile(String paraFile) {
        this.paraFile = paraFile == null ? null : paraFile.trim();
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail == null ? null : thumbnail.trim();
    }
}