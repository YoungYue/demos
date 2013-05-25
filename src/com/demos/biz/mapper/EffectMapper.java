package com.demos.biz.mapper;

import java.util.List;
import java.util.Map;

import com.demos.biz.domain.Effect;

public interface EffectMapper {
	List<Effect> getList(Map<String, Object> map);

	int getTotal();

	void addEffect(Effect effect);

	void updateEffect(Effect effect);

	void deleteEffect(String[] effectIdArr);
	
}