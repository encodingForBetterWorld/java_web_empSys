package com.cqupt.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cqupt.common.BaseDao;
import com.cqupt.common.PageBean;
import com.cqupt.domain.Job;

public class JobDaoImp extends BaseDao<Job> implements JobDao {

	@Override
	public Job saveJob(Job job) {
		// TODO Auto-generated method stub
		return save(job);
	}

	@Override
	public List<Job> queryJob(Job job) {
		// TODO Auto-generated method stub

		Map<String, Object> parms = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("FROM Job s WHERE 1=1 ");
		if (job != null) {
			if (job.getId() != null) {
				hql.append(" AND s.id =:id ");
				parms.put("id", job.getId());
			}
			if (job.getName() != null) {
				hql.append(" AND s.name LIKE:name ");
				parms.put("name", "%" + job.getName() + "%");
			}
		}

		return findByNameParam(hql.toString(), parms);
	}

	@Override
	public PageBean findPageByQuery(Job job, PageBean pageBean) {
		// TODO Auto-generated method stub

		Map<String, Object> parms = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("FROM Job s WHERE 1=1 ");
		if (job != null && job.getName() != null) {
			hql.append(" AND s.name LIKE:name ");
			parms.put("name", "%" + job.getName() + "%");
		}
		hql.append(" ORDER BY s.createtime DESC");
		return findPageByQuery(hql.toString(), parms, pageBean);
	}

	@Override
	public Job updateJob(Job job) {
		// TODO Auto-generated method stub
		return update(job);
	}

	@Override
	public void deleteJob(String jobId) {
		// TODO Auto-generated method stub
		delete(Job.class,jobId);
	}

}
