/**
* @ClassName: SysParamServiceImpl
* @Description: 
* @author YuYang
* @date 2013-5-9 上午10:32:40
*/
package com.demos.biz.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.SysParamDaoI;
import com.demos.biz.domain.SysParam;
import com.demos.biz.service.SysParamServiceI;

@Component("sysParamService")
public class SysParamServiceImpl implements SysParamServiceI {

	private SysParamDaoI sysParamDao;
	
	@Override
	public List<SysParam> getList(int falg) {
		return sysParamDao.getList(falg);
	}

	@Override
	public void update(SysParam sysParam) {
		sysParamDao.update(sysParam);
	}

	@Resource(name="sysParamDao")
	public void setSysParamDao(SysParamDaoI sysParamDao) {
		this.sysParamDao = sysParamDao;
	}

}
