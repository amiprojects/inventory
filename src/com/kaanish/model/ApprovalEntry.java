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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Cacheable(false)
public class ApprovalEntry implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	@Column(length = 4000)
	private String description;
	private int challanNo;
	private String challanNumber;
	private int challanSuffix;
	@Temporal(TemporalType.TIMESTAMP)
	private Date entry_Date;
	@Temporal(TemporalType.DATE)
	private Date approvalDate;
	private float totalCost; // grandtotal
	private float roundOf;
	private float subTotal;
	private boolean isMRP;

	// xxxxxxxxxxxxxxxx
	private float surcharge;
	private float transportcCharge;
	private float taxAmount;
	private boolean isFlatDiscount;
	private float discountValue;
	private boolean isFlatProfitAgent;
	private boolean isEfectiveProfit;
	private float agentProfitValue;
	private float agentProfitTotal;
	// xxxxxxxxxxxxxxxx

	@ManyToOne
	@JoinColumn(name = "salesAgentId")
	private Vendor vendor; // vendor

	@OneToMany(mappedBy = "approvalEntry")
	private List<ApprovalReturn> approvalReturn;

	@ManyToOne
	@JoinColumn(name = "customerId")
	private CustomerEntry customer;

	@OneToMany(mappedBy = "approvalEntry", cascade = CascadeType.ALL)
	private List<ApprovalProductDetails> approvalProductDetails;

	@ManyToOne
	@JoinColumn(name = "usersId")
	private Users user;

	// xxxxxxxxxxxxxxxx
	@ManyToOne
	@JoinColumn(name = "taxtypeId")
	private Tax_Type_Group tax_Type_Group;

	// xxxxxxxxxxxxxxxx

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getChallanNo() {
		return challanNo;
	}

	public void setChallanNo(int challanNo) {
		this.challanNo = challanNo;
	}

	public Date getEntry_Date() {
		return entry_Date;
	}

	public void setEntry_Date(Date entry_Date) {
		this.entry_Date = entry_Date;
	}

	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}

	public float getSurcharge() {
		return surcharge;
	}

	public void setSurcharge(float surcharge) {
		this.surcharge = surcharge;
	}

	public float getTransportcCharge() {
		return transportcCharge;
	}

	public void setTransportcCharge(float transportcCharge) {
		this.transportcCharge = transportcCharge;
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

	public boolean isMRP() {
		return isMRP;
	}

	public void setMRP(boolean isMRP) {
		this.isMRP = isMRP;
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

	public boolean isFlatProfitAgent() {
		return isFlatProfitAgent;
	}

	public void setFlatProfitAgent(boolean isFlatProfitAgent) {
		this.isFlatProfitAgent = isFlatProfitAgent;
	}

	public boolean isEfectiveProfit() {
		return isEfectiveProfit;
	}

	public void setEfectiveProfit(boolean isEfectiveProfit) {
		this.isEfectiveProfit = isEfectiveProfit;
	}

	public float getAgentProfitValue() {
		return agentProfitValue;
	}

	public void setAgentProfitValue(float agentProfitValue) {
		this.agentProfitValue = agentProfitValue;
	}

	public float getAgentProfitTotal() {
		return agentProfitTotal;
	}

	public void setAgentProfitTotal(float agentProfitTotal) {
		this.agentProfitTotal = agentProfitTotal;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	public List<ApprovalReturn> getApprovalReturn() {
		return approvalReturn;
	}

	public void setApprovalReturn(List<ApprovalReturn> approvalReturn) {
		this.approvalReturn = approvalReturn;
	}

	public List<ApprovalProductDetails> getApprovalProductDetails() {
		return approvalProductDetails;
	}

	public void setApprovalProductDetails(
			List<ApprovalProductDetails> approvalProductDetails) {
		this.approvalProductDetails = approvalProductDetails;
	}

	public CustomerEntry getCustomer() {
		return customer;
	}

	public void setCustomer(CustomerEntry customer) {
		this.customer = customer;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Tax_Type_Group getTax_Type_Group() {
		return tax_Type_Group;
	}

	public void setTax_Type_Group(Tax_Type_Group tax_Type_Group) {
		this.tax_Type_Group = tax_Type_Group;
	}

}
