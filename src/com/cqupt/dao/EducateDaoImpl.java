package com.cqupt.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cqupt.common.BaseDao;
import com.cqupt.common.PageBean;
import com.cqupt.domain.Educate;

public class EducateDaoImpl extends BaseDao<Educate> implements EducateDao {
	@Override
	public Educate saveEducate(Educate edu) {
		// TODO Auto-generated method stub
		return save(edu);
	}

	/**
	 * Description:
	 * 
	 * @param course
	 * @return
	 * @see com.cqupt.dao.CourseDao#updateCourse(com.cqupt.domain.Course)
	 */
	@Override
	public Educate updateEducate(Educate edu) {
		// TODO Auto-generated method stub
		return update(edu);
	}

	/**
	 * Description:
	 * 
	 * @param course
	 * @return
	 * @see com.cqupt.dao.CourseDao#queryCourse(com.cqupt.domain.Course)
	 */
	@Override
	public List<Educate> queryEducate(Educate edu) {

		Map<String, Object> parms = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("FROM Educate s WHERE 1=1 ");
		if (edu != null) {
			if (edu.getId() != null) {
				hql.append(" AND s.id =:id ");
				parms.put("id", edu.getId());
			}
			if (edu.getName() != null) {
				hql.append(" AND s.name LIKE:name ");
				parms.put("name", "%" + edu.getName() + "%");
			}

		}

		return findByNameParam(hql.toString(), parms);
	}

	/**
	 * Description:
	 * 
	 * @param course
	 * @param pageBean
	 * @return
	 * @see com.cqupt.dao.CourseDao#queryCourseByPage(com.cqupt.domain.Course,
	 *      com.cqupt.common.PageBean)
	 */
	@Override
	public PageBean findPageByQuery(Educate edu, PageBean pageBean) {

		Map<String, Object> parms = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer("FROM Educate s WHERE 1=1 ");
		if (edu != null && edu.getName() != null) {
			hql.append(" AND s.name LIKE:name ");
			parms.put("name", "%" + edu.getName() + "%");
		}
		hql.append(" ORDER BY s.begintime DESC");
		return findPageByQuery(hql.toString(), parms, pageBean);
	}

	@Override
	public void deleteEducate(String educateId) {
		// TODO Auto-generated method stub
		delete(Educate.class,educateId);
	}

}

