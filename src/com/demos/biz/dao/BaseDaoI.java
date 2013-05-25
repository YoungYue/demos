/**
* @ClassName: BaseDaoI
* @Description: 
* @author YuYang
* @date 2013-4-28 下午3:25:44
*/
package com.demos.biz.dao;

import java.util.List;

public interface BaseDaoI<T> {

	/**
	 * 添加一个数据
	 * @param t
	 */
	void add(T t);
	
	/**
	 * 根据id数组删除对应数据
	 * @param idArray
	 */
	void delete(String[] idArray);
	
	/**
	 * 更新数据
	 * @param t
	 */
	void update(T t);
	
	/**
	 * 获取数据列表
	 * @return
	 */
	List<T> getList();
	
	/**
	 * 获得数据总数
	 * @return
	 */
	int getTotal();
}
