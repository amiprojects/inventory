package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Cacheable(false)
public class JobAssignmentJobDetails implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;

	private float qty;
	private float remQty;
	private float rate;
	private float ammount;
	@Temporal(TemporalType.TIMESTAMP)
	private Date estimatedCompletionDate;
	
	@ManyToOne
	@JoinColumn(name = "JobPlanJobStockId")
	private JobPlanJobStock jobPlanJobStock;
	
	@ManyToOne
	@JoinColumn(name = "jobPlanId")
	private JobPlan jobPlan;

	@ManyToOne
	@JoinColumn(name = "UOMid")
	private QtyUnit qtyUnit;

	@ManyToOne
	@JoinColumn(name = "jobAsignmentDetailsId")
	private JobAssignmentDetails jobAssignmentDetails;

	@ManyToOne
	@JoinColumn(name = "jobAssignProductId")
	private JobAssignmentProducts assignmentProducts;

	@ManyToOne@JoinColumn(name="jobtypeId")
	private JobTypes jobType;
	
	@ManyToOne
	@JoinColumn(name = "ProductsForDesignCostSheetId")
	private ProductsForDesignCostSheet productsForDesignCostSheet;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getQty() {
		return qty;
	}

	public void setQty(float qty) {
		this.qty = qty;
	}

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

	public float getAmmount() {
		return ammount;
	}

	public void setAmmount(float ammount) {
		this.ammount = ammount;
	}

	public QtyUnit getQtyUnit() {
		return qtyUnit;
	}

	public void setQtyUnit(QtyUnit qtyUnit) {
		this.qtyUnit = qtyUnit;
	}

	public JobAssignmentDetails getJobAssignmentDetails() {
		return jobAssignmentDetails;
	}

	public void setJobAssignmentDetails(JobAssignmentDetails jobAssignmentDetails) {
		this.jobAssignmentDetails = jobAssignmentDetails;
	}

	public JobAssignmentProducts getAssignmentProducts() {
		return assignmentProducts;
	}

	public void setAssignmentProducts(JobAssignmentProducts assignmentProducts) {
		this.assignmentProducts = assignmentProducts;
	}


	public Date getEstimatedCompletionDate() {
		return estimatedCompletionDate;
	}

	public void setEstimatedCompletionDate(Date estimatedCompletionDate) {
		this.estimatedCompletionDate = estimatedCompletionDate;
	}

	public JobTypes getJobType() {
		return jobType;
	}

	public void setJobType(JobTypes jobType) {
		this.jobType = jobType;
	}

	public JobPlan getJobPlan() {
		return jobPlan;
	}

	public void setJobPlan(JobPlan jobPlan) {
		this.jobPlan = jobPlan;
	}

	public ProductsForDesignCostSheet getProductsForDesignCostSheet() {
		return productsForDesignCostSheet;
	}

	public void setProductsForDesignCostSheet(ProductsForDesignCostSheet productsForDesignCostSheet) {
		this.productsForDesignCostSheet = productsForDesignCostSheet;
	}

	public JobPlanJobStock getJobPlanJobStock() {
		return jobPlanJobStock;
	}

	public void setJobPlanJobStock(JobPlanJobStock jobPlanJobStock) {
		this.jobPlanJobStock = jobPlanJobStock;
	}

	public float getRemQty() {
		return remQty;
	}

	public void setRemQty(float remQty) {
		this.remQty = remQty;
	}

}
