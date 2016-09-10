package com.cqupt.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.cqupt.common.BaseAction;
import com.cqupt.common.PageBean;
import com.cqupt.domain.Educate;
import com.cqupt.domain.Institution;
import com.cqupt.domain.Stipend;
import com.cqupt.domain.Users;
import com.cqupt.service.StService;
import com.cqupt.service.UserService;
@Namespace("/stipend")
@Results({@Result(name = "saveStipend", location = "/pages/manager/AddStipend.jsp"),
	@Result(name = "listStipend", location = "/pages/manager/ListStipend.jsp"),
	@Result(name = "main", location = "/pages/manager/Main.jsp"),
	@Result(name = "updateStipend", location = "/pages/manager/UpdateStipend.jsp"),
	@Result(name="success",location="/pages/manager/Success.jsp"),
	@Result(name="error",location="/pages/manager/ErrorNullTime.jsp"),
	@Result(name="error1",location="/pages/manager/ErrorNull.jsp")})
public class StipendAction extends BaseAction {
      /**
	 * 
	 */
	private static final long serialVersionUID = -5861751878406668801L;
	  Stipend st;
      StService stService;
      Users user;
      UserService userService;
      PageBean pageBean=new PageBean();
      
      List<Stipend> sts=new ArrayList<>();
      
	public List<Stipend> getSts() {
		return sts;
	}
	public void setSts(List<Stipend> sts) {
		this.sts = sts;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public Stipend getSt() {
		return st;
	}
	public void setSt(Stipend st) {
		this.st = st;
	}
	public StService getStService() {
		return stService;
	}
	public void setStService(StService stService) {
		this.stService = stService;
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
	 @Action("selectUser")
	   public String selectUser() {//在添加薪水表中显示人员下拉框

		  pageBean = userService.queryUserByPage(user, pageBean);

		return "saveStipend";
	}
	@Action("saveStipend")//在保存前先通过user.id进行查询，查询出对应的User，赋值给st中的Users
    public String saveStipend(){
	List<Users> list=userService.queryUser(user);
	if(list.size()==0){
		return "error1";	
			}
	user=list.get(0);
	if(st.getGranttime()!=null){
	st.setUser(user);
	String name=user.getUsername();//获取工号
	st.setName(name);
	//st.setUser(null);//取消外键关联，用懒加载代替该方法才能实现关联查询
    stService.saveSt(st);
    return "success";}
	return "error";
    }
	
	@Action("queryStipend")
	public String queryStipent(){
		  pageBean =  stService.queryStByPage(st, pageBean);
		  /*List<Stipend> list=pageBean.getList();//这个list是正序的
		  List<Stipend> convertlist=new ArrayList<Stipend>();//这个list是空的
		  int i=pageBean.getList().size()-1;
		  while(i>-1){
		  Stipend s=list.get(i);
		  convertlist.add(s);//倒序装填，实现按日期倒序排序
		  i--;
		  }
		  pageBean.setList(convertlist);*/
		return "listStipend";
	}
	/*
	 * 删除
	 */
	@Action("delStipendById")
	public String delStipendById(){
		//user = userService.queryUser(user).get(0);
		/*sts = new ArrayList<Stipend>(user.getSts());
		st=sts.get(0);
		st.setUser(null);*/
		stService.deleteSt(st.getId());
		return queryStipent();
	}
	/*
	 * 修改
	 */
	@Action("queryStipendById")
	public String queryStipendById(){
		st = stService.querySt(st).get(0);
		//sts = new ArrayList<Stipend>(user.getSts());
		return "updateStipend";
	}
	@Action("updateStipend")
	public String updateStipend(){
		if(st.getGranttime()!=null){
		stService.updateSt(st);
		return "listStipend";}
		return "error";
	}
}
