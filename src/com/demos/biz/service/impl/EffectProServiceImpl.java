/**
* @ClassName: EffectProServiceImpl
* @Description: 
* @author YuYang
* @date 2013-5-13 下午12:49:43
*/
package com.demos.biz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.demos.biz.dao.EffectProDaoI;
import com.demos.biz.domain.EffectProperty;
import com.demos.biz.service.EffectProServiceI;

@Component("effectProService")
public class EffectProServiceImpl implements EffectProServiceI {

	private EffectProDaoI effectProDao;
	
	@Override
	public void addEffectProperty(EffectProperty effPro) {
		String[] epValues = effPro.getEpValue().replace("，", ",").split(",");
		for(String epValue : epValues) {
			effPro.setEpValue(epValue);
			effectProDao.add(effPro);
		}
	}

	@Override
	public void deleteEffectProperty(String ids) {
		effectProDao.delete(ids.split(","));
	}

	@Override
	public void updateEffectProperty(EffectProperty effPro) {
		effectProDao.update(effPro);
	}

	@Override
	public List<EffectProperty> getList() {
		List<EffectProperty> list = effectProDao.getList();
		
		Map<String, List<EffectProperty>> map = new HashMap<String, List<EffectProperty>>();
		
		List<String> listKey = new ArrayList<String>();
		for(EffectProperty ep : list) {
			if(map.containsKey(ep.getEpKey())) {
				List<EffectProperty> l = map.get(ep.getEpKey());
				l.add(ep);
			} else {
				List<EffectProperty> l = new ArrayList<EffectProperty>();
				l.add(ep);
				map.put(ep.getEpKey(), l);
				listKey.add(ep.getEpKey());
			}
		}
		
		list.clear();
		for(String str : listKey) {
			List<EffectProperty> l = map.get(str);
			EffectProperty ep = l.get(0);
			ep.setEpValue(JSON.toJSONString(l));
			list.add(ep);
		}
		return list;
	}

	@Resource(name="effectProDao")
	public void setEffectProDao(EffectProDaoI effectProDao) {
		this.effectProDao = effectProDao;
	}

}
