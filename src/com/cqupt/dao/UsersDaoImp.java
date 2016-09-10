package com.cqupt.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cqupt.common.BaseDao;
import com.cqupt.common.PageBean;
import com.cqupt.domain.Users;

public class UsersDaoImp extends BaseDao<Users> implements UsersDao {

	@Override
	public Users saveUser(Users user) {
		// TODO Auto-generated method stub
		return save(user);
	}

	@Override
	public void deleteUser(String userId) {
		// TODO Auto-generated method stub
	    Users s=get(Users.class,userId);
	    s.setDelFlag(true);
	    update(s);//做假删除
	}

	@Override
	public Users updateUser(Users user) {
		// TODO Auto-generated method stub
		return update(user);
	}

	@Override
	public List<Users> userLogin(Users user) {//验证登录
		// TODO Auto-generated method stub
		Map<String,Object> parms=new HashMap<String,Object>();
		String sb=new String("From Users as u WHERE username = :username AND password = :password AND delFlag = false ");//执行查询
		parms.put("username", user.getUsername());
		parms.put("password", user.getPassword());
		
		return findByNameParam(sb.toString(), parms);
}
	@Override
	public List<Users> userRegister(Users user) {//验证注册
		// TODO Auto-generated method stub
		Map<String,Object> parms=new HashMap<String,Object>();
		String sb=new String("From Users as u WHERE username = :username AND delFlag = false ");//执行查询
		parms.put("username", user.getUsername());
		
		return findByNameParam(sb.toString(), parms);
}

	@Override
	public List<Users> queryUser(Users user) {
			// TODO Auto-generated method stub

			Map<String, Object> parms = new HashMap<String, Object>();
			StringBuffer hql = new StringBuffer("FROM Users s WHERE 1=1 AND delFlag = false");
			if (user != null) {
				if (user.getId() != null) {
					hql.append(" AND s.id =:id ");
					parms.put("id", user.getId());
				}
				if (user.getUsername() != null) {
					hql.append(" AND s.username LIKE :username ");
					parms.put("username", "%" + user.getUsername() + "%");
				}
			}

			return findByNameParam(hql.toString(), parms);
		}

	@Override
	public PageBean queryUserByPage(Users user, PageBean pageBean) {
		// TODO Auto-generated method stub

			Map<String, Object> parms = new HashMap<String, Object>();
			StringBuffer hql = new StringBuffer("FROM Users s WHERE 1=1 AND delFlag = false");
			if (user != null && user.getUsername() != null) {
				hql.append(" AND s.username = :username ");
				parms.put("username",user.getUsername());
			}
			hql.append(" ORDER BY s.createtime DESC");
			return findPageByQuery(hql.toString(), parms, pageBean);
	}
	
}