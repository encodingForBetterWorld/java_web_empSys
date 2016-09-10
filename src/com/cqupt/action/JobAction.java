package com.cqupt.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.cqupt.common.BaseAction;
import com.cqupt.common.PageBean;
import com.cqupt.domain.Educate;
import com.cqupt.domain.Job;
import com.cqupt.domain.Users;
import com.cqupt.service.EducateService;
import com.cqupt.service.JobService;


@Namespace("/job")
@Results({@Result(name="listJob",location="/pages/manager/ListJob.jsp"),
		@Result(name="updateJob",location="/pages/manager/UpdateJob.jsp"),
		@Result(name="saveJob",location="/pages/manager/AddJob.jsp"),
		@Result(name="main",location="/pages/manager/Main.jsp"),
		@Result(name="selectEdu",location="/pages/manager/SelectEducate.jsp"),
		@Result(name="listJobUser",location="/pages/manager/ListJobUser.jsp"),
		@Result(name="success",location="/pages/manager/Success.jsp"),
		@Result(name="error",location="/pages/manager/ErrorRepete.jsp"),
		@Result(name="error1",location="/pages/manager/ErrorNullJob.jsp")
	})
	
public class JobAction extends BaseAction {
		/**
	 * 
	 */
	private static final long serialVersionUID = -2123397809629650050L;
		JobService jobService;
		Job job;
		Job queryJob;
		PageBean pageBean=new PageBean();
		EducateService educateService;
		List<Educate> edus= new ArrayList<Educate>();
		List<String> eduids = new ArrayList<String>();
		List<String> selectids = new ArrayList<String>();
		List<Users> users=new ArrayList<Users>();
		
		Calendar cal=Calendar.getInstance();
		
		public List<Users> getUsers() {
			return users;
		}
		public void setUsers(List<Users> users) {
			this.users = users;
		}
		public List<String> getSelectids() {
			return selectids;
		}
		public void setSelectids(List<String> selectids) {
			this.selectids = selectids;
		}
		public void setEducateService(EducateService educateService) {
			this.educateService = educateService;
		}
		
		public List<Educate> getEdus() {
			return edus;
		}
		public void setEdus(List<Educate> edus) {
			this.edus = edus;
		}
		public List<String> getEduids() {
			return eduids;
		}
		public void setEduids(List<String> eduids) {
			this.eduids = eduids;
		}
		public void setJobService(JobService jobService) {
			this.jobService = jobService;
		}
		public Job getJob() {
			return job;
		}
		public void setJob(Job job) {
			this.job = job;
		}
		public Job getQueryJob() {
			return queryJob;
		}
		public void setQueryJob(Job queryJob) {
			this.queryJob = queryJob;
		}
		public PageBean getPageBean() {
			return pageBean;
		}
		public void setPageBean(PageBean pageBean) {
			this.pageBean = pageBean;
		}
		/*
		 * 添加工作
		 */
		@Action("saveJob")
		public String saveJob(){
			if(job.getName().length()==0||job.getContent().length()==0){
			return"error1";
			}
			List<Job> ls=jobService.queryJob(job);
			if(ls.size()==0){
		    job.setCreatetime(cal.getTime());
			jobService.saveJob(job);
			//pageBean = jobService.queryJobByPage(null, pageBean);
			return "success";
			}
			return "error";
		}
		/*
		 * 修改岗位
		 */
		@Action("queryJobById")
		public String queryJobById(){
			List<Job> list=jobService.queryJob(job);
			if(list!=null&&list.size()>0){
				job=list.get(0);//把后台传过来的list中的第一个对象取出赋值给job
			}
			return "updateJob";
		}
		@Action("updateJob")
		public String updateJob(){
			job.setCreatetime(cal.getTime());
			jobService.updateJob(job);
			return "listJob";
		}
		/*
		 * 查询岗位
		 */
		@Action("queryJob")
		public String queryJob(){
			pageBean=jobService.queryJobByPage(queryJob, pageBean);
			return "listJob";
		}
		/*
		 * 删除
		 */
		@Action("delJobById")
		public String delJobById(){
			jobService.deleteJob(job.getId());
			return queryJob();
		}
		/*
		 * 岗位人员查询
		 */
		@Action("listJobUser")
		public String listJobUser(){
			job=jobService.queryJob(job).get(0);
			List<Users> list=new ArrayList<>(job.getUsers());
			int i=0;
			while(i<list.size()){
				Users u=list.get(i);
				if(u.getDelFlag()==false){
					users.add(u);}
				i++;
			}
			return "listJobUser";
		}
		/*
		 * 添加工作时选择和修改相应培训资料,涉及到多对多关联
		 */
		@Action("selectEdu")
		public String querySelectCourse() {

			edus = educateService.queryEducate(null);

			job = jobService.queryJob(job).get(0);

			Set<Educate> cs = job.getEdus();
			for (Educate c : cs) {
				selectids.add(c.getId());
			}
			return "selectEdu";
		}
		@Action("updateSelectCourse")
		public String updateSelectCourse() {
			Set<Educate> cs = new HashSet<Educate>();

			job = jobService.queryJob(job).get(0);
			for (String eduid : eduids) {
				Educate c = new Educate();
				c.setId(eduid);
				cs.add(educateService.queryEducate(c).get(0));
			}

			job.setEdus(cs);

			jobService.updateJob(job);

			//pageBean = jobService.queryJobByPage(queryJob, pageBean);
			return "listJob";
		}
		
}
