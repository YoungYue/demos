/**
* @ClassName: EffectController
* @Description: 
* @author YuYang
* @date 2013-5-6 上午11:06:09
*/
package com.demos.biz.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demos.biz.domain.Message;
import com.demos.biz.domain.Effect;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.service.EffectServiceI;

@Controller
@RequestMapping("effectController")
public class EffectController {
	
	private EffectServiceI effectService;

	@RequestMapping()
	public String execute() {
		return "moduls/effect";
	}

	@RequestMapping("getEffect")
	public @ResponseBody
	List<Effect> getEffect() {
		return effectService.getEffect();
	}

	@RequestMapping("getListByMenuType")
	public @ResponseBody
	List<Effect> getListByMenuType(Integer menuType) {
		SystemContext.setMenuType(menuType);
		return effectService.getEffect();
	}

	@RequestMapping("addEffect")
	public @ResponseBody
	Message addEffect(Effect effect) {
		Message message = new Message();
		message.setInfo("效果添加成功！");
		try {
			effectService.addEffect(effect);
		} catch (Exception e) {
			message.setInfo("效果添加失败！");
			message.setSuccessIsFalse();
			e.printStackTrace();
		}
		return message;
	}

	@RequestMapping("updateEffect")
	public @ResponseBody
	Message updateEffect(Effect effect) {
		Message message = new Message();
		message.setInfo("效果修改成功！");
		try {
			effectService.updateEffect(effect);
		} catch (Exception e) {
			message.setInfo("效果修改失败！");
			message.setSuccessIsFalse();
			e.printStackTrace();
		}
		return message;
	}

	@RequestMapping("deleteEffect")
	public @ResponseBody
	Message deleteEffect(String eids) {
		Message message = new Message();
		message.setInfo("效果删除成功！");
		try {
			effectService.deleteEffect(eids);
		} catch (Exception e) {
			message.setInfo("效果删除失败！");
			message.setSuccessIsFalse();
			e.printStackTrace();
		}
		return message;
	}

	@Resource(name="effectService")
	public void setEffectService(EffectServiceI effectService) {
		this.effectService = effectService;
	}
}
