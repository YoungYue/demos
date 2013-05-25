package com.demos.biz.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.ResourcesDaoI;
import com.demos.biz.domain.Resources;
import com.demos.biz.domain.RoleResources;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.mapper.ResourcesMapper;
import com.demos.biz.mapper.RoleResourcesMapper;

@Component("resourcesDao")
public class ResourcesDaoImpl implements ResourcesDaoI {

	private ResourcesMapper resourcesMapper;

	private RoleResourcesMapper roleResourcesMapper;

	@Override
	public void add(Resources t) {
		this.resourcesMapper.addResources(t);
	}

	@Override
	public void delete(String[] idArray) {
		this.resourcesMapper.deleteResources(idArray);
	}

	@Override
	public void update(Resources t) {
		this.resourcesMapper.updateResources(t);
	}

	@Override
	public List<Resources> getList() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (SystemContext.getPage() - 1) * SystemContext.getRows());
		map.put("rows", SystemContext.getRows());
		return resourcesMapper.getList(map);
	}

	@Override
	public int getTotal() {
		return resourcesMapper.getTotal();
	}

	@Override
	public void distributeResources(Integer roleId, String resIds) {
		List<RoleResources> list = new ArrayList<RoleResources>();
		
		for(String resId : resIds.split(",")) {
			RoleResources roleRes = new RoleResources();
			Resources res = new Resources();
			
			res.setResId(Integer.parseInt(resId));
			roleRes.setRoleId(roleId);
			roleRes.setResources(res);
			
			list.add(roleRes);
		}

		roleResourcesMapper.distributeResources(list);
	}

	@Override
	public List<RoleResources> getRoleResources(Integer roleId) {
		return roleResourcesMapper.getRoleResByRoleId(roleId);
	}

	@Override
	public void delDistributeResources(String[] idArr) {
		roleResourcesMapper.delDistributeResources(idArr);
	}

	public ResourcesMapper getResourcesMapper() {
		return resourcesMapper;
	}

	@Resource
	public void setResourcesMapper(ResourcesMapper resourcesMapper) {
		this.resourcesMapper = resourcesMapper;
	}

	public RoleResourcesMapper getRoleResourcesMapper() {
		return roleResourcesMapper;
	}

	@Resource
	public void setRoleResourcesMapper(RoleResourcesMapper roleResourcesMapper) {
		this.roleResourcesMapper = roleResourcesMapper;
	}

}
