package com.demos.biz.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSON;
import com.demos.biz.domain.Message;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.domain.User;
import com.demos.biz.service.UserServiceI;

@Controller
@SessionAttributes({"crrUser"})
@RequestMapping("userController")
public class UserController {
	
	private UserServiceI userService;

	@RequestMapping()
	public String execute() {
		return "moduls/user";
	}
	
	@RequestMapping("chkUser")
	public @ResponseBody Message login(String username, String password, Model model, HttpSession session) {
		Message message = new Message();
		User user = userService.login(username, password);
		if(user == null) {
			message.setSuccessIsFalse();
			message.setInfo("用户名或密码错误！");
		}else {
			model.addAttribute("crrUser", user);
		}
		return message;
	}
	
	@RequestMapping("getUser")
	public @ResponseBody Map<String, Object> getUser(User user, Integer page, Integer rows) {
		SystemContext.setPage(page);
		SystemContext.setRows(rows);
		return userService.getUsers();
	}
	
	@RequestMapping("userExist")
	public @ResponseBody Message usernameExist(String username) {
		Message message = new Message();
		message.setSuccess(userService.usernameExist(username));
		
		return message;
	}
	
	@RequestMapping("addUser")
	public @ResponseBody Message addUser(User user) {
		Message message = new Message();
		message.setInfo("用户添加成功！");
		
		System.out.println(JSON.toJSONString(user));
		this.userService.addUser(user);
		
		return message;
	}
	@RequestMapping("updateUser")
	public @ResponseBody Message updateUser(User user) {
		Message message = new Message();
		message.setInfo("用户修改成功！");
		
		this.userService.updateUser(user);
		
		return message;
	}
	@RequestMapping("deleteUser")
	public @ResponseBody Message deleteUser(String userIds) {
		Message message = new Message();
		message.setInfo("用户删除成功！");
		
		this.userService.deleteUser(userIds);
		
		return message;
	}

	@Resource(name="userService")
	public void setUserService(UserServiceI userService) {
		this.userService = userService;
	}
}
