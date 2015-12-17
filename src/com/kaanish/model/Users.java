package com.kaanish.model;

import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class Users {
	@Id
	private String userId;

	private String name;
	private String ph;

	private String password;

	@OneToMany(mappedBy = "users")
	List<Tax> taxes;
	@OneToMany(mappedBy = "users")
	List<Tax_Type_Group> tax_Type_Groups;
	@OneToMany(mappedBy = "users")
	private List<Vendor> vendors;
	@OneToMany(mappedBy = "users")
	private List<AccountDetails> accountDetails;
	@OneToMany(mappedBy = "users")
	private List<Purchase_Entry> purchase_Entries;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<AccountDetails> getAccountDetails() {
		return accountDetails;
	}

	public void setAccountDetails(List<AccountDetails> accountDetails) {
		this.accountDetails = accountDetails;
	}

	public List<Purchase_Entry> getPurchase_Entries() {
		return purchase_Entries;
	}

	public void setPurchase_Entries(List<Purchase_Entry> purchase_Entries) {
		this.purchase_Entries = purchase_Entries;
	}

}
