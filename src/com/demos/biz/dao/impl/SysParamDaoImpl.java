/**
* @ClassName: SysParamDaoImpl
* @Description: 
* @author YuYang
* @date 2013-5-9 上午10:30:13
*/
package com.demos.biz.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.SysParamDaoI;
import com.demos.biz.domain.SysParam;
import com.demos.biz.mapper.SysParamMapper;

@Component("sysParamDao")
public class SysParamDaoImpl implements SysParamDaoI {

	private SysParamMapper sysParamMapper;
	
	@Override
	public List<SysParam> getList(int falg) {
		return sysParamMapper.getList(falg);
	}

	@Override
	public void update(SysParam sysParam) {
		sysParamMapper.update(sysParam);
	}

	@Resource
	public void setSysParamMapper(SysParamMapper sysParamMapper) {
		this.sysParamMapper = sysParamMapper;
	}

}
