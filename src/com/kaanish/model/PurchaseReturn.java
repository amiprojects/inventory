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
public class PurchaseReturn implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;
	@Temporal(TemporalType.DATE)
	private Date returnDate;

	private float totalReCost;
	private float roundOff;
	private int challanNo;
	private String challanNumber;
	private int challanSuffix;
	private String referencePurchaseChallan;

	@OneToMany(mappedBy = "purchaseReturn")
	private List<PurchaseReturnProductDetails> purchaseReturnProductDetails;

	@OneToMany(mappedBy = "purchaseReturn")
	private List<PaymentDetails> paymentDetails;

	@ManyToOne
	@JoinColumn(name = "purchaseEntryID")
	private Purchase_Entry purchaseEntry;
	
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "purchaseReturn")
	private VoucherDetails voucherDetails;

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

	public float getTotalReCost() {
		return totalReCost;
	}

	public void setTotalReCost(float totalReCost) {
		this.totalReCost = totalReCost;
	}

	public float getRoundOff() {
		return roundOff;
	}

	public void setRoundOff(float roundOff) {
		this.roundOff = roundOff;
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

	public String getReferencePurchaseChallan() {
		return referencePurchaseChallan;
	}

	public void setReferencePurchaseChallan(String referencePurchaseChallan) {
		this.referencePurchaseChallan = referencePurchaseChallan;
	}

	public List<PaymentDetails> getPaymentDetails() {
		return paymentDetails;
	}

	public void setPaymentDetails(List<PaymentDetails> paymentDetails) {
		this.paymentDetails = paymentDetails;
	}

	public Purchase_Entry getPurchaseEntry() {
		return purchaseEntry;
	}

	public void setPurchaseEntry(Purchase_Entry purchaseEntry) {
		this.purchaseEntry = purchaseEntry;
	}

	public List<PurchaseReturnProductDetails> getPurchaseReturnProductDetails() {
		return purchaseReturnProductDetails;
	}

	public void setPurchaseReturnProductDetails(
			List<PurchaseReturnProductDetails> purchaseReturnProductDetails) {
		this.purchaseReturnProductDetails = purchaseReturnProductDetails;
	}

	public VoucherDetails getVoucherDetails() {
		return voucherDetails;
	}

	public void setVoucherDetails(VoucherDetails voucherDetails) {
		this.voucherDetails = voucherDetails;
	}

}
