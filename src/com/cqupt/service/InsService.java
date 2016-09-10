package com.cqupt.service;

import java.util.List;

import com.cqupt.common.PageBean;
import com.cqupt.domain.Institution;

public interface InsService {
	public Institution saveIns(Institution ins);
	public List<Institution> queryIns(Institution ins);
	public PageBean queryInsByPage(Institution ins,PageBean pageBean);
	public Institution updateIns(Institution ins);
	public void deleteIns(String insId);
	public List<Institution> queryInsByName(Institution ins);
}
