package com.demos.biz.mapper;

import java.util.List;
import java.util.Map;

import com.demos.biz.domain.EffectProperty;


public interface EffectPropertyMapper {
	
	void addEffectProperty(EffectProperty effPro);
	
	void deleteEffectProperty(String[] idArr);
	
	void updateEffectProperty(EffectProperty effPro);
	
	List<EffectProperty> getList(Map<String, Object> map);
}