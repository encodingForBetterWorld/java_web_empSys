package com.cqupt.domain;
// default package
// Generated 2015-12-17 16:48:17 by Hibernate Tools 4.3.1.Final

import java.util.Date;

import com.cqupt.common.BaseEntity;

/**
 * Stipend generated by hbm2java
 */
public class Stipend extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8607030066097370484L;
	private String id;
	private String name;//这个是工号
	private Float basic;
	private Float eat;
	private Float house;
	private Float duty;
	private Float scot;
	private Float other;
	private Date granttime;
	private Float totalize;
	private Users user;
    
	
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Float getBasic() {
		return this.basic;
	}

	public void setBasic(Float basic) {
		this.basic = basic;
	}

	public Float getEat() {
		return this.eat;
	}

	public void setEat(Float eat) {
		this.eat = eat;
	}

	public Float getHouse() {
		return this.house;
	}

	public void setHouse(Float house) {
		this.house = house;
	}

	public Float getDuty() {
		return this.duty;
	}

	public void setDuty(Float duty) {
		this.duty = duty;
	}

	public Float getScot() {
		return this.scot;
	}

	public void setScot(Float scot) {
		this.scot = scot;
	}

	public Float getOther() {
		return this.other;
	}

	public void setOther(Float other) {
		this.other = other;
	}

	public Date getGranttime() {
		return this.granttime;
	}

	public void setGranttime(Date granttime) {
		this.granttime = granttime;
	}

	public Float getTotalize() {
		return this.totalize;
	}

	public void setTotalize(Float totalize) {
		this.totalize = totalize;
	}

}
