package com.kaanish.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class PaymentDetails {
	@Id
	@GeneratedValue
	private int id;
	@Column(length = 800)
	private String description;
	@Temporal(TemporalType.TIMESTAMP)
	private Date paymentDate;
	private float totalAmount;
	private float paidAmount;

	@OneToMany(mappedBy = "paymentDetails", cascade = CascadeType.ALL)
	private List<Purchase_Entry> purchase_Entries;

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

	public List<Purchase_Entry> getPurchase_Entries() {
		return purchase_Entries;
	}

	public void setPurchase_Entries(List<Purchase_Entry> purchase_Entries) {
		this.purchase_Entries = purchase_Entries;
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

}
