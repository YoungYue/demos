package com.demos.biz.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.RoleDaoI;
import com.demos.biz.domain.Role;
import com.demos.biz.service.RoleServiceI;

@Component("roleService")
public class RoleServiceImpl implements RoleServiceI {
	
	private RoleDaoI roleDao;

	@Override
	public Map<String, Object> getPageRoles() {
		List<Role> list = roleDao.getList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", roleDao.getTotal());
		map.put("rows", list);
		return map;
	}

	@Override
	public void addRole(Role role) {
		this.roleDao.add(role);
	}

	@Override
	public void updateRole(Role role) {
		this.roleDao.update(role);
	}

	@Override
	public void deleteRole(String roleIds) {
			roleDao.delete(roleIds.split(","));
	}

	@Override
	public List<Role> getRoles() {
		return this.roleDao.getList();
	}
	
	public RoleDaoI getRoleDao() {
		return roleDao;
	}

	@Resource(name="roleDao")
	public void setRoleDao(RoleDaoI roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	public boolean roleNameExist(String roleName) {
		return roleDao.findRoleByRoleName(roleName) != null;
	}

}
