package com.cqupt.dao;

import java.util.List;

import com.cqupt.common.PageBean;
import com.cqupt.domain.Job;

public interface JobDao {
	public Job saveJob(Job job);
	public List<Job> queryJob(Job job);
	public PageBean findPageByQuery(Job job,PageBean pageBean);
	public Job updateJob(Job job);
	public void deleteJob(String jobId);	
}
