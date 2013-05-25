/**
 * @ClassName: EffectProServiceI
 * @Description: 
 * @author YuYang
 * @date 2013-5-13 下午12:48:09
 */
package com.demos.biz.service;

import java.util.List;

import com.demos.biz.domain.EffectProperty;

public interface EffectProServiceI {

	void addEffectProperty(EffectProperty effPro);

	void deleteEffectProperty(String ids);

	void updateEffectProperty(EffectProperty effPro);

	List<EffectProperty> getList();
}
