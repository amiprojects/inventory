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

	@Id@GeneratedValue
	private int id;
	private String name;
	private String mobile;
	private String email;
	private String address;
	
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
	
}
