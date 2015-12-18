package com.kaanish.model;

import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
@Cacheable(false)
public class JobAssignmentProducts {
	@Id
	@GeneratedValue
	private int id;
	private int qty;
	private float estimatedCost;

	@OneToMany(mappedBy = "jobAssignmentProducts")
	private List<JobRecievedDetails> jobRecievedDetails;

	@ManyToOne
	@JoinColumn(name = "designerID")
	private Vendor vendor;

	@ManyToOne
	@JoinColumn(name = "jobAsignmentDetailsId")
	private JobAssignmentDetails jobAssignmentDetails;

	@ManyToOne
	@JoinColumn(name = "purchaseProductDetailsId")
	private Purchase_Product_Details purchase_Product_Details;

	@OneToOne@JoinColumn(name="jobStockId")
	private JobStock jobStock;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public float getEstimatedCost() {
		return estimatedCost;
	}

	public void setEstimatedCost(float estimatedCost) {
		this.estimatedCost = estimatedCost;
	}

	public JobAssignmentDetails getJobAssignmentDetails() {
		return jobAssignmentDetails;
	}

	public void setJobAssignmentDetails(JobAssignmentDetails jobAssignmentDetails) {
		this.jobAssignmentDetails = jobAssignmentDetails;
	}

	public Purchase_Product_Details getPurchase_Product_Details() {
		return purchase_Product_Details;
	}

	public void setPurchase_Product_Details(Purchase_Product_Details purchase_Product_Details) {
		this.purchase_Product_Details = purchase_Product_Details;
	}

	public Vendor getVendor() {
		return vendor;
	}

	public void setVendor(Vendor vendor) {
		this.vendor = vendor;
	}

	public List<JobRecievedDetails> getJobRecievedDetails() {
		return jobRecievedDetails;
	}

	public void setJobRecievedDetails(List<JobRecievedDetails> jobRecievedDetails) {
		this.jobRecievedDetails = jobRecievedDetails;
	}

	public JobStock getJobStock() {
		return jobStock;
	}

	public void setJobStock(JobStock jobStock) {
		this.jobStock = jobStock;
	}
}