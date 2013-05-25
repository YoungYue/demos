/**
* @ClassName: EffectProDaoImpl
* @Description: 
* @author YuYang
* @date 2013-5-13 下午12:20:23
*/
package com.demos.biz.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.EffectProDaoI;
import com.demos.biz.domain.EffectProperty;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.mapper.EffectPropertyMapper;

@Component("effectProDao")
public class EffectProDaoImpl implements EffectProDaoI {
	
	private EffectPropertyMapper effectProMapper;

	@Override
	public void add(EffectProperty t) {
		effectProMapper.addEffectProperty(t);
	}

	@Override
	public void delete(String[] idArray) {
		effectProMapper.deleteEffectProperty(idArray);
	}

	@Override
	public void update(EffectProperty t) {
		effectProMapper.updateEffectProperty(t);
	}

	@Override
	public List<EffectProperty> getList() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eid", SystemContext.getEffectId());
		return effectProMapper.getList(map);
	}

	@Override
	public int getTotal() {
		return 0;
	}

	@Resource
	public void setEffectProMapper(EffectPropertyMapper effectProMapper) {
		this.effectProMapper = effectProMapper;
	}

}
