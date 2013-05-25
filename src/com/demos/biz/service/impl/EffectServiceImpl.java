/**
* @ClassName: EffectServiceImpl
* @Description: 
* @author YuYang
* @date 2013-5-6 上午10:45:50
*/
package com.demos.biz.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.EffectDaoI;
import com.demos.biz.domain.Effect;
import com.demos.biz.service.EffectServiceI;

@Component("effectService")
public class EffectServiceImpl implements EffectServiceI {
	
	private EffectDaoI effectDao;

	@Override
	public void addEffect(Effect effect) {
		effectDao.add(effect);
	}

	@Override
	public void updateEffect(Effect effect) {
		effectDao.update(effect);
	}

	@Override
	public void deleteEffect(String effectIds) {
		effectDao.delete(effectIds.split(","));
	}

	@Override
	public List<Effect> getEffect() {
		return effectDao.getList();
	}

	@Resource(name="effectDao")
	public void setEffectDao(EffectDaoI effectDao) {
		this.effectDao = effectDao;
	}

}
