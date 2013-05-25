package com.demos.biz.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demos.biz.domain.Message;
import com.demos.biz.domain.Role;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.service.RoleServiceI;

@Controller
@RequestMapping("roleController")
public class RoleController {

	private RoleServiceI roleService;

	@RequestMapping()
	public String execute() {
		return "moduls/role";
	}

	@RequestMapping("getRole")
	public @ResponseBody
	List<Role> getRole(Role role, Integer page, Integer rows) {
		SystemContext.setPage(page);
		SystemContext.setRows(rows);
		return roleService.getRoles();
	}

	@RequestMapping("getRoleList")
	public @ResponseBody
	List<Role> getRoleList() {
		return roleService.getRoles();
	}

	@RequestMapping("addRole")
	public @ResponseBody
	Message addRole(Role role) {
		Message message = new Message();
		message.setInfo("角色添加成功！");
		roleService.addRole(role);
		return message;
	}

	@RequestMapping("updateRole")
	public @ResponseBody
	Message updateRole(Role role) {
		Message message = new Message();
		message.setInfo("角色修改成功！");
		roleService.updateRole(role);
		return message;
	}

	@RequestMapping("deleteRole")
	public @ResponseBody
	Message deleteRole(String roleIds) {
		Message message = new Message();
		message.setInfo("角色删除成功！");
		roleService.deleteRole(roleIds);
		return message;
	}

	@RequestMapping("roleNameExist")
	public @ResponseBody
	Message usernameExist(String roleName) {
		Message message = new Message();
		message.setSuccess(roleService.roleNameExist(roleName));

		return message;
	}

	public RoleServiceI getRoleService() {
		return roleService;
	}

	@Resource(name = "roleService")
	public void setRoleService(RoleServiceI roleService) {
		this.roleService = roleService;
	}

}
