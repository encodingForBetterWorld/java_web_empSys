package com.cqupt.service;





import java.util.List;

import com.cqupt.common.PageBean;
import com.cqupt.dao.UsersDao;
import com.cqupt.domain.Users;

public class UserServiceImp implements UserService {
    UsersDao userDao;
    
	public UsersDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UsersDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public Users saveUser(Users user) {
		// TODO Auto-generated method stub
		return userDao.saveUser(user);
	}

	@Override
	public void deleteUser(String userId) {
		// TODO Auto-generated method stub
		userDao.deleteUser(userId);
	}

	@Override
	public Users updateUser(Users user) {
		// TODO Auto-generated method stub
		return userDao.updateUser(user);
	}

	@Override
	public List<Users> userLogin(Users user) {//验证登录
		// TODO Auto-generated method stub
		return userDao.userLogin(user);
	}
	@Override
	public List<Users> queryUser(Users user) {
		// TODO Auto-generated method stub
		return userDao.queryUser(user);
	}

	@Override
	public PageBean queryUserByPage(Users user, PageBean pageBean) {
		// TODO Auto-generated method stub
		return userDao.queryUserByPage(user, pageBean);
	}

	@Override
	public List<Users> userRegister(Users user) {
		// TODO Auto-generated method stub
		return userDao.userRegister(user);
	}

}
