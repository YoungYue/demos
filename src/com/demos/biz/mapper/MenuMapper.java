package com.demos.biz.mapper;

import java.util.List;

import com.demos.biz.domain.Menu;

public interface MenuMapper {
	List<Menu> getList(Integer currUserId);
	
	List<Menu> getIncludeProList(int parMenuId);

	int getTotal();

	void addMenu(Menu menu);

	void updateMenu(Menu menu);

	void deleteMenu(String[] menuIdArr);

}