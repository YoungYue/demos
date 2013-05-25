package com.demos.biz.domain;

public class MenuPorperty {
    private Integer mpId;

    private Integer menuId;

    private String proKey;

    private String proValue;

    public Integer getMpId() {
        return mpId;
    }

    public void setMpId(Integer mpId) {
        this.mpId = mpId;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getProKey() {
        return proKey;
    }

    public void setProKey(String proKey) {
        this.proKey = proKey == null ? null : proKey.trim();
    }

    public String getProValue() {
        return proValue;
    }

    public void setProValue(String proValue) {
        this.proValue = proValue == null ? null : proValue.trim();
    }
}