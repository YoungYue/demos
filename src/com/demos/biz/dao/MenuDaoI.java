/**
* @ClassName: MenuDaoI
* @Description: 
* @author YuYang
* @date 2013-4-29 下午3:22:50
*/
package com.demos.biz.dao;

import java.util.List;

import com.demos.biz.domain.Menu;
import com.demos.biz.domain.MenuPorperty;

public interface MenuDaoI extends BaseDaoI<Menu> {

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
