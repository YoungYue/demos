/**
* @ClassName: MenuDaoImpl
* @Description: 
* @author YuYang
* @date 2013-4-29 下午3:23:50
*/
package com.demos.biz.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.MenuDaoI;
import com.demos.biz.domain.Menu;
import com.demos.biz.domain.MenuPorperty;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.mapper.MenuMapper;
import com.demos.biz.mapper.MenuPorpertyMapper;

@Component("menuDao")
public class MenuDaoImpl implements MenuDaoI {
	
	private MenuMapper menuMapper;
	
	private MenuPorpertyMapper menuPorpertyMapper; 

	@Override
	public void add(Menu t) {
		menuMapper.addMenu(t);
	}

	@Override
	public void delete(String[] idArray) {
		menuMapper.deleteMenu(idArray);
	}

	@Override
	public void update(Menu t) {
		menuMapper.updateMenu(t);
	}

	@Override
	public List<Menu> getList() {
		System.out.println(SystemContext.getParMenuId());
		if(SystemContext.getParMenuId() != -1) {
			return menuMapper.getIncludeProList(SystemContext.getParMenuId());
		}else {
			return menuMapper.getList(SystemContext.getCurrUserId());
		}
		
	}

	@Override
	public int getTotal() {
		return menuMapper.getTotal();
	}

	@Resource
	public void setMenuMapper(MenuMapper menuMapper) {
		this.menuMapper = menuMapper;
	}

	@Override
	public void updateMenuPro(MenuPorperty mp) {
		menuPorpertyMapper.updateMenuPro(mp);
	}

	@Resource
	public void setMenuPorpertyMapper(MenuPorpertyMapper menuPorpertyMapper) {
		this.menuPorpertyMapper = menuPorpertyMapper;
	}

	@Override
	public List<MenuPorperty> getMenuPro(Integer menuId) {
		return menuPorpertyMapper.getMenuPro(menuId);
	}

	@Override
	public void deleteMenuPro(Integer menuId) {
		menuPorpertyMapper.deleteMenuPro(menuId);
	}

}
