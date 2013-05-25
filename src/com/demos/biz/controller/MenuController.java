/**
* @ClassName: MenuController
* @Description: 菜单控制器
* @author YuYang
* @date 2013-4-29 下午3:22:15
*/
package com.demos.biz.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.demos.biz.domain.Menu;
import com.demos.biz.domain.MenuPorperty;
import com.demos.biz.domain.Message;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.domain.User;
import com.demos.biz.service.MenuServiceI;

@Controller
@SessionAttributes({"crrUser"})
@RequestMapping("menuController")
public class MenuController {

	//菜单业务处理接口
	private MenuServiceI menuService;
	
	@RequestMapping()
	public String execute() {
		return "moduls/menu";
	}

	/**
	 * 获取当前用户菜单
	 * @param request
	 * @return
	 */
	@RequestMapping("getList")
	public @ResponseBody
	List<Map<String, Object>> getList(@ModelAttribute("crrUser") User crrUser, @RequestParam(required=false) Integer parMenuId) {
		System.out.println(parMenuId);
		if(parMenuId != null) {
			SystemContext.setParMenuId(parMenuId);
		}else {
			SystemContext.setCurrUserId(crrUser.getUserId());
		}
		
		return menuService.getMenus();
	}
	
	/**
	 * 添加菜单
	 * @param menu
	 * @param request
	 * @return
	 */
	@RequestMapping("addMenu")
	public @ResponseBody
	Message addMenu(Menu menu, HttpServletRequest request) {
		User crrUser = (User) request.getSession().getAttribute("crrUser");
		menu.setBelongTo(crrUser.getUserId());
		Message message = new Message();
		message.setInfo("菜单添加成功！");
		menuService.addMenu(menu);
		return message;
	}

	/**
	 * 更新菜单
	 * @param menu
	 * @return
	 */
	@RequestMapping("updateMenu")
	public @ResponseBody
	Message updateMenu(Menu menu) {
		Message message = new Message();
		message.setInfo("菜单修改成功！");
		menuService.updateMenu(menu);
		return message;
	}
	@RequestMapping("updateMenuPro")
	public @ResponseBody Message updateMenuPro(Integer menuId, String menuPro) {
		Message message = new Message();
		message.setInfo("属性设置成功！");
		try {
			menuPro = URLDecoder.decode(menuPro, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		menuService.updateMenuPro(menuId, menuPro);
		return message;
	}

	/**
	 * 删除菜单
	 * @param menuIds
	 * @return
	 */
	@RequestMapping("deleteMenu")
	public @ResponseBody
	Message deleteMenu(String menuIds) {
		Message message = new Message();
		message.setInfo("菜单删除成功！");
		menuService.deleteMenu(menuIds);
		return message;
	}
	
	@RequestMapping("getMenuPro")
	public @ResponseBody
	List<MenuPorperty> getMenuPro(Integer menuId) {
		return this.menuService.getMenuPro(menuId);
	}
	
	

	/**
	 * 注入菜单业务处理的实现类
	 * @param menuService
	 */
	@Resource(name="menuService")
	public void setMenuService(MenuServiceI menuService) {
		this.menuService = menuService;
	}
	
}
