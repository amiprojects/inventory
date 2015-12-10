package com.kaanish.model;

import java.util.Date;
import java.util.List;

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
	private String details;
	private String description;
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;
	private float due;

	@OneToMany(mappedBy = "paymentDetails")
	private List<Purchase_Entry> purchase_Entries;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public float getDue() {
		return due;
	}

	public void setDue(float due) {
		this.due = due;
	}

	public List<Purchase_Entry> getPurchase_Entries() {
		return purchase_Entries;
	}

	public void setPurchase_Entries(List<Purchase_Entry> purchase_Entries) {
		this.purchase_Entries = purchase_Entries;
	}

}
