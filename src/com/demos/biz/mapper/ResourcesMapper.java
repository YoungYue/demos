package com.demos.biz.mapper;

import java.util.List;
import java.util.Map;

import com.demos.biz.domain.Resources;

public interface ResourcesMapper {
	List<Resources> getList(Map<String, Object> map);

	int getTotal();

	void addResources(Resources resources);

	void updateResources(Resources resources);

	void deleteResources(String[] resIdArr);
	
}