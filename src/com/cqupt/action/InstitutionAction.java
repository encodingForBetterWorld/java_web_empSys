package com.cqupt.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.cqupt.common.BaseAction;
import com.cqupt.common.PageBean;
import com.cqupt.domain.Institution;
import com.cqupt.domain.Stipend;
import com.cqupt.domain.Users;
import com.cqupt.service.InsService;
import com.cqupt.service.UserService;
@Namespace("/institution")
@Results({@Result(name = "saveInstitution", location = "/pages/manager/AddInstitution.jsp"),
	@Result(name = "updateInstitution", location = "/pages/manager/UpdateInstitution.jsp"),
	@Result(name = "listInstitution", location = "/pages/manager/ListInstitution.jsp"),
	@Result(name = "main", location = "/pages/manager/Main.jsp"),
	@Result(name="success",location="/pages/manager/Success.jsp"),
	@Result(name="error",location="/pages/manager/ErrorNullTime.jsp"),
	@Result(name="error1",location="/pages/manager/ErrorNull.jsp")})
public class InstitutionAction extends BaseAction {
/**
	 * 
	 */
	private static final long serialVersionUID = -8370904756684775377L;
Institution ins;
InsService insService;
UserService userService;
Users user;
Users quser;

PageBean pageBean=new PageBean();

List<Institution> inss=new ArrayList<>();


public Users getQuser() {
	return quser;
}
public void setQuser(Users quser) {
	this.quser = quser;
}
public List<Institution> getInss() {
	return inss;
}
public void setInss(List<Institution> inss) {
	this.inss = inss;
}
public PageBean getPageBean() {
	return pageBean;
}
public void setPageBean(PageBean pageBean) {
	this.pageBean = pageBean;
}
public Users getUser() {
	return user;
}
public void setUser(Users user) {
	this.user = user;
}
public void setUserService(UserService userService) {
	this.userService = userService;
}
public Institution getIns() {
	return ins;
}
public void setIns(Institution ins) {
	this.ins = ins;
}
public InsService getInsService() {
	return insService;
}
public void setInsService(InsService insService) {
	this.insService = insService;
}

@Action("selectUser")
public String selectInsUser() {//在添加奖惩表中显示人员下拉框

	pageBean = userService.queryUserByPage(user, pageBean);

	return "saveInstitution";
}
@Action("saveInstitution")//在保存前先通过user.id进行查询，查询出对应的User，赋值给st中的Users
public String saveInstitution(){
List<Users> list=userService.queryUser(user);
if(list.size()==0){
	return "error1";	
		}
user=list.get(0);
if(ins.getCreatetime()!=null){
ins.setUser(user);//建立外键关联
String name=user.getUsername();//获取工号
ins.setName(name);
//ins.setUser(null);//取消外键关联，用懒加载处理该方法更好
insService.saveIns(ins);

return "success";}
return "error";
}
@Action("queryInstitution")
public String queryInstitution(){
	pageBean=insService.queryInsByPage(ins, pageBean);
	return "listInstitution";
}
@Action("delInstitutionById")
public String delInstitutionById(){
	insService.deleteIns(ins.getId());
	return queryInstitution();
}
/*
 * 修改
 */
@Action("queryInstitutionById")
public String queryInstitutionById(){
    ins=insService.queryIns(ins).get(0);
	return "updateInstitution";
}
@Action("updateInstitution")
public String updateInstitution(){
	if(ins.getCreatetime()!=null){
	insService.updateIns(ins);
	return "listInstitution";
}return "error";
}
}
