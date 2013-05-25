package com.demos.biz.domain;

import java.util.HashMap;
import java.util.Map;

public class SystemContext {

	private static ThreadLocal<Integer> currUserId = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> page = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> rows = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> menuType = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> effectId = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> parMenuId = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> menuId = new ThreadLocal<Integer>();

	/**
	 * 将分页信息数据处理成map对象
	 * @return
	 */
	public static Map<String, Object> getPageMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (SystemContext.getPage() - 1) * SystemContext.getRows());
		map.put("rows", SystemContext.getRows());
		
		return map;
	}
	
	public static int getPage() {
		return page.get() != null ? page.get() : 0;
	}

	public static void setPage(int value) {
		page.set(value);
	}

	public static int getRows() {
		return rows.get() != null ? rows.get() : 0;
	}

	public static void setRows(int value) {
		rows.set(value);
	}

	public static int getCurrUserId() {
		return currUserId.get() != null ? currUserId.get() : 0;
	}

	public static void setCurrUserId(int value) {
		currUserId.set(value);
	}

	public static int getMenuType() {
		return menuType.get() != null ? menuType.get() : -1;
	}

	public static void setMenuType(int value) {
		menuType.set(value);
	}

	public static int getEffectId() {
		return effectId.get() != null ? effectId.get() : -1;
	}

	public static void setEffectId(Integer value) {
		effectId.set(value);
	}

	public static int getParMenuId() {
		return parMenuId.get() != null ? parMenuId.get() : -1;
	}

	public static void setParMenuId(Integer value) {
		System.out.println(value);
		parMenuId.set(value);
	}
	public static int getMenuId() {
		return menuId.get() != null ? menuId.get() : -1;
	}
	
	public static void setMenuId(Integer value) {
		menuId.set(value);
	}

}
