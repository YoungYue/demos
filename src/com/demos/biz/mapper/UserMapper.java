package com.demos.biz.mapper;

import java.util.List;
import java.util.Map;

import com.demos.biz.domain.User;

public interface UserMapper {
	List<User> getList(Map<String, Object> map);

	int getTotal();

	void addUser(User user);

	void updateUser(User user);

	void deleteUser(String[] userIdArr);

	User findUserByUsername(String username);
}