/**
* @ClassName: ModelController
* @Description: 资源控制器
* @author YuYang
* @date 2013-4-29 下午3:22:15
*/
package com.demos.biz.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demos.biz.domain.Message;
import com.demos.biz.domain.Resources;
import com.demos.biz.domain.RoleResources;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.service.ResourcesServiceI;

@Controller
@RequestMapping("resourcesController")
public class ResourcesController {
	

	//资源业务处理接口
	private ResourcesServiceI resourcesService;

	@RequestMapping()
	public String execute() {
		return "moduls/resources";
	}
	
	/**
	 * 获取资源列表
	 * @param resources
	 * @param page 显示的页数
	 * @param rows 每页显示数据的行数
	 * @return
	 */
	@RequestMapping("getResources")
	public @ResponseBody Map<String, Object> getUser(Resources resources, Integer page, Integer rows) {
		SystemContext.setPage(page);
		SystemContext.setRows(rows);
		return resourcesService.getResources();
	}
	
	/**
	 * 添加资源
	 * @param resources
	 * @return
	 */
	@RequestMapping("addResources")
	public @ResponseBody Message addResources(Resources resources) {
		Message message = new Message();
		message.setInfo("资源添加成功！");
		
		try {
			resourcesService.addResources(resources);
		} catch (Exception e) {
			message.setInfo("资源添加失败！");
			e.printStackTrace();
		}
		
		return message;
	}
	
	/**
	 * 更新资源
	 * @param resources
	 * @return
	 */
	@RequestMapping("updateResources")
	public @ResponseBody Message updateResources(Resources resources) {
		Message message = new Message();
		message.setInfo("资源修改成功！");
		
		try {
			resourcesService.updateResources(resources);
		} catch (Exception e) {
			message.setInfo("资源修改失败！");
			e.printStackTrace();
		}
		
		return message;
	}
	
	/**
	 * 删除资源
	 * @param resIds
	 * @return
	 */
	@RequestMapping("deleteResources")
	public @ResponseBody Message deleteResources(String resIds) {
		Message message = new Message();
		message.setInfo("资源删除成功！");
		
		try {
			resourcesService.deleteResources(resIds);
		} catch (Exception e) {
			message.setInfo("资源删除失败！");
			e.printStackTrace();
		}
		
		return message;
	}
	
	/**
	 * 资源分配
	 * @param roleId
	 * @param resIds
	 * @return
	 */
	@RequestMapping("distributeResources")
	public @ResponseBody Message distributeResources(Integer roleId, String resIds) {
		Message message = new Message();
		message.setInfo("资源分配成功！");
		
		try {
			resourcesService.distributeResources(roleId, resIds);
		} catch (Exception e) {
			message.setInfo("资源分配失败！");
			e.printStackTrace();
		}
		
		return message;
	}
	
	/**
	 * 根据roleId获取该角色已分配的资源
	 * @param roleId
	 * @return
	 */
	@RequestMapping("getDistributeResources")
	public @ResponseBody List<RoleResources> getDistributeResources(Integer roleId) {
		return resourcesService.getRoleResources(roleId);
	}
	
	/**
	 * 解除角色资源关系
	 * @param ids
	 * @return
	 */
	@RequestMapping("delDistributeResources")
	public @ResponseBody Message delDistributeResources(String ids) {
		Message message = new Message();
		message.setInfo("角色资源关系删除成功！");
		
		try {
			resourcesService.delDistributeResources(ids);
		} catch (Exception e) {
			message.setInfo("角色资源关系删除失败！");
			e.printStackTrace();
		}
		
		return message;
	}

	public ResourcesServiceI getResourcesService() {
		return resourcesService;
	}

	/**
	 * 注入资源业务处理的实现类
	 * @param resourcesService
	 */
	@Resource(name="resourcesService")
	public void setResourcesService(ResourcesServiceI resourcesService) {
		this.resourcesService = resourcesService;
	}

}
