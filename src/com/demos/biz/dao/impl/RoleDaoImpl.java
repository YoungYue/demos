package com.demos.biz.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.RoleDaoI;
import com.demos.biz.domain.Role;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.mapper.RoleMapper;

@Component("roleDao")
public class RoleDaoImpl implements RoleDaoI {

	private RoleMapper roleMapper;

	@Override
	public int getTotal() {
		return roleMapper.getTotal();
	}

	public RoleMapper getRoleMapper() {
		return roleMapper;
	}

	@Resource
	public void setRoleMapper(RoleMapper roleMapper) {
		this.roleMapper = roleMapper;
	}

	@Override
	public void add(Role t) {
		roleMapper.addRole(t);
	}

	@Override
	public void delete(String[] idArray) {
		roleMapper.deleteRole(idArray);
	}

	@Override
	public void update(Role t) {
		roleMapper.updateRole(t);
	}

	@Override
	public List<Role> getList() {
		return roleMapper.getList(SystemContext.getPageMap());
	}

	@Override
	public Role findRoleByRoleName(String roleName) {
		return roleMapper.findRoleByRoleName(roleName);
	}

}
