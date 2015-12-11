package com.kaanish.model;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;

import com.kaanish.util.Base64;

@Entity
public class CompanyInfo {

	@Id@GeneratedValue
	private int id;

	private String compname;
	private String email;
	private String mobile;
	private String phone;
	private String addr;
	private String city;
	private String state;
	@Lob
	private byte[] image;

	private String vatno;
	private String cstno;
	private String tinno;
	private String servicetaxno;
	
	private String vatdate;	
	private String cstdate;
	private String tindate;	
	private String servtaxdate;
	
	public String getImageAsString(){
		if(image.equals(null)){
			return "";
		}else{
			return Base64.encodeBytes(image);
		}
	}

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

	public String getVatdate() {
		return vatdate;
	}

	public void setVatdate(String vatdate) {
		this.vatdate = vatdate;
	}

	public String getCstdate() {
		return cstdate;
	}

	public void setCstdate(String cstdate) {
		this.cstdate = cstdate;
	}

	public String getTindate() {
		return tindate;
	}

	public void setTindate(String tindate) {
		this.tindate = tindate;
	}

	public String getServtaxdate() {
		return servtaxdate;
	}

	public void setServtaxdate(String servtaxdate) {
		this.servtaxdate = servtaxdate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

}
