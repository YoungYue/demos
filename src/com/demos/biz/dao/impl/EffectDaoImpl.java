/**
* @ClassName: EffectDaoImpl
* @Description: 
* @author YuYang
* @date 2013-5-6 上午10:45:12
*/
package com.demos.biz.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.EffectDaoI;
import com.demos.biz.domain.Effect;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.mapper.EffectMapper;

@Component("effectDao")
public class EffectDaoImpl implements EffectDaoI {
	
	private EffectMapper effectMapper;

	@Override
	public void add(Effect t) {
		effectMapper.addEffect(t);
	}

	@Override
	public void delete(String[] idArray) {
		effectMapper.deleteEffect(idArray);
	}

	@Override
	public void update(Effect t) {
		effectMapper.updateEffect(t);
	}

	@Override
	public List<Effect> getList() {
		Map<String, Object> map = SystemContext.getPageMap();
		map.put("menuType", SystemContext.getMenuType());
		return effectMapper.getList(map);
	}

	@Override
	public int getTotal() {
		return effectMapper.getTotal();
	}

	@Resource
	public void setEffectMapper(EffectMapper effectMapper) {
		this.effectMapper = effectMapper;
	}

}
