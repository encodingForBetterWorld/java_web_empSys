package com.cqupt.dao;

import java.util.List;

import com.cqupt.common.PageBean;
import com.cqupt.domain.Institution;
import com.cqupt.domain.Job;

public interface InsDao {
	public Institution saveIns(Institution ins);
	public List<Institution> queryIns(Institution ins);
	public PageBean queryInsByPage(Institution ins,PageBean pageBean);
	public Institution updateIns(Institution ins);
	public void deleteIns(String insId);
	public List<Institution> queryInsByName(Institution ins);//排序用户权限登录后查询奖惩
}
