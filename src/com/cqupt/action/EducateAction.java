package com.cqupt.action;


import java.util.Calendar;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.convention.annotation.Result;
import com.cqupt.common.BaseAction;
import com.cqupt.common.PageBean;
import com.cqupt.domain.Educate;
import com.cqupt.domain.Job;
import com.cqupt.service.EducateService;
@Namespace("/edu")
@Results({@Result(name="listEducate",location="/pages/manager/ListEducate.jsp"),
	@Result(name="updateEducate",location="/pages/manager/UpdateEducate.jsp"),
	@Result(name="addEducate",location="/pages/manager/AddEducate.jsp"),
	@Result(name="success",location="/pages/manager/Success.jsp"),
	@Result(name="error",location="/pages/manager/ErrorRepete.jsp"),
	@Result(name="error1",location="/pages/manager/ErrorNullEducate.jsp")
})
public class EducateAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4229817500149348505L;
	EducateService educateService;
	Educate edu;
	Educate queryEdu;
	PageBean pageBean=new PageBean();
	PageBean selectBean=new PageBean();
	Calendar cal=Calendar.getInstance();
	
	public PageBean getSelectBean() {
		return selectBean;
	}
	public void setSelectBean(PageBean selectBean) {
		this.selectBean = selectBean;
	}
public PageBean getPageBean() {
		return pageBean;
	}
public void setEducateService(EducateService educateService) {
		this.educateService = educateService;
	}
	public void setEdu(Educate edu) {
		this.edu = edu;
	}
	
	public Educate getEdu() {
		return edu;
	}
	public void setQueryEdu(Educate queryEdu) {
		this.queryEdu = queryEdu;
	}
	
	public Educate getQueryEdu() {
		return queryEdu;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
@Action("saveEdu")
public String saveEducate(){
	if(edu.getBegintime()!=null&&edu.getEndtime()!=null&&edu.getName().length()!=0&&edu.getBegintime().before(edu.getEndtime())){
	List<Educate> ls=educateService.queryEducate(edu);
	if(ls.size()==0){
    edu.setCreatetime(cal.getTime());
	educateService.saveEducate(edu);
	return "success";
	}
	return "error";
}return "error1";
}
/*
 * 修改
 */
@Action("queryEduById")
public String queryEducateById(){
	List<Educate> list=educateService.queryEducate(edu);
	if(list!=null&&list.size()>0){
		edu=list.get(0);
	}
	return "updateEducate";
}
@Action("updateEducate")
public String updateEducate(){
	if(edu.getBegintime()!=null&&edu.getEndtime()!=null&&edu.getBegintime().before(edu.getEndtime())){
	edu.setCreatetime(cal.getTime());
	educateService.updateEducate(edu);
	return "listEducate";}
	return "error1";
}
@Action("queryEdu")
public String queryEducate(){
	pageBean=educateService.findPageByQuery(queryEdu, pageBean);
	return "listEducate";
}

@Action("delEducateById")
public String delEducateById(){
	educateService.deleteEducate(edu.getId());
	return queryEducate();
}
}
