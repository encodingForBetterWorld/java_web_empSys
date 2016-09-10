package com.cqupt.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.cqupt.common.BaseAction;
import com.cqupt.common.PageBean;
import com.cqupt.domain.Educate;
import com.cqupt.domain.Institution;
import com.cqupt.domain.Job;
import com.cqupt.domain.Stipend;
import com.cqupt.domain.Users;
import com.cqupt.service.InsService;
import com.cqupt.service.JobService;
import com.cqupt.service.StService;
import com.cqupt.service.UserService;

@Namespace("/user")
@Results({ @Result(name = "register", location = "/pages/manager/register.jsp"),
		@Result(name = "listEducate", location = "/pages/manager/ListEducate.jsp"),
		@Result(name = "listuser", location = "/pages/manager/ListUser.jsp"),
		@Result(name = "login", location = "/pages/user/Login.jsp"),
		@Result(name = "main", location = "/pages/manager/Main.jsp"),
		@Result(name = "usermain", location = "/pages/user/UserMain.jsp"),
		@Result(name = "updateUser", location = "/pages/manager/UpdateUser.jsp"),
		@Result(name = "updatePerson", location = "/pages/user/UpdatePerson.jsp"),
		@Result(name = "userStipend", location = "/pages/user/UserListStipend.jsp"),
		@Result(name = "userInstitution", location = "/pages/user/UserListInstitution.jsp"),
		@Result(name = "userEducate", location = "/pages/user/UserListEducate.jsp"),
		@Result(name = "updateuserjob", location = "/pages/manager/UpdateUserJob.jsp"),
		@Result(name="success",location="/pages/manager/Success.jsp"),
		@Result(name="logout",location="/pages/manager/Logout.jsp"),
		@Result(name="errorlogin",location="/pages/manager/ErrorLogin.jsp"),
		@Result(name="error",location="/pages/manager/ErrorRepete.jsp"),
		@Result(name="usererror",location="/pages/user/UserError.jsp"),
		@Result(name="error1",location="/pages/manager/ErrorNull.jsp"),
		@Result(name="error2",location="/pages/manager/ErrorParaNull.jsp")
		})
