package com.cqupt.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cqupt.common.BaseDao;
import com.cqupt.common.PageBean;

import com.cqupt.domain.Institution;


public class InsDaoImp extends BaseDao<Institution> implements InsDao {

	@Override
	public Institution saveIns(Institution ins) {
		// TODO Auto-generated method stub
		return save(ins);
	}

	@Override
	public List<Institution> queryIns(Institution ins) {
		Map<String, Object> parms = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("FROM Institution s WHERE 1=1 and delFlag=false ");
		if (ins != null) {
			if (ins.getId() != null) {
				hql.append(" AND s.id =:id ");
				parms.put("id", ins.getId());
			}
			if (ins.getName() != null) {
				hql.append(" AND s.name LIKE:name ");
				parms.put("name", "%" + ins.getName() + "%");
			}
		}

		return findByNameParam(hql.toString(), parms);
	}

	@Override
	public PageBean queryInsByPage(Institution ins, PageBean pageBean) {
		// TODO Auto-generated method stub

			Map<String, Object> parms = new HashMap<String, Object>();
			StringBuffer hql = new StringBuffer("FROM Institution i WHERE 1=1 and delFlag=false ");
			if (ins != null && ins.getName() != null) {
				hql.append(" AND i.name LIKE:name ");
				parms.put("name", "%" + ins.getName() + "%");
			}
			hql.append(" ORDER BY i.createtime DESC");
			return findPageByQuery(hql.toString(), parms, pageBean);
	}

	@Override
	public Institution updateIns(Institution ins) {
		// TODO Auto-generated method stub
		return update(ins);
	}

	@Override
	public void deleteIns(String insId) {
		// TODO Auto-generated method stub
		Institution i=get(Institution.class,insId);
		i.setDelFlag(true);
		update(i);//做假删除
	}

	@Override
	public List<Institution> queryInsByName(Institution ins) {
		// TODO Auto-generated method stub
		Map<String, Object> parms = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("FROM Institution p WHERE 1=1 and delFlag=false and version=0 ");
		if(ins.getName()!=null){
			hql.append(" AND p.name = :name ");
			parms.put("name",ins.getName());
		}
		hql.append(" ORDER BY p.createtime DESC");
		return findByNameParam(hql.toString(), parms);
	}

}
