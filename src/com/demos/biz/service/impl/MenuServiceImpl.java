/**
 * @ClassName: MenuServiceImpl
 * @Description: 
 * @author YuYang
 * @date 2013-4-29 下午3:51:01
 */
package com.demos.biz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.MenuDaoI;
import com.demos.biz.domain.Menu;
import com.demos.biz.domain.MenuPorperty;
import com.demos.biz.service.MenuServiceI;

@Component("menuService")
public class MenuServiceImpl implements MenuServiceI {

	private MenuDaoI menuDao;

	@Override
	public void addMenu(Menu menu) {
		menuDao.add(menu);
	}

	@Override
	public void updateMenu(Menu menu) {
		menuDao.update(menu);
	}

	@Override
	public void deleteMenu(String menuIds) {
		menuDao.delete(menuIds.split(","));
	}

	@Override
	public List<Map<String, Object>> getMenus() {
		List<Menu> list = menuDao.getList();
		List<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		for (Menu menu : list) {
			Map<String, Object> row = new HashMap<String, Object>();
			row.put("id", menu.getMenuId());
			row.put("text", menu.getMenuName());
			row.put("pid", menu.getParMenuId());
			row.put("menuType", menu.getMenuType());
			row.put("effect", menu.getEffect());
			row.put("menuPorperty", menu.getMenuPorperty());
			row.put("epId", menu.getEpId());

			rows.add(row);
		}

		return rows;
	}

	@Resource(name = "menuDao")
	public void setMenuDao(MenuDaoI menuDao) {
		this.menuDao = menuDao;
	}

	@Override
	public void updateMenuPro(Integer menuId, String menuPros) {
		this.menuDao.deleteMenuPro(menuId);

		String[] menuProsArr = menuPros.split("&");
		MenuPorperty mp = new MenuPorperty();
		for (String menuPro : menuProsArr) {
			String[] menuProArr = menuPro.split("=");
			mp.setMenuId(menuId);
			mp.setProKey(menuProArr[0]);
			if(menuProArr.length>1) {
				mp.setProValue(menuProArr[1]);
			}else {
				mp.setProValue(null);
			}
			this.menuDao.updateMenuPro(mp);
		}

	}

	@Override
	public List<MenuPorperty> getMenuPro(Integer menuId) {
		return this.menuDao.getMenuPro(menuId);
	}
	
}
