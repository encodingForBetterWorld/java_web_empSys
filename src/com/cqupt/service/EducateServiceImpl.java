package com.cqupt.service;

import java.util.List;

import com.cqupt.common.PageBean;
import com.cqupt.dao.EducateDao;
import com.cqupt.domain.Educate;

public class EducateServiceImpl implements EducateService{
	EducateDao eduDao;

public void setEduDao(EducateDao eduDao) {
		this.eduDao = eduDao;
	}

public Educate saveEducate(Educate edu){
//业务层
	return eduDao.saveEducate(edu);
	
}

@Override
public List<Educate> queryEducate(Educate edu) {
	// TODO Auto-generated method stub
	return eduDao.queryEducate(edu);
}

@Override
public PageBean findPageByQuery(Educate edu, PageBean pageBean) {
	// TODO Auto-generated method stub
	return eduDao.findPageByQuery(edu, pageBean);
}

@Override
public Educate updateEducate(Educate edu) {
	// TODO Auto-generated method stub
	return eduDao.updateEducate(edu);
}

@Override
public void deleteEducate(String educateId) {
	// TODO Auto-generated method stub
	eduDao.deleteEducate(educateId);
}
}
