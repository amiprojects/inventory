package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
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
public class PurchaseOrderEntry implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;

	private int challan_no;
	private String challanNumber;
	private int challanSuffix;
	private String vendor_bill_no;
	@Temporal(TemporalType.TIMESTAMP)
	private Date purchaseOrderDate;
	@Temporal(TemporalType.TIMESTAMP)
	private Date entry_date;
	private float transport_cost;
	private float sur_charge;
	private float totalCost;
	private float roundOf;
	private float subTotal;
	private float taxAmount;
	private int agentId;
	private boolean isFlatDiscount;
	private float discountValue;
	private boolean isComplete;

	@OneToMany(mappedBy = "purchaseOrderEntry")
	private List<NotificationDetails> notificationDetails;
	
	@OneToMany(mappedBy = "purchaseOrderEntry", cascade = CascadeType.ALL)
	private List<PurchaseOrderProductdetails> purchaseOrderProductdetails;
	
	@ManyToOne
	@JoinColumn(name = "usersId")
	private Users users;
	
	@ManyToOne
	@JoinColumn(name = "taxGroupID")
	private Tax_Type_Group tax_Type_Group;

	@ManyToOne
	@JoinColumn(name = "billSetupId")
	private Bill_setup bill_setup;

	@ManyToOne
	@JoinColumn(name = "vendorId")
	private Vendor vendor;
	
	@ManyToOne
	@JoinColumn(name = "companyInfoId")
	private CompanyInfo companyInfo;


	@OneToMany(mappedBy = "purchaseOrderEntry", cascade = CascadeType.ALL)
	private List<PaymentDetails> paymentDetails;

	@OneToOne(cascade = CascadeType.ALL, mappedBy = "purchaseOrderEntry")
	private VoucherDetails voucherDetails;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getChallan_no() {
		return challan_no;
	}

	public void setChallan_no(int challan_no) {
		this.challan_no = challan_no;
	}

	public String getChallanNumber() {
		return challanNumber;
	}

	public void setChallanNumber(String challanNumber) {
		this.challanNumber = challanNumber;
	}

	public int getChallanSuffix() {
		return challanSuffix;
	}

	public void setChallanSuffix(int challanSuffix) {
		this.challanSuffix = challanSuffix;
	}

	public String getVendor_bill_no() {
		return vendor_bill_no;
	}

	public void setVendor_bill_no(String vendor_bill_no) {
		this.vendor_bill_no = vendor_bill_no;
	}

	public Date getPurchaseOrderDate() {
		return purchaseOrderDate;
	}

	public void setPurchaseOrderDate(Date purchaseOrderDate) {
		this.purchaseOrderDate = purchaseOrderDate;
	}

	public Date getEntry_date() {
		return entry_date;
	}

	public void setEntry_date(Date entry_date) {
		this.entry_date = entry_date;
	}

	public float getTransport_cost() {
		return transport_cost;
	}

	public void setTransport_cost(float transport_cost) {
		this.transport_cost = transport_cost;
	}

	public float getSur_charge() {
		return sur_charge;
	}

	public void setSur_charge(float sur_charge) {
		this.sur_charge = sur_charge;
	}

	public float getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(float totalCost) {
		this.totalCost = totalCost;
	}

	public float getRoundOf() {
		return roundOf;
	}

	public void setRoundOf(float roundOf) {
		this.roundOf = roundOf;
	}

	public float getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(float subTotal) {
		this.subTotal = subTotal;
	}

	public float getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(float taxAmount) {
		this.taxAmount = taxAmount;
	}

	public int getAgentId() {
		return agentId;
	}

	public void setAgentId(int agentId) {
		this.agentId = agentId;
	}

	public boolean isFlatDiscount() {
		return isFlatDiscount;
	}

	public void setFlatDiscount(boolean isFlatDiscount) {
		this.isFlatDiscount = isFlatDiscount;
	}

	public float getDiscountValue() {
		return discountValue;
	}

	public void setDiscountValue(float discountValue) {
		this.discountValue = discountValue;
	}

	public List<NotificationDetails> getNotificationDetails() {
		return notificationDetails;
	}

	public void setNotificationDetails(List<NotificationDetails> notificationDetails) {
		this.notificationDetails = notificationDetails;
	}

	public List<PurchaseOrderProductdetails> getPurchaseOrderProductdetails() {
		return purchaseOrderProductdetails;
	}

	public void setPurchaseOrderProductdetails(List<PurchaseOrderProductdetails> purchaseOrderProductdetails) {
		this.purchaseOrderProductdetails = purchaseOrderProductdetails;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Tax_Type_Group getTax_Type_Group() {
		return tax_Type_Group;
	}

	public void setTax_Type_Group(Tax_Type_Group tax_Type_Group) {
		this.tax_Type_Group = tax_Type_Group;
	}

	public Bill_setup getBill_setup() {
		return bill_setup;
	}

	public void setBill_setup(Bill_setup bill_setup) {
		this.bill_setup = bill_setup;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	public List<PaymentDetails> getPaymentDetails() {
		return paymentDetails;
	}

	public void setPaymentDetails(List<PaymentDetails> paymentDetails) {
		this.paymentDetails = paymentDetails;
	}

	public VoucherDetails getVoucherDetails() {
		return voucherDetails;
	}

	public void setVoucherDetails(VoucherDetails voucherDetails) {
		this.voucherDetails = voucherDetails;
	}

	public boolean isComplete() {
		return isComplete;
	}

	public void setComplete(boolean isComplete) {
		this.isComplete = isComplete;
	}

	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
	}
	
	

}
