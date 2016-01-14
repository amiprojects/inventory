package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Cacheable;
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
public class SalesReturn implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	/* private int qtyReturn; */
	@Temporal(TemporalType.TIMESTAMP)
	private Date returnDate;
	/* private String fault; */

	private float totalReCost;
	private float roundOff;
	private int challanNo;
	private String challanNumber;
	private int challanSuffix;
	private String referenceSalesChallan;

	@OneToMany(mappedBy = "salesReturn")
	private List<SalesProductReturnDetail> SalesProductReturnDetail;

	@OneToMany(mappedBy = "salesReturn")
	private List<PaymentDetails> paymentDetails;
	
	@ManyToOne
	@JoinColumn(name = "salesEntryID")
	private SalesEntry salesEntry;
	

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
		return SalesProductReturnDetail;
	}

	public void setSalesProductReturnDetail(List<SalesProductReturnDetail> salesProductReturnDetail) {
		SalesProductReturnDetail = salesProductReturnDetail;
	}

	public SalesEntry getSalesEntry() {
		return salesEntry;
	}

	public void setSalesEntry(SalesEntry salesEntry) {
		this.salesEntry = salesEntry;
	}

}
