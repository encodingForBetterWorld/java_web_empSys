package com.cqupt.service;

import java.util.List;

import com.cqupt.common.PageBean;
import com.cqupt.dao.StDao;
import com.cqupt.domain.Stipend;

public class StServiceImp implements StService {
    StDao stDao;
    
	public StDao getStDao() {
		return stDao;
	}

	public void setStDao(StDao stDao) {
		this.stDao = stDao;
	}

	@Override
	public Stipend saveSt(Stipend st) {
		// TODO Auto-generated method stub
		return stDao.saveSt(st);
	}

	@Override
	public List<Stipend> querySt(Stipend st) {
		// TODO Auto-generated method stub
		return stDao.querySt(st);
	}

	@Override
	public PageBean queryStByPage(Stipend st, PageBean pageBean) {
		// TODO Auto-generated method stub
		return stDao.queryStByPage(st, pageBean);
	}

	@Override
	public Stipend updateSt(Stipend st) {
		// TODO Auto-generated method stub
		return stDao.updateSt(st);
	}

	@Override
	public void deleteSt(String stId) {
		// TODO Auto-generated method stub
		stDao.deleteSt(stId);
	}

	@Override
	public List<Stipend> queryStByName(Stipend st) {
		// TODO Auto-generated method stub
	return stDao.queryStByName(st);
	}

}
