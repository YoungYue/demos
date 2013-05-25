package com.demos.biz.domain;

import java.util.List;

public class Menu {
    private Integer menuId;
    
    private Integer belongTo;

    private Integer parMenuId;

    private String menuName;

    private String menuType;
    
    private Effect effect;
    
    private List<MenuPorperty> menuPorperty;
    
    private String epId;
    
    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public Integer getBelongTo() {
        return belongTo;
    }

    public void setBelongTo(Integer belongTo) {
        this.belongTo = belongTo;
    }

    public Integer getParMenuId() {
        return parMenuId == null ? 0 : parMenuId;
    }

    public void setParMenuId(Integer parMenuId) {
        this.parMenuId = parMenuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }

    public String getMenuType() {
        return menuType;
    }

    public void setMenuType(String menuType) {
        this.menuType = menuType == null ? null : menuType.trim();
    }

	public Effect getEffect() {
		return effect;
	}

	public void setEffect(Effect effect) {
		this.effect = effect;
	}

	public String getEpId() {
		return epId;
	}

	public void setEpId(String epId) {
		this.epId = epId == null ? null : epId.trim();
	}

	public List<MenuPorperty> getMenuPorperty() {
		return menuPorperty;
	}

	public void setMenuPorperty(List<MenuPorperty> menuPorperty) {
		this.menuPorperty = menuPorperty;
	}

}