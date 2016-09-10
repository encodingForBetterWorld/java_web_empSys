/*
*@Project: framework 
*@Package: com.cqupt.common
*@File: BaseException.java 
*@Date: 2015-12-11 
*@author: chenyongzheng
*@Copyright: V1.0 www.cqupt.edu.cn Inc. All rights reserved. 
*@Description: 本内容仅限于公司内部传阅，禁止外泄以及用于其他的商业目的 
*/
package com.cqupt.common;
/**
 * 
* @Description: 所以异常类型的基类
* @author chenyongzheng
* @since 2015-12-11
* @see Exception
*
 */
public abstract class BaseException extends Exception {

	private static final long serialVersionUID = 6266618979568625272L;

	/**
	 * 返回异常代码
	 * 
	 * @return
	 */
	public abstract String getErrCode();

	/**
	 * 返回异常参数
	 * 
	 * @return 
	 */
	public abstract Object[] getArguments();
    /**
     * 
    * @Description: 异常信息描述  
    * @return String    异常信息描述
    * @throws  异常说明
     */
	public abstract String getErrMsg();
}