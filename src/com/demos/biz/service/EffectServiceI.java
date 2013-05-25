/**
* @ClassName: EffectServiceI
* @Description: 
* @author YuYang
* @date 2013-5-6 上午10:45:29
*/
package com.demos.biz.service;

import java.util.List;

import com.demos.biz.domain.Effect;

public interface EffectServiceI {

	void addEffect(Effect effect);

	void updateEffect(Effect effect);

	void deleteEffect(String effectIds);

	List<Effect> getEffect();
	
}
