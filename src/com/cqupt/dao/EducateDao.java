package com.cqupt.dao;

import java.util.List;

import com.cqupt.common.PageBean;
import com.cqupt.domain.Educate;

public interface EducateDao {
public Educate saveEducate(Educate edu);
public List<Educate> queryEducate(Educate edu);
public PageBean findPageByQuery(Educate edu,PageBean pageBean);
public Educate updateEducate(Educate edu);
public void deleteEducate(String educateId);
}
