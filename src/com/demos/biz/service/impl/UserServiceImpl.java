package com.demos.biz.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.UserDaoI;
import com.demos.biz.domain.User;
import com.demos.biz.service.UserServiceI;
import com.demos.biz.utils.Encrypt;

@Component("userService")
public class UserServiceImpl implements UserServiceI {

	private UserDaoI userDao;

	@Override
	public Map<String, Object> getUsers() {
		List<User> list = userDao.getList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", userDao.getTotal());
		map.put("rows", list);
		return map;
	}

	@Override
	public void addUser(User user) {
		user.setPassword(Encrypt.e(user.getPassword()));
		this.userDao.add(user);
	}

	@Override
	public void updateUser(User user) {
		this.userDao.update(user);
	}

	@Override
	public void deleteUser(String userIds) {
		userDao.delete(userIds.split(","));
	}

	@Override
	public boolean usernameExist(String username) {
		return userDao.findUserByUsername(username) != null;
	}
	
	public UserDaoI getUserDao() {
		return userDao;
	}

	@Resource(name="userDao")
	public void setUserDao(UserDaoI userDao) {
		this.userDao = userDao;
	}

	@Override
	public User login(String username, String password) {
		User user = userDao.findUserByUsername(username);
		if(user != null && user.getPassword().equals(Encrypt.e(password))) {
			return user;
		}
		return null;
	}

}