public class UsersAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 387978249645603692L;
	Users user;
	Users queryuser;
	Users selectuser;
	Job job;
	Stipend st;
	Institution ins;
	
	InsService insService;
	StService stService;
	UserService userService;
	JobService jobService;
	PageBean pageBean=new PageBean();
	PageBean privateBean=new PageBean(); 
	
	List<Users> ls;
	List<Stipend> sts=new ArrayList<Stipend>();
	List<Institution> inss=new ArrayList<Institution>();
	List<Educate> edus=new ArrayList<Educate>();
	List<Job> jobs;
	Calendar cal=Calendar.getInstance();
	
	public List<Job> getJobs() {
		return jobs;
	}

	public void setJobs(List<Job> jobs) {
		this.jobs = jobs;
	}

	public List<Educate> getEdus() {
		return edus;
	}

	public void setEdus(List<Educate> edus) {
		this.edus = edus;
	}

	public List<Stipend> getSts() {
		return sts;
	}

	public void setSts(List<Stipend> sts) {
		this.sts = sts;
	}

	

	public List<Institution> getInss() {
		return inss;
	}

	public void setInss(List<Institution> inss) {
		this.inss = inss;
	}

	public Stipend getSt() {
		return st;
	}

	public void setSt(Stipend st) {
		this.st = st;
	}

	public Institution getIns() {
		return ins;
	}

	public void setIns(Institution ins) {
		this.ins = ins;
	}

	public void setInsService(InsService insService) {
		this.insService = insService;
	}

	public void setStService(StService stService) {
		this.stService = stService;
	}

	public List<Users> getLs() {
		return ls;
	}

	public void setLs(List<Users> ls) {
		this.ls = ls;
	}

	public Users getSelectuser() {
		return selectuser;
	}

	public void setSelectuser(Users selectuser) {
		this.selectuser = selectuser;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public PageBean getPrivateBean() {
		return privateBean;
	}

	public void setPrivateBean(PageBean privateBean) {
		this.privateBean = privateBean;
	}



	public Users getQueryuser() {
		return queryuser;
	}

	public void setQueryuser(Users queryuser) {
		this.queryuser = queryuser;
	}

	public void setJobService(JobService jobService) {
		this.jobService = jobService;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}
	/*
	 * 下面进行的是人员录入
	 */
	@Action("selectJob")
	   public String selectJob(){//在添加人员表中显示工作下拉框
		pageBean = jobService.queryJobByPage(job, pageBean);
		return "register";
	   }
	@Action("register")//添加员工，并防止工号重复
	public String saveUser() {
		if(user.getUsername().length()==0||user.getPassword().length()==0||user.getBirthday().after(cal.getTime())){
			return"error2";
		}
		List<Users> list=userService.userRegister(user);
		if(list.size()==0){
			List<Job> ls=jobService.queryJob(job);
			if(ls.size()==0){
				return "error1";
			}
		    job=ls.get(0);
			user.setJob(job);
			String jobname=job.getName();//获取岗位名称
			user.setJobname(jobname);
			user.setCreatetime(cal.getTime());
			userService.saveUser(user);
			return "success";
			}
		//pageBean = jobService.queryJobByPage(job, pageBean);
		return "error";
		}
	@Action("getUserInfo")
	public String getUserInfo() {
		List<Users> list = userService.userLogin(user);
		if (list.size() > 0) {// 验证人员登录	 
			user = list.get(0);
			user.setLogintime(cal.getTime());
			userService.updateUser(user);
			if (user.getIsadmin() == 1) {// 判断是否为管理员
					return "main";
				}
			ls=userService.queryUser(user);//往下个会话传值
				    return "usermain";
		   }
		//user=userService.queryUser(user).get(0);
		return "errorlogin";
		}
   /*
    * 员工查询
    */
	@Action("queryUser")
	public String queryUser(){
		pageBean=userService.queryUserByPage(queryuser, pageBean);
		return "listuser";
	}
   /*
    * 以下进行的是修改用户资料
    */
	/*
	 * 修改
	 */
	@Action("queryUserById")
	public String queryUserById(){
		List<Users> list=userService.queryUser(user);
		if(list!=null&&list.size()>0){
			user=list.get(0);
		}
		return "updateUser";
	}
	@Action("updateUser")
	public String updateUser(){
		if(user.getUsername().length()==0||user.getPassword().length()==0||user.getBirthday().after(cal.getTime())){
			return"error2";
		}
		user.setCreatetime(cal.getTime());
		userService.updateUser(user);
		return "listuser";
}
   /*
    * 删除人员
    */
   @Action("delUserById")
   public String delUserById(){
   	userService.deleteUser(user.getId());
   	return queryUser();
   }
   /*
    * 个人权限修改
    */
   @Action("queryPersonById")
   public String queryPersonById(){
   	List<Users> list=userService.queryUser(user);
   	if(list!=null&&list.size()>0){
   		user=list.get(0);
   	}
   	return "updatePerson";
   }
   @Action("updatePerson")
   public String updatePerson(){
	   if(user.getUsername().length()==0||user.getPassword().length()==0||user.getBirthday().after(cal.getTime())){
			return"error2";
		}
	user.setCreatetime(cal.getTime());
   	userService.updateUser(user);
   	ls=userService.queryUser(user);
   	return "success";
   }
   /*
    * 个人权限查询薪水
    */
   @Action("queryStipendByUsername")
   public String queryStipendByUsername(){
		user = userService.queryUser(user).get(0);
		List<Stipend> list= new ArrayList<Stipend>(user.getSts());//通过外键关联
		if(list.size()==0){
			return "usererror";
		}
		st=list.get(0);
		//st.setName(user.getUsername());
		sts=stService.queryStByName(st);//通过日期排序
        return "userStipend";
   }
   /*
    * 个人权限查询奖惩
    */
   @Action("queryInstitutionByUsername")
   public String queryInstitutionByUsername(){
	   user = userService.queryUser(user).get(0);
	   List<Institution> list= new ArrayList<Institution>(user.getInss());
	   if(list.size()==0){
		   return "usererror";
	   }
	   ins=list.get(0);
	   //ins.setName(user.getUsername());
	   inss=insService.queryInsByName(ins);//通过日期排序
	   return "userInstitution"; 
   }
   /*
    * 个人权限查询教程，使用间接查询
   */
   @Action("queryEducateByUser")
    public String queryEducateByUser(){
	   user=userService.queryUser(user).get(0);
	   List<Educate> list=new ArrayList<Educate>(user.getJob().getEdus());//这个list中的Educate是无序的，如何让它们按开课日期排序？  
	   Collections.sort((List<Educate>) list,new BaseAction());//按开始日期排序
	   for(Educate e:list){
		   edus.add(e);
	   }
	   return "userEducate";
   } 
   /*
    * 人事调动
    */
   @Action("queryJobById")
   public String queryJobById(){
	   user=userService.queryUser(user).get(0);
	   jobs=jobService.queryJob(null);
	   return "updateuserjob";
   }
   @Action("updateuserjob")
   public String updateUserJob(){
	   user=userService.queryUser(user).get(0);//通过传进去的ID取出实体
	   Job j =jobService.queryJob(job).get(0);
	   user.setJob(j);
	   String jobname=j.getName();
	   user.setJobname(jobname);
	   userService.updateUser(user);
	   return "listuser";
   }
   /*
	*用于用户隐藏记录
	*/

	@Action("hiddenStipendById")
	public String hiddenStipendById(){
		st=stService.querySt(st).get(0);
		st.setVersion(1);
		stService.updateSt(st);
		user=st.getUser();
		return queryStipendByUsername();
	}
	 
	@Action("hiddenInstitutionById")
	public String hiddenInstitutionById(){
		ins=insService.queryIns(ins).get(0);
		ins.setVersion(1);
		insService.updateIns(ins);
		user=ins.getUser();
		return queryInstitutionByUsername();
	}
	/*
	 * 用户显示隐藏的记录
	 */
	@Action("showStipendById")
	   public String showStipendById(){
			user = userService.queryUser(user).get(0);
			List<Stipend> list= new ArrayList<Stipend>(user.getSts());//通过外键关联
			int i=0;
			while(i<list.size()){//循环赋值
				Stipend s=list.get(i);
				s.setVersion(0);
				stService.updateSt(s);
				sts.add(s);
				i++;
			}
			st=sts.get(0);
			sts=stService.queryStByName(st);//通过日期排序
	        return "userStipend";
	   }
	
	
	
	@Action("showInstitutionById")
	   public String showInstitutionById(){
			user = userService.queryUser(user).get(0);
			List<Institution> list= new ArrayList<Institution>(user.getInss());//通过外键关联
			int i=0;
			while(i<list.size()){//循环赋值
				Institution s=list.get(i);
				s.setVersion(0);
				insService.updateIns(s);
				inss.add(s);
				i++;
			}
			ins=inss.get(0);
			inss=insService.queryInsByName(ins);//通过日期排序
	        return "userInstitution";
	   }
	@Action("logout")
	   public String logout(){
		   user = userService.queryUser(user).get(0);
		   user.setLogouttime(cal.getTime());
		   userService.updateUser(user);
		   return "logout";
	}

}