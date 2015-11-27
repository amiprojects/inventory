package com.kaanish.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Users {
	@Id
	@GeneratedValue
	private int user_id;

	private String name;
	private String ph;

	@OneToMany(mappedBy = "users")
	List<Tax> taxes;
	@OneToMany(mappedBy = "users")
	List<Tax_Type_Group> tax_Type_Groups;
	@OneToMany(mappedBy = "users")
	private List<Vendor> vendors;

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPh() {
		return ph;
	}

	public void setPh(String ph) {
		this.ph = ph;
	}

	public List<Tax> getTaxes() {
		return taxes;
	}

	public void setTaxes(List<Tax> taxes) {
		this.taxes = taxes;
	}

	public List<Tax_Type_Group> getTax_Type_Groups() {
		return tax_Type_Groups;
	}

	public void setTax_Type_Groups(List<Tax_Type_Group> tax_Type_Groups) {
		this.tax_Type_Groups = tax_Type_Groups;
	}

	public List<Vendor> getVendors() {
		return vendors;
	}

	public void setVendors(List<Vendor> vendors) {
		this.vendors = vendors;
	}

}
