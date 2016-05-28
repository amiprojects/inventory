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
public class SalesReturn implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;

	@Temporal(TemporalType.DATE)
	private Date returnDate;

	private float totalReCost; //grandtotal
	private float roundOff;
	private int challanNo;
	private String challanNumber;
	private int challanSuffix;
	private String referenceSalesChallan;

	private float retAgentProfitTotal;

	@OneToMany(mappedBy = "salesReturn")
	private List<SalesProductReturnDetail> salesProductReturnDetail;

	@OneToMany(mappedBy = "salesReturn")
	private List<PaymentDetails> paymentDetails;

	@ManyToOne
	@JoinColumn(name = "salesEntryID")
	private SalesEntry salesEntry;

	@OneToOne(cascade = CascadeType.ALL, mappedBy = "salesReturn")
	private VoucherDetails VoucherDetails;

	@ManyToOne
	@JoinColumn(name = "usersId")
	private Users users;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public float getRoundOff() {
		return roundOff;
	}

	public List<PaymentDetails> getPaymentDetails() {
		return paymentDetails;
	}

	public void setPaymentDetails(List<PaymentDetails> paymentDetails) {
		this.paymentDetails = paymentDetails;
	}

	public void setRoundOff(float roundOff) {
		this.roundOff = roundOff;
	}

	public float getTotalReCost() {
		return totalReCost;
	}

	public void setTotalReCost(float totalReCost) {
		this.totalReCost = totalReCost;
	}

	public int getChallanNo() {
		return challanNo;
	}

	public void setChallanNo(int challanNo) {
		this.challanNo = challanNo;
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

	public String getReferenceSalesChallan() {
		return referenceSalesChallan;
	}

	public void setReferenceSalesChallan(String referenceSalesChallan) {
		this.referenceSalesChallan = referenceSalesChallan;
	}

	public List<SalesProductReturnDetail> getSalesProductReturnDetail() {
		return salesProductReturnDetail;
	}

	public void setSalesProductReturnDetail(
			List<SalesProductReturnDetail> salesProductReturnDetail) {
		this.salesProductReturnDetail = salesProductReturnDetail;
	}

	public SalesEntry getSalesEntry() {
		return salesEntry;
	}

	public void setSalesEntry(SalesEntry salesEntry) {
		this.salesEntry = salesEntry;
	}

	public VoucherDetails getVoucherDetails() {
		return VoucherDetails;
	}

	public void setVoucherDetails(VoucherDetails voucherDetails) {
		VoucherDetails = voucherDetails;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public float getRetAgentProfitTotal() {
		return retAgentProfitTotal;
	}

	public void setRetAgentProfitTotal(float retAgentProfitTotal) {
		this.retAgentProfitTotal = retAgentProfitTotal;
	}
}
