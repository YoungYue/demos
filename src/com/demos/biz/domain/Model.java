package com.demos.biz.domain;

public class Model {
    private Integer modId;

    private String modName;

    private String modDes;

    private Integer parMod;

    private Integer modCode;

    private String modUrl;

    public Integer getModId() {
        return modId;
    }

    public void setModId(Integer modId) {
        this.modId = modId;
    }

    public String getModName() {
        return modName;
    }

    public void setModName(String modName) {
        this.modName = modName == null ? null : modName.trim();
    }

    public String getModDes() {
        return modDes;
    }

    public void setModDes(String modDes) {
        this.modDes = modDes == null ? null : modDes.trim();
    }

    public Integer getParMod() {
        return parMod;
    }

    public void setParMod(Integer parMod) {
        this.parMod = parMod;
    }

    public Integer getModCode() {
        return modCode;
    }

    public void setModCode(Integer modCode) {
        this.modCode = modCode;
    }

    public String getModUrl() {
        return modUrl;
    }

    public void setModUrl(String modUrl) {
        this.modUrl = modUrl == null ? null : modUrl.trim();
    }
}