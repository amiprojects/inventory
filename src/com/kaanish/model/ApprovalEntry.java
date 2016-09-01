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
	@Temporal(TemporalType.TIMESTAMP)
	private Date entry_Date;
	@Temporal(TemporalType.DATE)
	private Date sales_date;
	private float surcharge;
	private float transportcCharge;
	private float totalCost; // grandtotal
	private float roundOf;
	private float subTotal;
	private float taxAmount;
	private String challanNumber;
	private int challanSuffix;
	private boolean isMRP;
	private boolean isFlatDiscount;
	private float discountValue;
	private boolean isFlatProfitAgent;
	private boolean isEfectiveProfit;
	private float agentProfitValue;
	private float agentProfitTotal;

	private int salesAgentId; // vendor

	@OneToMany(mappedBy = "approvalEntry")
	private List<ApprovalReturn> approvalReturn;
	private int customerId;
	@OneToMany(mappedBy = "approvalEntry", cascade = CascadeType.ALL)
	private List<ApprovalProductDetails> approvalProductDetails;
	private int taxtypeId;
	private String usersId;
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
	public Date getSales_date() {
		return sales_date;
	}
	public void setSales_date(Date sales_date) {
		this.sales_date = sales_date;
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
	public int getSalesAgentId() {
		return salesAgentId;
	}
	public void setSalesAgentId(int salesAgentId) {
		this.salesAgentId = salesAgentId;
	}
	public List<ApprovalReturn> getApprovalReturn() {
		return approvalReturn;
	}
	public void setApprovalReturn(List<ApprovalReturn> approvalReturn) {
		this.approvalReturn = approvalReturn;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public List<ApprovalProductDetails> getApprovalProductDetails() {
		return approvalProductDetails;
	}
	public void setApprovalProductDetails(
			List<ApprovalProductDetails> approvalProductDetails) {
		this.approvalProductDetails = approvalProductDetails;
	}
	public int getTaxtypeId() {
		return taxtypeId;
	}
	public void setTaxtypeId(int taxtypeId) {
		this.taxtypeId = taxtypeId;
	}
	public String getUsersId() {
		return usersId;
	}
	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}

}
