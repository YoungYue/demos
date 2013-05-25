package com.demos.biz.service;

import java.util.List;
import java.util.Map;

import com.demos.biz.domain.Resources;
import com.demos.biz.domain.RoleResources;

public interface ResourcesServiceI {

	Map<String, Object> getResources();
	
	void addResources(Resources resources);

	void updateResources(Resources resources);

	void deleteResources(String resIds);

	void distributeResources(Integer roleId, String resIds);

	List<RoleResources> getRoleResources(Integer roleId);

	void delDistributeResources(String ids);
}
