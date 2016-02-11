package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class Users implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	private String userId;

	private String name;
	private String ph;
	private String password;

	@OneToMany(mappedBy = "users")
	private
	List<SecurityAnswers> securityAnswers;

	@OneToMany(mappedBy = "users")
	private List<NotificationView> notificationView;
	

	@ManyToOne
	@JoinColumn(name = "companyInfoId")
	private CompanyInfo companyInfo;

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
	
	@OneToMany(mappedBy = "users")
	private List<PurchaseOrderEntry> purchaseOrderEntry;
	
	@OneToMany(mappedBy = "users")
	private List<VoucherDetails> voucherDetails;
	
	@OneToMany(mappedBy = "users")
	private List<SalesReturn> SalesReturn;
	

	@ManyToOne
	@JoinColumn(name = "userGroupId")
	private UserGroup userGroup;

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

	public UserGroup getUserGroup() {
		return userGroup;
	}

	public void setUserGroup(UserGroup userGroup) {
		this.userGroup = userGroup;
	}

	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
	}

	public List<SecurityAnswers> getSecurityAnswers() {
		return securityAnswers;
	}

	public void setSecurityAnswers(List<SecurityAnswers> securityAnswers) {
		this.securityAnswers = securityAnswers;
	}
	public List<VoucherDetails> getVoucherDetails() {
		return voucherDetails;
	}

	public void setVoucherDetails(List<VoucherDetails> voucherDetails) {
		this.voucherDetails = voucherDetails;
	}

	public List<SalesReturn> getSalesReturn() {
		return SalesReturn;
	}

	public void setSalesReturn(List<SalesReturn> salesReturn) {
		SalesReturn = salesReturn;
	}

	public List<NotificationView> getNotificationView() {
		return notificationView;
	}

	public void setNotificationView(List<NotificationView> notificationView) {
		this.notificationView = notificationView;
	}

	public List<PurchaseOrderEntry> getPurchaseOrderEntry() {
		return purchaseOrderEntry;
	}

	public void setPurchaseOrderEntry(List<PurchaseOrderEntry> purchaseOrderEntry) {
		this.purchaseOrderEntry = purchaseOrderEntry;
	}
	
}
