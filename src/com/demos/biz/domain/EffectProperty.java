package com.demos.biz.domain;

public class EffectProperty {
    private Integer epId;

    private Integer menuId;

    private Effect effect;

    private String epKey;

    private String epValue;

    private String epNote;

    public Integer getEpId() {
        return epId;
    }

    public void setEpId(Integer epId) {
        this.epId = epId;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getEpKey() {
        return epKey;
    }

    public void setEpKey(String epKey) {
        this.epKey = epKey == null ? null : epKey.trim();
    }

    public String getEpValue() {
        return epValue;
    }

    public void setEpValue(String epValue) {
        this.epValue = epValue == null ? null : epValue.trim();
    }

    public String getEpNote() {
        return epNote;
    }

    public void setEpNote(String epNote) {
        this.epNote = epNote == null ? null : epNote.trim();
    }

	public Effect getEffect() {
		return effect;
	}

	public void setEffect(Effect effect) {
		this.effect = effect;
	}
}