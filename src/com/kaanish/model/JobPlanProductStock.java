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
	private int qty;
	private int remainingQty;//same as qty
	private int jobCycle;//0
	private float totalJobCost;//0
	private boolean isUndergoingProcess;//false
	private boolean isComplete;//false
	private int jobAssignQty;//new

	@ManyToOne
	@JoinColumn(name = "planId")
	private JobPlan jobPlan;
	@ManyToOne
	@JoinColumn(name = "purchaseProductId")
	private Purchase_Product_Details purchase_Product_Details;
	/*@OneToMany(mappedBy = "jobPlanProductStock")
	private List<JobAssignmentProducts> jobAssignmentProducts;*/
	
	@ManyToOne
	@JoinColumn(name = "jobAssignmentProductsId")
	private JobAssignmentProducts jobAssignmentProducts;

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

	public int getRemainingQty() {
		return remainingQty;
	}

	public void setRemainingQty(int remainingQty) {
		this.remainingQty = remainingQty;
	}

	public int getJobCycle() {
		return jobCycle;
	}

	public void setJobCycle(int jobCycle) {
		this.jobCycle = jobCycle;
	}

	public float getTotalJobCost() {
		return totalJobCost;
	}

	public void setTotalJobCost(float totalJobCost) {
		this.totalJobCost = totalJobCost;
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

	public int getJobAssignQty() {
		return jobAssignQty;
	}

	public void setJobAssignQty(int jobAssignQty) {
		this.jobAssignQty = jobAssignQty;
	}

	public Purchase_Product_Details getPurchase_Product_Details() {
		return purchase_Product_Details;
	}

	public void setPurchase_Product_Details(Purchase_Product_Details purchase_Product_Details) {
		this.purchase_Product_Details = purchase_Product_Details;
	}

	/*public List<JobAssignmentProducts> getJobAssignmentProducts() {
		return jobAssignmentProducts;
	}

	public void setJobAssignmentProducts(List<JobAssignmentProducts> jobAssignmentProducts) {
		this.jobAssignmentProducts = jobAssignmentProducts;
	}*/

}
