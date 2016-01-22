package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Cacheable(false)
public class PaymentDetails implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	@Column(length = 800)
	private String description;
	@Temporal(TemporalType.TIMESTAMP)
	private Date paymentDate;
	private float totalAmount;
	private float paidAmount;
	
	@ManyToOne
	@JoinColumn(name = "purchaseReturnId")
	private PurchaseReturn purchaseReturn;

	@ManyToOne
	@JoinColumn(name = "purchaseEntryId")
	private Purchase_Entry purchase_Entry;

	@ManyToOne
	@JoinColumn(name = "salesEntryId")
	private SalesEntry salesEntry;
	
	public SalesReturn getSalesReturn() {
		return salesReturn;
	}

	public void setSalesReturn(SalesReturn salesReturn) {
		this.salesReturn = salesReturn;
	}

	@ManyToOne
	@JoinColumn(name = "salesReEntryId")
	private SalesReturn salesReturn;

	@ManyToOne
	@JoinColumn(name = "paymentTypeId")
	private PaymentType paymentType;

	@ManyToOne
	@JoinColumn(name = "paymentStatusId")
	private PaymentStatus paymentStatus;

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

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	public float getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(float paidAmount) {
		this.paidAmount = paidAmount;
	}

	public Purchase_Entry getPurchase_Entry() {
		return purchase_Entry;
	}

	public void setPurchase_Entry(Purchase_Entry purchase_Entry) {
		this.purchase_Entry = purchase_Entry;
	}

	public PaymentType getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}

	public PaymentStatus getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(PaymentStatus paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public SalesEntry getSalesEntry() {
		return salesEntry;
	}

	public void setSalesEntry(SalesEntry salesEntry) {
		this.salesEntry = salesEntry;
	}

	public PurchaseReturn getPurchaseReturn() {
		return purchaseReturn;
	}

	public void setPurchaseReturn(PurchaseReturn purchaseReturn) {
		this.purchaseReturn = purchaseReturn;
	}

}
