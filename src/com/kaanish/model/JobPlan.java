package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Cacheable(false)
public class JobPlan implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	@Temporal(TemporalType.DATE)
	private Date planDate;
	private String description;
	private float qty;
	private float estimatedCost;// sample cost * qty
	private float totalJobExpanse;// 0
	private float totalProductCost;// purchaseproddet->prodqty*amount
	private float totalExpanse;
	private boolean isComplete;// false

	@ManyToOne
	@JoinColumn(name = "costSheetId")
	private SampleDesignCostSheet designCostSheet;

	@OneToMany(mappedBy = "jobPlan", cascade = CascadeType.ALL)
	private List<JobAssignmentJobDetails> jobAssignmentJobDetails;

	@OneToMany(mappedBy = "jobPlan", cascade = CascadeType.ALL)
	private List<JobPlanProductStock> jobPlanProductStocks;

	@OneToMany(mappedBy = "jobPlan", cascade = CascadeType.ALL)
	private List<JobPlanProducts> jobPlanProducts;

	@OneToMany(mappedBy = "jobPlan", cascade = CascadeType.ALL)
	private List<JobAssignmentProducts> jobAssignmentProducts;

	@OneToMany(mappedBy = "jobPlan", cascade = CascadeType.ALL)
	private List<JobAssignmentDetails> jobAssignmentDetails;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getPlanDate() {
		return planDate;
	}

	public void setPlanDate(Date planDate) {
		this.planDate = planDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getEstimatedCost() {
		return estimatedCost;
	}

	public void setEstimatedCost(float estimatedCost) {
		this.estimatedCost = estimatedCost;
	}

	public float getTotalJobExpanse() {
		return totalJobExpanse;
	}

	public void setTotalJobExpanse(float totalJobExpanse) {
		this.totalJobExpanse = totalJobExpanse;
	}

	public float getTotalProductCost() {
		return totalProductCost;
	}

	public void setTotalProductCost(float totalProductCost) {
		this.totalProductCost = totalProductCost;
	}

	public float getTotalExpanse() {
		return totalExpanse;
	}

	public void setTotalExpanse(float totalExpanse) {
		this.totalExpanse = totalExpanse;
	}

	public boolean isComplete() {
		return isComplete;
	}

	public void setComplete(boolean isComplete) {
		this.isComplete = isComplete;
	}

	public SampleDesignCostSheet getDesignCostSheet() {
		return designCostSheet;
	}

	public void setDesignCostSheet(SampleDesignCostSheet designCostSheet) {
		this.designCostSheet = designCostSheet;
	}

	public List<JobPlanProductStock> getJobPlanProductStocks() {
		return jobPlanProductStocks;
	}

	public void setJobPlanProductStocks(
			List<JobPlanProductStock> jobPlanProductStocks) {
		this.jobPlanProductStocks = jobPlanProductStocks;
	}

	public List<JobAssignmentDetails> getJobAssignmentDetails() {
		return jobAssignmentDetails;
	}

	public void setJobAssignmentDetails(
			List<JobAssignmentDetails> jobAssignmentDetails) {
		this.jobAssignmentDetails = jobAssignmentDetails;
	}

	public List<JobAssignmentProducts> getJobAssignmentProducts() {
		return jobAssignmentProducts;
	}

	public void setJobAssignmentProducts(
			List<JobAssignmentProducts> jobAssignmentProducts) {
		this.jobAssignmentProducts = jobAssignmentProducts;
	}

	public float getQty() {
		return qty;
	}

	public void setQty(float qty) {
		this.qty = qty;
	}

	public List<JobAssignmentJobDetails> getJobAssignmentJobDetails() {
		return jobAssignmentJobDetails;
	}

	public void setJobAssignmentJobDetails(
			List<JobAssignmentJobDetails> jobAssignmentJobDetails) {
		this.jobAssignmentJobDetails = jobAssignmentJobDetails;
	}

	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\", " + "\"isComplete\":\"" + isComplete
				+ "\", " + "\"qty\":\"" + qty + "\", "
				+ "\"totalProductCost\":\"" + totalProductCost + "\", "
				+ "\"totalJobExpanse\":\"" + totalJobExpanse + "\", "
				+ "\"totalExpanse\":\"" + totalExpanse + "\"}";
	}

	public List<JobPlanProducts> getJobPlanProducts() {
		return jobPlanProducts;
	}

	public void setJobPlanProducts(List<JobPlanProducts> jobPlanProducts) {
		this.jobPlanProducts = jobPlanProducts;
	}

}
