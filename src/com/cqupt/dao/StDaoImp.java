package com.cqupt.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cqupt.common.BaseDao;
import com.cqupt.common.PageBean;

import com.cqupt.domain.Stipend;


public class StDaoImp extends BaseDao<Stipend> implements StDao {

	@Override
	public Stipend saveSt(Stipend st) {
		// TODO Auto-generated method stub
		return save(st);
	}

	@Override
	public List<Stipend> querySt(Stipend st) {
		Map<String, Object> parms = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("FROM Stipend s WHERE 1=1 and delFlag=false");
		if (st != null) {
			if (st.getId() != null) {
				hql.append(" AND s.id =:id ");
				parms.put("id", st.getId());
			}
			if (st.getName() != null) {
				hql.append(" AND s.name LIKE:name");
				parms.put("name", "%" + st.getName() + "%");
			}
		}

		return findByNameParam(hql.toString(), parms);
	}

	@Override
	public PageBean queryStByPage(Stipend st,PageBean pageBean) {
		// TODO Auto-generated method stub

			Map<String, Object> parms = new HashMap<String, Object>();
			StringBuffer hql = new StringBuffer("FROM Stipend s WHERE 1=1 and delFlag=false ");
			if (st != null && st.getName() != null) {
				hql.append(" AND s.name LIKE:name");
				parms.put("name", "%" + st.getName() + "%");
			}
			hql.append(" ORDER BY s.granttime DESC");
			return findPageByQuery(hql.toString(), parms, pageBean);
	}

	@Override
	public Stipend updateSt(Stipend st) {
		// TODO Auto-generated method stub
		return update(st);
	}

	@Override
	public void deleteSt(String stId) {
		// TODO Auto-generated method stub
		Stipend s = get(Stipend.class,stId);
		//s.setUser(null);
		//update(s);
		//System.out.println("..............."+s.getName());
		s.setDelFlag(true);
		update(s);//更新标志位，假删除
		//delete(s);真删除
	}

	@Override
	public List<Stipend> queryStByName(Stipend st) {
		// TODO Auto-generated method stub
		Map<String, Object> parms = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("FROM Stipend p WHERE 1=1 and delFlag=false and version=0");
		if(st.getName()!=null){
			hql.append(" AND p.name = :name ");
			parms.put("name",st.getName());
		}
		hql.append(" ORDER BY p.granttime DESC");
		return findByNameParam(hql.toString(), parms);
	}

	

}
