package com.cqupt.service;

import java.util.List;

import com.cqupt.common.PageBean;
import com.cqupt.dao.JobDao;
import com.cqupt.domain.Job;

public class JobServiceImp implements JobService {
	JobDao jobDao;

	public JobDao getJobDao() {
		return jobDao;
	}

	public void setJobDao(JobDao jobDao) {
		this.jobDao = jobDao;
	}

	@Override
	public Job saveJob(Job job) {
		// TODO Auto-generated method stub
		return jobDao.saveJob(job);
	}

	@Override
	public List<Job> queryJob(Job job) {
		// TODO Auto-generated method stub
		
		return jobDao.queryJob(job);
	}

	@Override
	public PageBean queryJobByPage(Job job, PageBean pageBean) {
		// TODO Auto-generated method stub
		return jobDao.findPageByQuery(job, pageBean);
	}

	@Override
	public Job updateJob(Job job) {
		// TODO Auto-generated method stub
		return jobDao.updateJob(job);
	}

	@Override
	public void deleteJob(String jobId) {
		// TODO Auto-generated method stub
		jobDao.deleteJob(jobId);
	}

}
