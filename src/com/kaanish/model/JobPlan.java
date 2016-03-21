package com.kaanish.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Cacheable;
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
	@Temporal(TemporalType.TIMESTAMP)
	private Date planDate;
	private String description;
	private int qty;
	private float estimatedCost;//sample cost * qty
	private float totalJobExpanse;
	private float totalProductCost;
	private float totalExpanse;
	private boolean isComplete;

	@ManyToOne
	@JoinColumn(name = "costSheetId")
	private SampleDesignCostSheet designCostSheet;

	@OneToMany(mappedBy = "jobPlan")
	private List<JobPlanProductStock> jobPlanProductStocks;

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

	public void setJobPlanProductStocks(List<JobPlanProductStock> jobPlanProductStocks) {
		this.jobPlanProductStocks = jobPlanProductStocks;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

}
