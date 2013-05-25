package com.demos.biz.service;

import java.util.Map;

import com.demos.biz.domain.User;

public interface UserServiceI {

	/**
	 * 获取用户列表的某一页
	 * @return
	 */
	Map<String, Object> getUsers();

	/**
	 * 添加用户
	 * @param user
	 */
	void addUser(User user);

	/**
	 * 更新用户
	 * @param user
	 */
	void updateUser(User user);

	/**
	 * 根据userIds删除一个或多个用户<br/>
	 * userIds:(列如:"1,2,4")
	 * @param userIds:(列如:"1,2,4")
	 */
	void deleteUser(String userIds);

	/**
	 * 验证用户名是否已经存在
	 * @param username
	 * @return
	 */
	boolean usernameExist(String username);

	/**
	 * @param username
	 * @param password
	 * @return
	 */
	User login(String username, String password);

}
