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
public class Purchase_Entry implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;

	private int challan_no;
	private String challanNumber;
	private int challanSuffix;
	private String vendor_bill_no;
	@Temporal(TemporalType.DATE)
	private Date purchase_date;
	@Temporal(TemporalType.DATE)
	private Date entry_date;
	private float transport_cost;
	private float sur_charge;
	private float totalCost;
	private float roundOf;
	private float subTotal;
	private float taxAmount;
	private boolean isFlatDiscount;
	private float discountValue;
	private float discountTotal;
	private boolean isFlatProfitAgent;
	private boolean isEfectiveProfit;
	private float agentProfitValue;
	private float agentProfitTotal;

	private int agentId;

	@OneToMany(mappedBy = "purchase_Entry")
	private List<NotificationDetails> notificationDetails;

	@OneToMany(mappedBy = "purchaseEntry")
	private List<PurchaseReturn> purchaseReturn;

	@ManyToOne
	@JoinColumn(name = "purchaseOrderEntryId")
	private PurchaseOrderEntry purchaseOrderEntry;

	@ManyToOne
	@JoinColumn(name = "companyInfoId")
	private CompanyInfo companyInfo;

	@OneToMany(mappedBy = "purchase_Entry", cascade = CascadeType.ALL)
	private List<Purchase_Product_Details> purchase_Product_Details;
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

	@OneToMany(mappedBy = "purchase_Entry", cascade = CascadeType.ALL)
	private List<PaymentDetails> paymentDetails;

	@OneToOne(cascade = CascadeType.ALL, mappedBy = "purchase_Entry")
	private VoucherDetails voucherDetails;

	public int getId() {
		return id;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
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

	public String getVendor_bill_no() {
		return vendor_bill_no;
	}

	public void setVendor_bill_no(String vendor_bill_no) {
		this.vendor_bill_no = vendor_bill_no;
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

	/**
	 * it takes float type surcharge
	 * 
	 * @param sur_charge
	 */

	public void setSur_charge(float sur_charge) {
		this.sur_charge = sur_charge;
	}

	public List<Purchase_Product_Details> getPurchase_Product_Details() {
		return purchase_Product_Details;
	}

	public void setPurchase_Product_Details(
			List<Purchase_Product_Details> purchase_Product_Details) {
		this.purchase_Product_Details = purchase_Product_Details;
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

	public int getChallanSuffix() {
		return challanSuffix;
	}

	public void setChallanSuffix(int challanSuffix) {
		this.challanSuffix = challanSuffix;
	}

	public List<PaymentDetails> getPaymentDetails() {
		return paymentDetails;
	}

	public void setPaymentDetails(List<PaymentDetails> paymentDetails) {
		this.paymentDetails = paymentDetails;
	}

	public String getChallanNumber() {
		return challanNumber;
	}

	public void setChallanNumber(String challanNumber) {
		this.challanNumber = challanNumber;
	}

	public float getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(float totalCost) {
		this.totalCost = totalCost;
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

	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
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

	public List<PurchaseReturn> getPurchaseReturn() {
		return purchaseReturn;
	}

	public void setPurchaseReturn(List<PurchaseReturn> purchaseReturn) {
		this.purchaseReturn = purchaseReturn;
	}

	public VoucherDetails getVoucherDetails() {
		return voucherDetails;
	}

	public void setVoucherDetails(VoucherDetails voucherDetails) {
		this.voucherDetails = voucherDetails;
	}

	public List<NotificationDetails> getNotificationDetails() {
		return notificationDetails;
	}

	public void setNotificationDetails(
			List<NotificationDetails> notificationDetails) {
		this.notificationDetails = notificationDetails;
	}

	public PurchaseOrderEntry getPurchaseOrderEntry() {
		return purchaseOrderEntry;
	}

	public void setPurchaseOrderEntry(PurchaseOrderEntry purchaseOrderEntry) {
		this.purchaseOrderEntry = purchaseOrderEntry;
	}

	public Date getPurchase_date() {
		return purchase_date;
	}

	public void setPurchase_date(Date purchase_date) {
		this.purchase_date = purchase_date;
	}

	public boolean isFlatProfitAgent() {
		return isFlatProfitAgent;
	}

	public void setFlatProfitAgent(boolean isFlatProfitAgent) {
		this.isFlatProfitAgent = isFlatProfitAgent;
	}

	public float getAgentProfitValue() {
		return agentProfitValue;
	}

	public void setAgentProfitValue(float agentProfitValue) {
		this.agentProfitValue = agentProfitValue;
	}

	public boolean isEfectiveProfit() {
		return isEfectiveProfit;
	}

	public void setEfectiveProfit(boolean isEfectiveProfit) {
		this.isEfectiveProfit = isEfectiveProfit;
	}

	public float getAgentProfitTotal() {
		return agentProfitTotal;
	}

	public void setAgentProfitTotal(float agentProfitTotal) {
		this.agentProfitTotal = agentProfitTotal;
	}

	public float getDiscountTotal() {
		return discountTotal;
	}

	public void setDiscountTotal(float discountTotal) {
		this.discountTotal = discountTotal;
	}

}
