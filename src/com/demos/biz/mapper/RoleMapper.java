package com.demos.biz.mapper;

import java.util.List;
import java.util.Map;

import com.demos.biz.domain.Role;

public interface RoleMapper {
    List<Role> getList(Map<String, Object> map);
    
    int getTotal();
    
    void addRole(Role role);

	void updateRole(Role role);

	void deleteRole(String[] roleIdArr);

	/**
	 * @param roleName
	 * @return
	 */
	Role findRoleByRoleName(String roleName);
}