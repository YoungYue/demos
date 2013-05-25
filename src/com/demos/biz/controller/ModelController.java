/**
* @ClassName: ModelController
* @Description: 模块控制器
* @author YuYang
* @date 2013-4-29 下午3:22:15
*/
package com.demos.biz.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demos.biz.domain.Message;
import com.demos.biz.domain.Model;
import com.demos.biz.service.ModelServiceI;

@Controller
@RequestMapping("modelController")
public class ModelController {
	
	//模块业务处理接口
	private ModelServiceI modelService;
	
	@RequestMapping()
	public String execute() {
		return "moduls/model";
	}

	/**
	 * 获取模块的树形数据
	 * @return
	 */
	@RequestMapping("getMenu")
	public @ResponseBody Object getMenu() {
		return modelService.getMenu();
	}
	
	/**
	 * 获取模块树形列表
	 * @return
	 */
	@RequestMapping("getModel")
	public @ResponseBody Object getModel() {
		return modelService.getModel();
	}
	
	/**
	 * 添加模块
	 * @param model
	 * @return
	 */
	@RequestMapping("addModel")
	public @ResponseBody Message addModel(Model model) {
		Message message = new Message();
		message.setInfo("模块添加成功!");
		
		try {
			modelService.addModel(model);
		} catch (Exception e) {
			e.printStackTrace();
			message.setSuccessIsFalse();
			message.setInfo("模块添加失败!");
		}
		
		return message;
	}
	
	/**
	 * 删除模块
	 * @param modIds
	 * @return
	 */
	@RequestMapping("deleteModel")
	public @ResponseBody Message deleteModel(String modIds) {
		Message message = new Message();
		message.setInfo("模块删除成功!");
		
		try {
			modelService.deleteModel(modIds);
		} catch (Exception e) {
			e.printStackTrace();
			message.setSuccessIsFalse();
			message.setInfo("模块删除失败!");
		}
		
		return message;
	}
	
	/**
	 * 更新模块
	 * @param model
	 * @return
	 */
	@RequestMapping("updateModel")
	public @ResponseBody Message updateModel(Model model) {
		Message message = new Message();
		message.setInfo("模块修改成功!");
		
		try {
			modelService.updateModel(model);
		} catch (Exception e) {
			e.printStackTrace();
			message.setSuccessIsFalse();
			message.setInfo("模块修改失败!");
		}
		
		return message;
	}

	public ModelServiceI getModelService() {
		return modelService;
	}

	/**
	 * 注入模块业务处理的实现类
	 * @param modelService
	 */
	@Resource(name="modelService")
	public void setModelService(ModelServiceI modelService) {
		this.modelService = modelService;
	}
	
}
