package com.demos.biz.mapper;

import java.util.List;
import java.util.Map;

import com.demos.biz.domain.RoleResources;


public interface RoleResourcesMapper {
	void distributeResources(List<RoleResources> roleRes);
	
	RoleResources isDistributeResources(Map<String, Object> map);

	void delDistributeResources(String[] idArr);
	
	List<RoleResources> getRoleResByRoleId(Integer roleId);

}