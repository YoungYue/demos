package com.demos.biz.mapper;

import java.util.List;

import com.demos.biz.domain.SysParam;

public interface SysParamMapper {
	List<SysParam> getList(int falg);
	
	void update(SysParam sysParam);
}