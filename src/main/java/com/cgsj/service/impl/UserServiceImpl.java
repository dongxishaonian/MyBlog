package com.cgsj.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cgsj.dao.UserDao;
import com.cgsj.entity.BlogUser;
import com.cgsj.service.UserSevice;

@Service("userService")
public class UserServiceImpl  implements UserSevice {
	@Resource
	private UserDao userDao;

	@Override
	public BlogUser login(BlogUser bloguser) {
		return userDao.login(bloguser);
	}
	

}
