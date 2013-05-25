/**
 * @ClassName: EffectProController
 * @Description: 
 * @author YuYang
 * @date 2013-5-13 下午12:53:43
 */
package com.demos.biz.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demos.biz.domain.EffectProperty;
import com.demos.biz.domain.Message;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.service.EffectProServiceI;

@Controller
@RequestMapping("effectProController")
public class EffectProController {

	private Message message;

	private EffectProServiceI effectProService;
	
	@RequestMapping()
	public String execute() {
		return "moduls/effectPro";
	}

	@RequestMapping("getList")
	public @ResponseBody
	List<EffectProperty> getList(@RequestParam(required=false)  Integer eid) {
		SystemContext.setEffectId(eid);
		return effectProService.getList();
	}

	@RequestMapping("add")
	public @ResponseBody
	Message add(EffectProperty effPro) {
		message = new Message();
		try {
			effectProService.addEffectProperty(effPro);
		} catch (Exception e) {
			message.setSuccessIsFalse();
			e.printStackTrace();
		}
		return message;

	}

	@RequestMapping("delete")
	public @ResponseBody
	Message delete(String ids) {
		message = new Message();
		try {
			effectProService.deleteEffectProperty(ids);
		} catch (Exception e) {
			message.setSuccessIsFalse();
			e.printStackTrace();
		}
		return message;
	}

	@RequestMapping("update")
	public @ResponseBody
	Message update(EffectProperty effPro) {
		message = new Message();
		try {
			effectProService.updateEffectProperty(effPro);
		} catch (Exception e) {
			message.setSuccessIsFalse();
			e.printStackTrace();
		}
		return message;
	}

	@Resource(name = "effectProService")
	public void setEffectProService(EffectProServiceI effectProService) {
		this.effectProService = effectProService;
	}
}
