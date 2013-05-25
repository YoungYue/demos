package com.demos.biz.service;

import java.util.List;
import java.util.Map;

import com.demos.biz.domain.Role;

public interface RoleServiceI {

	/**
	 * 获取角色列表的某一页
	 * @return
	 */
	Map<String, Object> getPageRoles();

	/**
	 * 添加角色
	 * @param role
	 */
	void addRole(Role role);

	/**
	 * 更新角色
	 * @param role
	 */
	void updateRole(Role role);

	/**
	 * 根据roleIds删除一个或多个角色<br/>
	 * roleIds:(列如:"1,3,5,6")
	 * @param roleIds:(列如:"1,3,5,6")
	 */
	void deleteRole(String roleIds);

	/**
	 * 获取所有的角色列表
	 * @return
	 */
	List<Role> getRoles();

	/**
	 * 验证角色名是否存在
	 * @param roleName
	 * @return
	 */
	boolean roleNameExist(String roleName);
}
