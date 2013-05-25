/**
* @ClassName: SysParamServiceI
* @Description: 
* @author YuYang
* @date 2013-5-9 上午10:32:09
*/
package com.demos.biz.service;

import java.util.List;

import com.demos.biz.domain.SysParam;

public interface SysParamServiceI {

	List<SysParam> getList(int falg);

	void update(SysParam sysParam);
}
