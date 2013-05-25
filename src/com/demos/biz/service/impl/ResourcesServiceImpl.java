package com.demos.biz.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.ResourcesDaoI;
import com.demos.biz.domain.Resources;
import com.demos.biz.domain.RoleResources;
import com.demos.biz.service.ResourcesServiceI;

@Component("resourcesService")
public class ResourcesServiceImpl implements ResourcesServiceI {

	private ResourcesDaoI resourcesDao;

	@Override
	public Map<String, Object> getResources() {
		List<Resources> list = resourcesDao.getList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", resourcesDao.getTotal());
		map.put("rows", list);
		return map;
	}

	@Override
	public void addResources(Resources resources) {
		this.resourcesDao.add(resources);
	}

	@Override
	public void updateResources(Resources resources) {
		this.resourcesDao.update(resources);
	}

	@Override
	public void deleteResources(String resIds) {
		resourcesDao.delete(resIds.split(","));
	}

	@Override
	public void distributeResources(Integer roleId, String resIds) {
		resourcesDao.distributeResources(roleId, resIds);
	}

	@Override
	public List<RoleResources> getRoleResources(Integer roleId) {
		return resourcesDao.getRoleResources(roleId);
	}

	@Override
	public void delDistributeResources(String ids) {
		resourcesDao.delDistributeResources(ids.split(","));
	}

	public ResourcesDaoI getResourcesDao() {
		return resourcesDao;
	}

	@Resource(name = "resourcesDao")
	public void setResourcesDao(ResourcesDaoI resourcesDao) {
		this.resourcesDao = resourcesDao;
	}

}
