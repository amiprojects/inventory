package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class JobPlanProducts implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private float qty;
	private float remainingQty;// same as qty
	private float totalProductCost;
	private int jobCycle;// 0
	private boolean isUndergoingProcess;// false
	private boolean isComplete;// false

	@OneToMany(mappedBy = "jobPlanProducts")
	private List<JobPlanJobStock> JobPlanJobStock;

	@OneToMany(mappedBy = "jobPlanProducts")
	private List<JobRecieveProductsDetails> jobRecieveProductsDetails;

	@ManyToOne
	@JoinColumn(name = "planId")
	private JobPlan jobPlan;

	@OneToMany(mappedBy = "jobPlanProducts")
	private List<JobPlanProductStock> jobPlanProductStock;

	@OneToMany(mappedBy = "jobPlanProducts")
	private List<JobAssignmentProducts> jobAssignmentProducts;

	@ManyToOne
	@JoinColumn(name = "ProductsForDesignCostSheetId")
	private ProductsForDesignCostSheet productsForDesignCostSheet;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getJobCycle() {
		return jobCycle;
	}

	public void setJobCycle(int jobCycle) {
		this.jobCycle = jobCycle;
	}

	public boolean isUndergoingProcess() {
		return isUndergoingProcess;
	}

	public void setUndergoingProcess(boolean isUndergoingProcess) {
		this.isUndergoingProcess = isUndergoingProcess;
	}

	public boolean isComplete() {
		return isComplete;
	}

	public void setComplete(boolean isComplete) {
		this.isComplete = isComplete;
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

	public float getRemainingQty() {
		return remainingQty;
	}

	public void setRemainingQty(float remainingQty) {
		this.remainingQty = remainingQty;
	}

	public ProductsForDesignCostSheet getProductsForDesignCostSheet() {
		return productsForDesignCostSheet;
	}

	public void setProductsForDesignCostSheet(
			ProductsForDesignCostSheet productsForDesignCostSheet) {
		this.productsForDesignCostSheet = productsForDesignCostSheet;
	}

	public List<JobAssignmentProducts> getJobAssignmentProducts() {
		return jobAssignmentProducts;
	}

	public void setJobAssignmentProducts(
			List<JobAssignmentProducts> jobAssignmentProducts) {
		this.jobAssignmentProducts = jobAssignmentProducts;
	}

	public List<JobPlanProductStock> getJobPlanProductStock() {
		return jobPlanProductStock;
	}

	public void setJobPlanProductStock(
			List<JobPlanProductStock> jobPlanProductStock) {
		this.jobPlanProductStock = jobPlanProductStock;
	}

	public float getTotalProductCost() {
		return totalProductCost;
	}

	public void setTotalProductCost(float totalProductCost) {
		this.totalProductCost = totalProductCost;
	}

	public List<JobRecieveProductsDetails> getJobRecieveProductsDetails() {
		return jobRecieveProductsDetails;
	}

	public void setJobRecieveProductsDetails(
			List<JobRecieveProductsDetails> jobRecieveProductsDetails) {
		this.jobRecieveProductsDetails = jobRecieveProductsDetails;
	}

	public List<JobPlanJobStock> getJobPlanJobStock() {
		return JobPlanJobStock;
	}

	public void setJobPlanJobStock(List<JobPlanJobStock> jobPlanJobStock) {
		JobPlanJobStock = jobPlanJobStock;
	}

}
