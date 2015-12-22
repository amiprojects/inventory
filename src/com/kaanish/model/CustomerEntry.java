package com.kaanish.model;

import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class CustomerEntry {

	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String mobile;
	private String vat_cst_no;
	private String address;
	private String city;

	@OneToMany(mappedBy = "customer")
	private List<SalesEntry> salesEntries;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<SalesEntry> getSalesEntries() {
		return salesEntries;
	}

	public void setSalesEntries(List<SalesEntry> salesEntries) {
		this.salesEntries = salesEntries;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getVat_cst_no() {
		return vat_cst_no;
	}

	public void setVat_cst_no(String vat_cst_no) {
		this.vat_cst_no = vat_cst_no;
	}

}
