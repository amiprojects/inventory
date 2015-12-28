package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Cacheable(false)
public class JobRecievedDetails implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	private int id;
	private int qtyRecieved;
	@Temporal(TemporalType.TIMESTAMP)
	private Date recievingDate;

	@ManyToOne
	@JoinColumn(name = "jobAssignmentProductsId")
	private JobAssignmentProducts jobAssignmentProducts;

	@OneToOne
	private Purchase_Product_Details purchase_Product_Details;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQtyRecieved() {
		return qtyRecieved;
	}

	public void setQtyRecieved(int qtyRecieved) {
		this.qtyRecieved = qtyRecieved;
	}

	public Date getRecievingDate() {
		return recievingDate;
	}

	public void setRecievingDate(Date recievingDate) {
		this.recievingDate = recievingDate;
	}

	public JobAssignmentProducts getJobAssignmentProducts() {
		return jobAssignmentProducts;
	}

	public void setJobAssignmentProducts(JobAssignmentProducts jobAssignmentProducts) {
		this.jobAssignmentProducts = jobAssignmentProducts;
	}

	public Purchase_Product_Details getPurchase_Product_Details() {
		return purchase_Product_Details;
	}

	public void setPurchase_Product_Details(Purchase_Product_Details purchase_Product_Details) {
		this.purchase_Product_Details = purchase_Product_Details;
	}

}
