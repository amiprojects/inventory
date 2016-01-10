package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class City implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String cityName;

	@ManyToOne
	@JoinColumn(name = "stateId")
	private State state;

	@OneToMany(mappedBy = "city",cascade=CascadeType.PERSIST, fetch=FetchType.EAGER)
	private List<Vendor> vendors;

	@OneToMany(mappedBy = "city",cascade=CascadeType.PERSIST, fetch=FetchType.EAGER)
	private List<AccountDetails> accountDetails;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	public List<Vendor> getVendors() {
		return vendors;
	}

	public void setVendors(List<Vendor> vendors) {
		this.vendors = vendors;
	}

	public List<AccountDetails> getAccountDetails() {
		return accountDetails;
	}

	public void setAccountDetails(List<AccountDetails> accountDetails) {
		this.accountDetails = accountDetails;
	}

	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\", \"cityName\":\"" + cityName + "\"}";
	}
}