package com.demos.biz.dao;

import java.util.List;

import com.demos.biz.domain.Resources;
import com.demos.biz.domain.RoleResources;

public interface ResourcesDaoI extends BaseDaoI<Resources> {

	void distributeResources(Integer roleId, String resIds);

	List<RoleResources> getRoleResources(Integer roleId);

	void delDistributeResources(String[] idArr);
}
