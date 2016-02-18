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
public class JobPlanProductStock implements Serializable {
//purchase product wise
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private float qty;
	private float remainingQty;//same as qty
	private int jobCycle;//0
	private boolean isUndergoingProcess;//false
	private boolean isComplete;//false
	private float jobAssignQty;//new

	@ManyToOne
	@JoinColumn(name = "planId")
	private JobPlan jobPlan;
	
	@ManyToOne
	@JoinColumn(name = "purchaseProductId")
	private Purchase_Product_Details purchase_Product_Details;
	/*@OneToMany(mappedBy = "jobPlanProductStock")
	private List<JobAssignmentProducts> jobAssignmentProducts;*/
	
	@OneToMany(mappedBy = "jobPlanProductStock")
	private List<JobAsignmentProductsFromStock> jobAsignmentProductsFromStock;
	
	@ManyToOne
	@JoinColumn(name = "jobAssignmentProductsId")
	private JobAssignmentProducts jobAssignmentProducts;
	
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

	public JobAssignmentProducts getJobAssignmentProducts() {
		return jobAssignmentProducts;
	}

	public void setJobAssignmentProducts(JobAssignmentProducts jobAssignmentProducts) {
		this.jobAssignmentProducts = jobAssignmentProducts;
	}

	

	public float getJobAssignQty() {
		return jobAssignQty;
	}

	public void setJobAssignQty(float jobAssignQty) {
		this.jobAssignQty = jobAssignQty;
	}

	public List<JobAsignmentProductsFromStock> getJobAsignmentProductsFromStock() {
		return jobAsignmentProductsFromStock;
	}

	public void setJobAsignmentProductsFromStock(
			List<JobAsignmentProductsFromStock> jobAsignmentProductsFromStock) {
		this.jobAsignmentProductsFromStock = jobAsignmentProductsFromStock;
	}

	public Purchase_Product_Details getPurchase_Product_Details() {
		return purchase_Product_Details;
	}

	public void setPurchase_Product_Details(Purchase_Product_Details purchase_Product_Details) {
		this.purchase_Product_Details = purchase_Product_Details;
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

	public void setProductsForDesignCostSheet(ProductsForDesignCostSheet productsForDesignCostSheet) {
		this.productsForDesignCostSheet = productsForDesignCostSheet;
	}

	/*public List<JobAssignmentProducts> getJobAssignmentProducts() {
		return jobAssignmentProducts;
	}

	public void setJobAssignmentProducts(List<JobAssignmentProducts> jobAssignmentProducts) {
		this.jobAssignmentProducts = jobAssignmentProducts;
	}*/

}
