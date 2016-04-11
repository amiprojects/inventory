package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Cacheable(false)
public class Vendor implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String companyName;
	private String ph1;
	private String ph2;
	@Column(length = 800)
	private String address;
	private String pinCode;
	private String email;
	private String aliseName;
	@Temporal(TemporalType.DATE)
	private Date lastModifiedDate;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "vendor")
	private List<JobAssignmentDetails> jobAssignmentDetails;

	@OneToMany(mappedBy = "vendor")
	private List<JobAssignmentProducts> jobAssignmentProducts;

	@ManyToOne
	@JoinColumn(name = "venderTypeId")
	private VendorType vendorType;

	@ManyToOne
	@JoinColumn(name = "cityId")
	private City city;

	@ManyToOne
	@JoinColumn(name = "userId")
	private Users users;

	@OneToMany(mappedBy = "vendor")
	private List<Purchase_Entry> purchaseEntry;

	@OneToMany(mappedBy = "vendor")
	private List<PurchaseOrderEntry> purchaseOrderEntry;

	@OneToMany(mappedBy = "vendor")
	private List<SalesEntry> salesEntry;

	@OneToMany(mappedBy = "vendor")
	private List<AccountDetails> accountDetails;

	@OneToOne(cascade = CascadeType.ALL, mappedBy = "vendor")
	private VoucherAssign voucherAssign;

	@OneToMany(mappedBy = "vendor")
	private List<SampleDesignCostSheet> sampleDesignCostSheets;

	@OneToMany(mappedBy = "vendor")
	private List<JobsForDesignCostSheet> jobsForDesignCostSheets;

	public float getTotPurchase() {
		float totPurchase = 0F;
		float totPur = 0F;
		float totRet = 0F;
		for (Purchase_Entry purEntry : getPurchaseEntry()) {
			for (Purchase_Product_Details ppd : purEntry
					.getPurchase_Product_Details()) {
				totPur = totPur + ppd.getQuantity() * ppd.getCost();
				totRet = totRet + ppd.getTotalReturningQty() * ppd.getCost();
			}
		}
		totPurchase = totPurchase + totPur - totRet;
		return totPurchase;
	}

	public float getTotSale() {
		float totSale = 0F;
		float totPur = 0F;
		float totRet = 0F;
		for (SalesEntry salesEntry : salesEntry) {
			for (SalesProductDetails spd : salesEntry.getSalesProductDetails()) {
				totPur = totPur + spd.getQuantity() * spd.getSalesPrice();
				totRet = totRet + spd.getSalesReQty() * spd.getSalesPrice();
			}
		}
		totSale = totSale + totPur - totRet;
		return totSale;
	}

	public List<Purchase_Entry> getPurchaseEntry() {
		return purchaseEntry;
	}

	public void setPurchaseEntry(List<Purchase_Entry> purchaseEntry) {
		this.purchaseEntry = purchaseEntry;
	}

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

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getPh1() {
		return ph1;
	}

	public void setPh1(String ph1) {
		this.ph1 = ph1;
	}

	public String getPh2() {
		return ph2;
	}

	public void setPh2(String ph2) {
		this.ph2 = ph2;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAliseName() {
		return aliseName;
	}

	public void setAliseName(String aliseName) {
		this.aliseName = aliseName;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public VendorType getVendorType() {
		return vendorType;
	}

	public void setVendorType(VendorType vendorType) {
		this.vendorType = vendorType;
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
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

	public List<JobAssignmentDetails> getJobAssignmentDetails() {
		return jobAssignmentDetails;
	}

	public void setJobAssignmentDetails(
			List<JobAssignmentDetails> jobAssignmentDetails) {
		this.jobAssignmentDetails = jobAssignmentDetails;
	}

	public List<JobAssignmentProducts> getJobAssignmentProducts() {
		return jobAssignmentProducts;
	}

	public void setJobAssignmentProducts(
			List<JobAssignmentProducts> jobAssignmentProducts) {
		this.jobAssignmentProducts = jobAssignmentProducts;
	}

	public List<SalesEntry> getSalesEntry() {
		return salesEntry;
	}

	public void setSalesEntry(List<SalesEntry> salesEntry) {
		this.salesEntry = salesEntry;
	}

	@Override
	public String toString() {
		String cityName;
		if (city != null) {
			cityName = city.getCityName();
		} else {
			cityName = "NA";
		}
		if (voucherAssign != null) {
			if (voucherAssign.getVoucherDetails().size() != 0) {
				return "{\"id\":\""
						+ id
						+ "\", "
						+ "\"currentCreditNote\":\""
						+ voucherAssign
								.getVoucherDetails()
								.get(voucherAssign.getVoucherDetails().size() - 1)
								.getTotalCreditNote() + "\", " + "\"name\":\""
						+ name + "\", " + "\"companyName\":\"" + companyName
						+ "\", " + "\"ph1\":\"" + ph1 + "\", " + "\"ph2\":\""
						+ ph2 + "\", " + "\"address\":\"" + address + "\", "
						+ "\"pinCode\":\"" + pinCode + "\", " + "\"email\":\""
						+ email + "\", " + "\"city\":\"" + cityName + "\"}";
			} else {
				return "{\"id\":\"" + id + "\", " + "\"currentCreditNote\":\""
						+ 0 + "\", " + "\"name\":\"" + name + "\", "
						+ "\"companyName\":\"" + companyName + "\", "
						+ "\"ph1\":\"" + ph1 + "\", " + "\"ph2\":\"" + ph2
						+ "\", " + "\"address\":\"" + address + "\", "
						+ "\"pinCode\":\"" + pinCode + "\", " + "\"email\":\""
						+ email + "\", " + "\"city\":\"" + cityName + "\"}";
			}
		} else {
			return "{\"id\":\"" + id + "\", " + "\"currentCreditNote\":\"" + 0
					+ "\", " + "\"name\":\"" + name + "\", "
					+ "\"companyName\":\"" + companyName + "\", "
					+ "\"ph1\":\"" + ph1 + "\", " + "\"ph2\":\"" + ph2 + "\", "
					+ "\"address\":\"" + address + "\", " + "\"pinCode\":\""
					+ pinCode + "\", " + "\"email\":\"" + email + "\", "
					+ "\"city\":\"" + cityName + "\"}";
		}

	}

	public List<SampleDesignCostSheet> getSampleDesignCostSheets() {
		return sampleDesignCostSheets;
	}

	public void setSampleDesignCostSheets(
			List<SampleDesignCostSheet> sampleDesignCostSheets) {
		this.sampleDesignCostSheets = sampleDesignCostSheets;
	}

	public List<JobsForDesignCostSheet> getJobsForDesignCostSheets() {
		return jobsForDesignCostSheets;
	}

	public void setJobsForDesignCostSheets(
			List<JobsForDesignCostSheet> jobsForDesignCostSheets) {
		this.jobsForDesignCostSheets = jobsForDesignCostSheets;
	}

	public VoucherAssign getVoucherAssign() {
		return voucherAssign;
	}

	public void setVoucherAssign(VoucherAssign voucherAssign) {
		this.voucherAssign = voucherAssign;
	}

	public List<PurchaseOrderEntry> getPurchaseOrderEntry() {
		return purchaseOrderEntry;
	}

	public void setPurchaseOrderEntry(
			List<PurchaseOrderEntry> purchaseOrderEntry) {
		this.purchaseOrderEntry = purchaseOrderEntry;
	}

}
