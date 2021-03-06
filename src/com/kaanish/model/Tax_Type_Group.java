package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class Tax_Type_Group implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String name;
	private boolean isActive;

	@ManyToMany
	private List<Tax> taxes;
	@ManyToOne
	@JoinColumn(name = "userId")
	private Users users;
	@OneToMany(mappedBy = "tax_Type_Group", cascade = CascadeType.PERSIST)
	private List<AccountDetails> accountDetails;
	@OneToMany(mappedBy = "tax_Type_Group")
	private List<SalesEntry> salesEntry;

	@OneToMany(mappedBy = "tax_Type_Group")
	private List<ApprovalEntry> approvalEntries;

	@OneToMany(mappedBy = "tax_Type_Group")
	private List<PurchaseOrderEntry> purchaseOrderEntry;

	@OneToMany(mappedBy = "tax_Type_Group")
	private List<Purchase_Entry> purchase_Entries;

	public float getTotalTaxValue() {
		float taxtot = 0;
		for (Tax tax : taxes) {
			taxtot = taxtot + tax.getValue();
		}
		return taxtot;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Tax> getTaxes() {
		return taxes;
	}

	public void setTaxes(List<Tax> taxes) {
		this.taxes = taxes;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public List<AccountDetails> getAccountDetails() {
		return accountDetails;
	}

	public void setAccountDetails(List<AccountDetails> accountDetails) {
		this.accountDetails = accountDetails;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Purchase_Entry> getPurchase_Entries() {
		return purchase_Entries;
	}

	public void setPurchase_Entries(List<Purchase_Entry> purchase_Entries) {
		this.purchase_Entries = purchase_Entries;
	}

	@Override
	public String toString() {
		return "{\"name\":\"" + name + "\", " + "\"id\":\"" + id + "\", "
				+ "\"taxtot\":\"" + getTotalTaxValue() + "\"}";
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public List<SalesEntry> getSalesEntry() {
		return salesEntry;
	}

	public void setSalesEntry(List<SalesEntry> salesEntry) {
		this.salesEntry = salesEntry;
	}

	public List<PurchaseOrderEntry> getPurchaseOrderEntry() {
		return purchaseOrderEntry;
	}

	public void setPurchaseOrderEntry(
			List<PurchaseOrderEntry> purchaseOrderEntry) {
		this.purchaseOrderEntry = purchaseOrderEntry;
	}

	public List<ApprovalEntry> getApprovalEntries() {
		return approvalEntries;
	}

	public void setApprovalEntries(List<ApprovalEntry> approvalEntries) {
		this.approvalEntries = approvalEntries;
	}

}
