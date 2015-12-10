package com.kaanish.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class CompanyInfo {

	@Id
	private int id;

	private String compname;
	private String email;
	private String mobile;
	private String phone;
	private String addr;
	private String city;
	private String state;

	private String vatno;
	private String cstno;
	private String tinno;
	private String servicetaxno;
	@Temporal(TemporalType.TIMESTAMP)
	private Date vatdate;
	@Temporal(TemporalType.TIMESTAMP)
	private Date cstdate;
	@Temporal(TemporalType.TIMESTAMP)
	private Date tindate;
	@Temporal(TemporalType.TIMESTAMP)
	private Date servtaxcate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCompname() {
		return compname;
	}

	public void setCompname(String compname) {
		this.compname = compname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getVatno() {
		return vatno;
	}

	public void setVatno(String vatno) {
		this.vatno = vatno;
	}

	public String getCstno() {
		return cstno;
	}

	public void setCstno(String cstno) {
		this.cstno = cstno;
	}

	public String getTinno() {
		return tinno;
	}

	public void setTinno(String tinno) {
		this.tinno = tinno;
	}

	public String getServicetaxno() {
		return servicetaxno;
	}

	public void setServicetaxno(String servicetaxno) {
		this.servicetaxno = servicetaxno;
	}

	public Date getVatdate() {
		return vatdate;
	}

	public void setVatdate(Date vatdate) {
		this.vatdate = vatdate;
	}

	public Date getCstdate() {
		return cstdate;
	}

	public void setCstdate(Date cstdate) {
		this.cstdate = cstdate;
	}

	public Date getTindate() {
		return tindate;
	}

	public void setTindate(Date tindate) {
		this.tindate = tindate;
	}

	public Date getServtaxcate() {
		return servtaxcate;
	}

	public void setServtaxcate(Date servtaxcate) {
		this.servtaxcate = servtaxcate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
