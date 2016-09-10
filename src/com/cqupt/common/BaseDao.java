/*
 *@Project: framework 
 *@Package: com.cqupt.common
 *@File: BaseDao.java 
 *@Date: 2015-12-11 
 *@author: chenyongzheng
 *@Copyright: V1.0 www.cqupt.edu.cn Inc. All rights reserved. 
 *@Description: 本内容仅限于公司内部传阅，禁止外泄以及用于其他的商业目的 
 */
package com.cqupt.common;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

/**
 * 
 * @Description: 持久化层基础类
 * @author chenyongzheng
 * @since 2015-12-11
 * @see org.springframework.orm.hibernate4.support.HibernateDaoSupport
 * @param <T>
 *            实体类型
 */
public class BaseDao<T extends BaseEntity> extends HibernateDaoSupport {
	/**
	 * 
	 * @Description: 保存实体
	 * @param 待保存实体
	 * @return T 已保存实体
	 */
	protected T save(T t) {
		getHibernateTemplate().save(t);
		return t;

	}

	/**
	 * 
	 * @Description: 添加或修改实体
	 * @param 待操作实体
	 * @return T 已操作实体
	 * @throws 异常说明
	 */
	protected T saveOrUpdate(T t) {
		getHibernateTemplate().saveOrUpdate(t);
		return t;
	}

	/**
	 * 
	 * @Description: 修改实体
	 * @param 待操作实体
	 * @return T 已操作实体
	 * @throws 异常说明
	 */
	protected T update(T t) {
		getHibernateTemplate().update(t);
		return t;
	}

	/**
	 * 
	 * @Description: merge来合并两个session中的同一对象
	 * @param 待操作实体
	 * @return T 已操作实体
	 * @throws 异常说明
	 */
	protected T merge(T t) {
		return getHibernateTemplate().merge(t);
	}

	/**
	 * 
	 * @Description: 通过ID获取实体
	 * @param entityClass
	 *            实体类型
	 * @param id
	 *            实体id
	 * @return T 已操作实体
	 * @throws 异常说明
	 */

	protected T get(Class<T> entityClass, Serializable id) {
		return getHibernateTemplate().get(entityClass, id);
	}

	/**
	 * 
	 * @Description: 通过实体ID加载实体
	 * @param entityClass
	 *            实体类型
	 * @param id
	 *            实体id
	 * @return T 已操作实体
	 * @throws 异常说明
	 */
	protected T load(Class<T> entityClass, Serializable id) {
		return getHibernateTemplate().load(entityClass, id);
	}

	/**
	 * 
	 * @Description: 删除单实体
	 * @param entityClass
	 *            实体类型
	 * @param id
	 *            实体id
	 * @return void 返回类型
	 * @throws 异常说明
	 */
	protected void delete(Class<T> entityClass, Serializable id) {
		getHibernateTemplate().delete(get(entityClass, id));

	}

	/**
	 * 
	 * @Description: 删除单实体
	 * @param t
	 *            实体类型
	 * @return void 返回类型
	 * @throws 异常说明
	 */
	protected void delete(T t) {
		getHibernateTemplate().delete(t);
	}

	/**
	 * 
	 * @Description: 删除多实体
	 * @param entityClass
	 *            实体类型
	 * @param ids
	 *            删除的ID数组
	 * @return void 返回类型
	 * @throws 异常说明
	 */
	protected void delete(Class<T> entityClass, Serializable[] ids) {
		for (Serializable id : ids) {
			delete(entityClass, id);
		}

	}

	/**
	 * 
	 * @Description: 分页显示
	 * @param 参数说明
	 * @return PageBean 返回类型
	 * @throws 异常说明
	 */
	@SuppressWarnings("rawtypes")
	public PageBean findPageByQuery(final String hql, final Map<String, Object> parms, final PageBean pageBean) {
		return (PageBean) getHibernateTemplate().execute(new HibernateCallback<PageBean>() {
			public PageBean doInHibernate(Session session) throws HibernateException {

				Set<String> keys = parms.keySet();
				Query query = session.createQuery(hql);
				for (String key : keys) {
					query.setParameter(key, parms.get(key));
				}
				int allRows = query.list().size();
				int totalPage = pageBean.getTotalPages(allRows);
				int offset = pageBean.getCurrentPageOffset();
				query.setFirstResult(offset);
				query.setMaxResults(pageBean.getPageSize());
				List list = query.list();

				pageBean.setList(list);
				pageBean.setAllRows(allRows);
				pageBean.setTotalPage(totalPage);

				return pageBean;

			}
		});
	}
	@SuppressWarnings("rawtypes")
	public List findByNameParam(String hql,Map<String,Object> parms){
		Set<String> keys=parms.keySet();
		String[] paramNames=keys.toArray(new String[0]);
		Object[] values=new Object[paramNames.length];
		for(int i=0;i<paramNames.length;i++){
			values[i]=parms.get(paramNames[i]);
		}
		List list=getHibernateTemplate().findByNamedParam(hql, paramNames, values);
		return list;
	}

}
