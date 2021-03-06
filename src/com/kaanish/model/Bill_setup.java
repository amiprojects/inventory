package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class Bill_setup implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;

	private String challanNumber;
	private String sufix;
	private String billType;
	private String finantialYear;
	private String month;
	private String companyInitial;

	@ManyToOne
	@JoinColumn(name = "companyInfoId")
	private CompanyInfo companyInfo;

	@OneToMany(mappedBy = "bill_setup")
	private List<Purchase_Entry> purchase_Entries;

	@OneToMany(mappedBy = "bill_setup")
	private List<PurchaseOrderEntry> purchaseOrderEntry;

	
	@OneToMany(mappedBy = "bill_setup")
	private List<SalesEntry> salesEntry;

	public List<Purchase_Entry> getPurchase_Entries() {
		return purchase_Entries;
	}

	public void setPurchase_Entries(List<Purchase_Entry> purchase_Entries) {
		this.purchase_Entries = purchase_Entries;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getChallanNumber() {
		return challanNumber;
	}

	public void setChallanNumber(String challanNumber) {
		this.challanNumber = challanNumber;
	}

	public String getSufix() {
		return sufix;
	}

	public void setSufix(String sufix) {
		this.sufix = sufix;
	}

	public String getBillType() {
		return billType;
	}

	public void setBillType(String billType) {
		this.billType = billType;
	}

	public String getFinantialYear() {
		return finantialYear;
	}

	public void setFinantialYear(String finantialYear) {
		this.finantialYear = finantialYear;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getCompanyInitial() {
		return companyInitial;
	}

	public void setCompanyInitial(String companyInitial) {
		this.companyInitial = companyInitial;
	}

	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
	}

	public List<PurchaseOrderEntry> getPurchaseOrderEntry() {
		return purchaseOrderEntry;
	}

	public void setPurchaseOrderEntry(List<PurchaseOrderEntry> purchaseOrderEntry) {
		this.purchaseOrderEntry = purchaseOrderEntry;
	}

	public List<SalesEntry> getSalesEntry() {
		return salesEntry;
	}

	public void setSalesEntry(List<SalesEntry> salesEntry) {
		this.salesEntry = salesEntry;
	}

}
