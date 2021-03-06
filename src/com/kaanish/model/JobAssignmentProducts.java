package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
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
public class JobAssignmentProducts implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private float qty;
	private float remaninQty;
	private float totalJobCost;	
	private float estimatedCost;//total amount of product
	
	@Column(length = 800)
	private String workDescription;//old concept	
	@Temporal(TemporalType.TIMESTAMP)
	private Date estimatedCompletionDate;//old concept
	

	@OneToMany(mappedBy = "jobAssignmentProducts")
	private List<JobRecievedDetails> jobRecievedDetails;	

	@ManyToOne
	@JoinColumn(name = "jobAsignmentDetailsId")
	private JobAssignmentDetails jobAssignmentDetails;
	
	@ManyToOne
	@JoinColumn(name = "ProductsForDesignCostSheetId")
	private ProductsForDesignCostSheet productsForDesignCostSheet;
	
	@ManyToOne
	@JoinColumn(name = "jobPlanId")
	private JobPlan jobPlan;
	
	@ManyToOne
	@JoinColumn(name = "jobPlanProductsId")
	private JobPlanProducts jobPlanProducts;	

	@OneToMany(mappedBy="jobAssignmentProducts",cascade=CascadeType.ALL)
	private List<JobPlanProductStock> jobPlanProductStock;
	
	@OneToMany(mappedBy="assignmentProducts",cascade=CascadeType.ALL)
	private List<JobAssignmentJobDetails> jobAssignmentJobDetails;	
	
	@ManyToOne
	@JoinColumn(name = "designerID")
	private Vendor vendor;//old concept

	@OneToOne
	@JoinColumn(name = "jobStockId")
	private JobStock jobStock;//old concept

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public void setJobAssignmentDetails(
			JobAssignmentDetails jobAssignmentDetails) {
		this.jobAssignmentDetails = jobAssignmentDetails;
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

	public void setJobRecievedDetails(
			List<JobRecievedDetails> jobRecievedDetails) {
		this.jobRecievedDetails = jobRecievedDetails;
	}

	public JobStock getJobStock() {
		return jobStock;
	}

	public void setJobStock(JobStock jobStock) {
		this.jobStock = jobStock;
	}

	public String getWorkDescription() {
		return workDescription;
	}

	public void setWorkDescription(String workDescription) {
		this.workDescription = workDescription;
	}

	public List<JobAssignmentJobDetails> getJobAssignmentJobDetails() {
		return jobAssignmentJobDetails;
	}

	public void setJobAssignmentJobDetails(List<JobAssignmentJobDetails> jobAssignmentJobDetails) {
		this.jobAssignmentJobDetails = jobAssignmentJobDetails;
	}


	public Date getEstimatedCompletionDate() {
		return estimatedCompletionDate;
	}

	public void setEstimatedCompletionDate(Date estimatedCompletionDate) {
		this.estimatedCompletionDate = estimatedCompletionDate;
	}

	public float getTotalJobCost() {
		return totalJobCost;
	}

	public void setTotalJobCost(float totalJobCost) {
		this.totalJobCost = totalJobCost;
	}

	public List<JobPlanProductStock> getJobPlanProductStock() {
		return jobPlanProductStock;
	}

	public void setJobPlanProductStock(List<JobPlanProductStock> jobPlanProductStock) {
		this.jobPlanProductStock = jobPlanProductStock;
	}

	public JobPlan getJobPlan() {
		return jobPlan;
	}

	public void setJobPlan(JobPlan jobPlan) {
		this.jobPlan = jobPlan;
	}

	public float getQty() {
		return qty;
	}

	public void setQty(float qty) {
		this.qty = qty;
	}

	public float getRemaninQty() {
		return remaninQty;
	}

	public void setRemaninQty(float remaninQty) {
		this.remaninQty = remaninQty;
	}

	public ProductsForDesignCostSheet getProductsForDesignCostSheet() {
		return productsForDesignCostSheet;
	}

	public void setProductsForDesignCostSheet(ProductsForDesignCostSheet productsForDesignCostSheet) {
		this.productsForDesignCostSheet = productsForDesignCostSheet;
	}

	public JobPlanProducts getJobPlanProducts() {
		return jobPlanProducts;
	}

	public void setJobPlanProducts(JobPlanProducts jobPlanProducts) {
		this.jobPlanProducts = jobPlanProducts;
	}

}
