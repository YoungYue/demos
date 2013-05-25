package com.demos.biz.dao.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.UserDaoI;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.domain.User;
import com.demos.biz.mapper.UserMapper;

@Component("userDao")
public class UserDaoImpl implements UserDaoI {

	private UserMapper userMapper;

	@Override
	public void add(User t) {
		this.userMapper.addUser(t);
	}

	@Override
	public void delete(String[] idArray) {
		this.userMapper.deleteUser(idArray);
	}

	@Override
	public void update(User t) {
		this.userMapper.updateUser(t);
	}

	@Override
	public List<User> getList() {
		return userMapper.getList(SystemContext.getPageMap());
	}

	@Override
	public int getTotal() {
		return userMapper.getTotal();
	}

	@Override
	public User findUserByUsername(String username) {
		return userMapper.findUserByUsername(username);

	}

	public UserMapper getUserMapper() {
		return userMapper;
	}

	@Resource
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

}
