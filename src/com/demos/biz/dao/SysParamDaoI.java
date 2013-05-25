/**
 * @ClassName: SysParamDaoI
 * @Description: 
 * @author YuYang
 * @date 2013-5-9 上午10:29:30
 */
package com.demos.biz.dao;

import java.util.List;

import com.demos.biz.domain.SysParam;

public interface SysParamDaoI {

	List<SysParam> getList(int falg);

	void update(SysParam sysParam);
}
