/**
* @ClassName: MenuServiceI
* @Description: 
* @author YuYang
* @date 2013-4-29 下午3:47:33
*/
package com.demos.biz.service;

import java.util.List;
import java.util.Map;

import com.demos.biz.domain.Menu;
import com.demos.biz.domain.MenuPorperty;

public interface MenuServiceI {

	void addMenu(Menu menu);

	void updateMenu(Menu menu);

	void deleteMenu(String menuIds);

	List<Map<String, Object>> getMenus();

	/**
	 * @param menuId 
	 * @param menuPro
	 */
	void updateMenuPro(Integer menuId, String menuPro);

	/**
	 * @param menuId
	 * @return
	 */
	List<MenuPorperty> getMenuPro(Integer menuId);

}
