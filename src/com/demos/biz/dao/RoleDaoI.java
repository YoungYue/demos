package com.demos.biz.dao;

import com.demos.biz.domain.Role;

public interface RoleDaoI extends BaseDaoI<Role> {

	/**
	 * @param roleName
	 * @return
	 */
	Role findRoleByRoleName(String roleName);

}
