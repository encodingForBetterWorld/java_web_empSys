package com.cqupt.service;

import java.util.List;

import com.cqupt.common.PageBean;
import com.cqupt.dao.InsDao;
import com.cqupt.domain.Institution;

public class InsServiceImp implements InsService {
    InsDao insDao;
    
	public InsDao getInsDao() {
		return insDao;
	}

	public void setInsDao(InsDao insDao) {
		this.insDao = insDao;
	}

	@Override
	public Institution saveIns(Institution ins) {
		// TODO Auto-generated method stub
		return insDao.saveIns(ins);
	}

	@Override
	public List<Institution> queryIns(Institution ins) {
		// TODO Auto-generated method stub
		return insDao.queryIns(ins);
	}

	@Override
	public PageBean queryInsByPage(Institution ins, PageBean pageBean) {
		// TODO Auto-generated method stub
		return insDao.queryInsByPage(ins, pageBean);
	}

	@Override
	public Institution updateIns(Institution ins) {
		// TODO Auto-generated method stub
		return insDao.updateIns(ins);
	}

	@Override
	public void deleteIns(String insId) {
		// TODO Auto-generated method stub
		insDao.deleteIns(insId);
	}

	@Override
	public List<Institution> queryInsByName(Institution ins) {
		// TODO Auto-generated method stub
		return insDao.queryInsByName(ins);
	}

}
