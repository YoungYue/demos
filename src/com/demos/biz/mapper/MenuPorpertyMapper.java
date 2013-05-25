package com.demos.biz.mapper;

import java.util.List;

import com.demos.biz.domain.MenuPorperty;

public interface MenuPorpertyMapper {

	/**
	 * @param mp
	 */
	void updateMenuPro(MenuPorperty mp);

	/**
	 * @param menuId
	 * @return
	 */
	List<MenuPorperty> getMenuPro(Integer menuId);

	/**
	 * @param menuId
	 */
	void deleteMenuPro(Integer menuId);
	
}