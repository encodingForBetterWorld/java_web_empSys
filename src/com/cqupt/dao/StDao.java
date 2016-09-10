package com.cqupt.dao;

import java.util.List;

import com.cqupt.common.PageBean;
import com.cqupt.domain.Stipend;

public interface StDao {
	public Stipend saveSt(Stipend st);
	public List<Stipend> querySt(Stipend st);
	public PageBean queryStByPage(Stipend st,PageBean pageBean);
	public Stipend updateSt(Stipend st);
	public void deleteSt(String stId);
	public List<Stipend> queryStByName(Stipend st);//用户权限登录后查询薪水
}
