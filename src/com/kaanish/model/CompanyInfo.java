package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;

import com.kaanish.util.Base64;

@Entity
@Cacheable(false)
public class CompanyInfo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;

	private String compname;
	private String email;
	private String mobile;
	private String phone;
	private String addr;
	private String city;
	private String state;
	private String country1;
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

	private int changeCount;
	
	private String barcodeHeader;
	private boolean isMRPbarcode;

	@OneToMany(mappedBy = "companyInfo")
	private List<Purchase_Product_Details> purchase_Product_Details;
	
	@OneToMany(mappedBy = "companyInfo")
	private List<PurchaseOrderProductdetails> purchaseOrderProductdetails;

	@OneToMany(mappedBy = "companyInfo")
	private List<Users> users;

	@OneToMany(mappedBy = "companyInfo")
	private List<JobAssignmentDetails> jobAssignmentDetails;

	@OneToMany(mappedBy = "companyInfo")
	private List<Purchase_Entry> purchase_Entry;

	@OneToMany(mappedBy = "companyInfo")
	private List<SalesEntry> salesEntry;
	
	@OneToMany(mappedBy = "companyInfo")
	private List<PurchaseOrderEntry> purchaseOrderEntry;

	@OneToMany(mappedBy = "companyInfo")
	private List<RawMaterialsStock> rawMaterialsStocks;

	@OneToMany(mappedBy = "companyInfo")
	private List<ReadyGoodsStock> readyGoodsStocks;

	@OneToMany(mappedBy = "companyInfo")
	private List<Bill_setup> bill_setup;

	@OneToMany(mappedBy = "companyInfo")
	private List<UserGroup> userGroup;

	public String getImageAsString() {
		if (image == null) {
			return "";
		} else {
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

	public String getCountry1() {
		return country1;
	}

	public void setCountry1(String country1) {
		this.country1 = country1;
	}

	public int getChangeCount() {
		return changeCount;
	}

	public void setChangeCount(int changeCount) {
		this.changeCount = changeCount;
	}

	public List<JobAssignmentDetails> getJobAssignmentDetails() {
		return jobAssignmentDetails;
	}

	public void setJobAssignmentDetails(
			List<JobAssignmentDetails> jobAssignmentDetails) {
		this.jobAssignmentDetails = jobAssignmentDetails;
	}

	public List<Purchase_Entry> getPurchase_Entry() {
		return purchase_Entry;
	}

	public void setPurchase_Entry(List<Purchase_Entry> purchase_Entry) {
		this.purchase_Entry = purchase_Entry;
	}

	public List<SalesEntry> getSalesEntry() {
		return salesEntry;
	}

	public void setSalesEntry(List<SalesEntry> salesEntry) {
		this.salesEntry = salesEntry;
	}

	public List<Users> getUsers() {
		return users;
	}

	public void setUsers(List<Users> users) {
		this.users = users;
	}

	public List<RawMaterialsStock> getRawMaterialsStocks() {
		return rawMaterialsStocks;
	}

	public void setRawMaterialsStocks(List<RawMaterialsStock> rawMaterialsStocks) {
		this.rawMaterialsStocks = rawMaterialsStocks;
	}

	public List<ReadyGoodsStock> getReadyGoodsStocks() {
		return readyGoodsStocks;
	}

	public void setReadyGoodsStocks(List<ReadyGoodsStock> readyGoodsStocks) {
		this.readyGoodsStocks = readyGoodsStocks;
	}

	public List<Bill_setup> getBill_setup() {
		return bill_setup;
	}

	public void setBill_setup(List<Bill_setup> bill_setup) {
		this.bill_setup = bill_setup;
	}

	public List<UserGroup> getUserGroup() {
		return userGroup;
	}

	public void setUserGroup(List<UserGroup> userGroup) {
		this.userGroup = userGroup;
	}

	public List<Purchase_Product_Details> getPurchase_Product_Details() {
		return purchase_Product_Details;
	}

	public void setPurchase_Product_Details(List<Purchase_Product_Details> purchase_Product_Details) {
		this.purchase_Product_Details = purchase_Product_Details;
	}

	public List<PurchaseOrderEntry> getPurchaseOrderEntry() {
		return purchaseOrderEntry;
	}

	public void setPurchaseOrderEntry(List<PurchaseOrderEntry> purchaseOrderEntry) {
		this.purchaseOrderEntry = purchaseOrderEntry;
	}

	public List<PurchaseOrderProductdetails> getPurchaseOrderProductdetails() {
		return purchaseOrderProductdetails;
	}

	public void setPurchaseOrderProductdetails(List<PurchaseOrderProductdetails> purchaseOrderProductdetails) {
		this.purchaseOrderProductdetails = purchaseOrderProductdetails;
	}

	public String getBarcodeHeader() {
		return barcodeHeader;
	}

	public void setBarcodeHeader(String barcodeHeader) {
		this.barcodeHeader = barcodeHeader;
	}

	public boolean isMRPbarcode() {
		return isMRPbarcode;
	}

	public void setMRPbarcode(boolean isMRPbarcode) {
		this.isMRPbarcode = isMRPbarcode;
	}

}
