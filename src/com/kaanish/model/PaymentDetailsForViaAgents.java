package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Cacheable(false)
public class PaymentDetailsForViaAgents implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	@Column(length = 800)
	private String description;
	@Temporal(TemporalType.DATE)
	private Date paymentDate;
	@Temporal(TemporalType.DATE)
	private Date entryDate;
	private float paidAmount;

	private int uniqueNo;

	private int purchaseEntryId;
	private int purchaseReturnId;
	private int salesEntryId;
	private int salesReturnId;

	private int salesAgentId;
	private int purchaseAgentId;

	private int paymentTypeId;
	private int paymentStatusId;

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

	public float getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(float paidAmount) {
		this.paidAmount = paidAmount;
	}

	public int getUniqueNo() {
		return uniqueNo;
	}

	public void setUniqueNo(int uniqueNo) {
		this.uniqueNo = uniqueNo;
	}

	public int getPurchaseEntryId() {
		return purchaseEntryId;
	}

	public void setPurchaseEntryId(int purchaseEntryId) {
		this.purchaseEntryId = purchaseEntryId;
	}

	public int getPurchaseReturnId() {
		return purchaseReturnId;
	}

	public void setPurchaseReturnId(int purchaseReturnId) {
		this.purchaseReturnId = purchaseReturnId;
	}

	public int getSalesEntryId() {
		return salesEntryId;
	}

	public void setSalesEntryId(int salesEntryId) {
		this.salesEntryId = salesEntryId;
	}

	public int getSalesReturnId() {
		return salesReturnId;
	}

	public void setSalesReturnId(int salesReturnId) {
		this.salesReturnId = salesReturnId;
	}

	public int getPaymentTypeId() {
		return paymentTypeId;
	}

	public void setPaymentTypeId(int paymentTypeId) {
		this.paymentTypeId = paymentTypeId;
	}

	public int getPaymentStatusId() {
		return paymentStatusId;
	}

	public void setPaymentStatusId(int paymentStatusId) {
		this.paymentStatusId = paymentStatusId;
	}

	public int getSalesAgentId() {
		return salesAgentId;
	}

	public void setSalesAgentId(int salesAgentId) {
		this.salesAgentId = salesAgentId;
	}

	public int getPurchaseAgentId() {
		return purchaseAgentId;
	}

	public void setPurchaseAgentId(int purchaseAgentId) {
		this.purchaseAgentId = purchaseAgentId;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
}
