/**
* @ClassName: SysParamController
* @Description: 
* @author YuYang
* @date 2013-5-9 上午10:34:36
*/
package com.demos.biz.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demos.biz.domain.Message;
import com.demos.biz.domain.SysParam;
import com.demos.biz.service.SysParamServiceI;

@Controller
@RequestMapping("sysParamController")
public class SysParamController {

	private SysParamServiceI sysParamService;
	
	@RequestMapping()
	public String execute() {
		return "moduls/sysParam";
	}
	
	@RequestMapping("getSysParam")
	public @ResponseBody
	List<SysParam> getSysParam(Integer falg) {
		//System.out.println(this.getClass().getClassLoader().getResource("").getPath());
		return sysParamService.getList(falg);
	}
	
	@RequestMapping("updateSysParam")
	public @ResponseBody
	Message updateSysParam(SysParam sysParam) {
		Message message = new Message();
		
		try {
			sysParamService.update(sysParam);
		} catch (Exception e) {
			message.setSuccessIsFalse();
			e.printStackTrace();
		}
		return message;
	}

	@Resource(name="sysParamService")
	public void setSysParamService(SysParamServiceI sysParamService) {
		this.sysParamService = sysParamService;
	}
}
