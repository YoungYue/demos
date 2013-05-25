package com.demos.biz.dao;

import com.demos.biz.domain.User;

public interface UserDaoI extends BaseDaoI<User> {

	User findUserByUsername(String username);
}
