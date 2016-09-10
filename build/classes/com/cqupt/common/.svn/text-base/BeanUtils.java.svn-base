/*
 *@Project: framework 
 *@Package: com.cqupt.common
 *@File: BeanUtils.java 
 *@Date: 2015-12-11 
 *@author: chenyongzheng
 *@Copyright: V1.0 www.cqupt.edu.cn Inc. All rights reserved. 
 *@Description: 本内容仅限于公司内部传阅，禁止外泄以及用于其他的商业目的 
 */
package com.cqupt.common;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.BeansException;
import org.springframework.beans.FatalBeanException;
import org.springframework.util.Assert;

/**
 * 
 * @Description: bean对象数据处理工具类
 * @author chenyongzheng
 * @since 2015-12-11
 * @see org.springframework.beans.BeanUtils
 * 
 */
public class BeanUtils extends org.springframework.beans.BeanUtils {

	public static void copyProperties(Object source, Object target,
			Class<?> editable, String[] ignoreProperties) throws BeansException {

		Assert.notNull(source, "Source must not be null");
		Assert.notNull(target, "Target must not be null");

		Class<?> actualEditable = target.getClass();
		if (editable != null) {
			if (!editable.isInstance(target)) {
				throw new IllegalArgumentException("Target class ["
						+ target.getClass().getName()
						+ "] not assignable to Editable class ["
						+ editable.getName() + "]");
			}
			actualEditable = editable;
		}
		PropertyDescriptor[] targetPds = getPropertyDescriptors(actualEditable);
		List<String> ignoreList = (ignoreProperties != null) ? Arrays
				.asList(ignoreProperties) : null;

		for (PropertyDescriptor targetPd : targetPds) {
			if (targetPd.getWriteMethod() != null
					&& (ignoreProperties == null || (!ignoreList
							.contains(targetPd.getName())))) {
				PropertyDescriptor sourcePd = getPropertyDescriptor(
						source.getClass(), targetPd.getName());
				if (sourcePd != null && sourcePd.getReadMethod() != null) {
					try {
						Method readMethod = sourcePd.getReadMethod();
						if (!Modifier.isPublic(readMethod.getDeclaringClass()
								.getModifiers())) {
							readMethod.setAccessible(true);
						}
						Object value = readMethod.invoke(source);
						Method writeMethod = targetPd.getWriteMethod();
						if (!Modifier.isPublic(writeMethod.getDeclaringClass()
								.getModifiers())) {
							writeMethod.setAccessible(true);
						}
						if (value != null) {
							writeMethod.invoke(target, value);// 重写代码
						}
					} catch (Throwable ex) {
						throw new FatalBeanException(
								"Could not copy properties from source to target",
								ex);
					}
				}
			}
		}
	}
}
