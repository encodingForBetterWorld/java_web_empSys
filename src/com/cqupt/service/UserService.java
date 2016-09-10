package com.cqupt.service;



import java.util.List;

import com.cqupt.common.PageBean;
import com.cqupt.domain.Users;

public interface UserService {
	public Users saveUser(Users user);

	public void deleteUser(String userId);

	public Users updateUser(Users user);

	public List<Users> userLogin(Users user);

	public List<Users> queryUser(Users user);

	public PageBean queryUserByPage(Users user, PageBean pageBean);
	public List<Users> userRegister(Users user);

}
